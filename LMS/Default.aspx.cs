using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSearch.Focus();
        }

        protected void ibtnSearch_Command(object sender, CommandEventArgs e)
        {

        }

        protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
            nameValues.Set("Search", Uri.EscapeDataString(txtSearch.Text));
           
            Response.Redirect( "~/LegalDocs.aspx?" + nameValues); 

            
        }

        
    }
}