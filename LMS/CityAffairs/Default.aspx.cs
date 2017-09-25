using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS.CityAffairs
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSearch.Focus();
        }

        protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
            nameValues.Set("Search", Uri.EscapeDataString(txtSearch.Text));

            Response.Redirect("~/CityAffairs/AllLegalDocs.aspx?" + nameValues); 
        }

        protected void ddlMunicipality_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["OId"] = ddlMunicipality.SelectedValue;
        }
    }
}