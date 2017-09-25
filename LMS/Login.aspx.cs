using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMS.Controller;
using LMS.Model;

namespace LMS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.NavigationBar.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // validate the Captcha to check we're not dealing with a bot
            bool isHuman = capLogin.Validate(txtCaptchaCode.Text);

            txtCaptchaCode.Text = null; // clear previous user input

            //if (isHuman)
            {
                
                string token = Encryption.toSha1(txtPassword.Text);
                usp_getUserInfo_Result userInfo = Controller.Membership.checkLogin(txtUsername.Text,token);
                if (userInfo != null)
                {
                    Session["Code"] = txtUsername.Text;
                    Session["To"] = token;
                    Session["UId"] = userInfo.Id;
                    Session["OId"] = userInfo.OfficeId;
                    Session["Municipality"] = userInfo.Name;
                    Session["RName"] = userInfo.RoleName;

                    if (Request.QueryString["RedirectUrl"] != null)
                    {
                        Response.Redirect("~" + Request.QueryString["RedirectUrl"]);
                    }
                    else if(userInfo.RoleName == Constants.ROLES.LegalAgent)
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else if (userInfo.RoleName == Constants.ROLES.CityAfairs)
                    {
                        Response.Redirect("~/CityAffairs/Default.aspx");
                    }
                }
            }
            //else
            {
                // count up wrong login retry count
            }
            
        }
    }
}