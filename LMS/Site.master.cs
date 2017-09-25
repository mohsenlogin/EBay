using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LMS
{
    public partial class Site : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        public HtmlTable NavigationBar
        {
            get
            {
                return tblNavigationMenu;
            }
            set
            {
                tblNavigationMenu = value;
            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // if user is not logged in
            if (Session["Code"] == null || Session["To"] == null || Session["UId"] == null)
            {
                if (!Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath).Equals("Login"))
                {
                    var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                    nameValues.Set("RedirectUrl", Request.Url.PathAndQuery);
                    Response.Redirect("~/Login.aspx?" + nameValues);
                }
            }
            // if user is logged in
            if (Session["Code"] != null && Session["To"] != null && Session["UId"] != null)
            {
                User user = Controller.Membership.getUser(int.Parse(Session["UId"].ToString()));
                lblLoginText.Text = user.Person.FirstName + " " + user.Person.LastName + " خوش آمده اید";
                lbtnLoginLogout.Text = "خروج از سیستم";
                if (Session["RName"] != null && Session["Municipality"] != null)
                {
                    lblUserInfo.Text = " " + Session["RName"].ToString() + " از " + Session["Municipality"].ToString();
                    lblUserInfo.Visible = true;
                }

                List<UserRole> roles = Controller.Membership.getRoles(int.Parse(Session["UId"].ToString()));
                if (!Controller.Membership.hasAccessToUrl(roles, Request.Url.LocalPath))
                {
                    // user has not access to current page
                    if (!Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath).Equals("Login"))
                    {
                        var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                        nameValues.Set("RedirectUrl",Request.Url.PathAndQuery );
                        Response.Redirect("~/Login.aspx?" + nameValues);                         
                    }
                    // so user has access to url
                } 
            }
        }

        protected void lbtnLoginLogout_Click(object sender, EventArgs e)
        {
            if (Session["Code"] != null && Session["To"] != null)
            {
                if (Controller.Membership.checkLogin(Session["Code"].ToString(), Session["To"].ToString()) != null)
                {
                    Session.Clear();
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
        }
    
    }
}