using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS.CityAffairs
{
    public partial class Courts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCity.DataBind();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            sdsCourts.Insert();
        }

        protected void gvCourts_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtName.Text = gvCourts.SelectedRow.Cells[1].Text;
            //txtNotes.Text = gvCourts.SelectedRow.Cells[2].Text;  
        }
    }
}