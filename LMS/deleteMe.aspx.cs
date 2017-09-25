using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS
{
    public partial class deleteMe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            if (txtCode.Text == "letmepass")
            {
                lblMessage.Text = LMS.Controller.Encryption.toSha1(txtInputText.Text);
            }
        }
    }
}