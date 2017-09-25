using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS.CityAffairs
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

        }

        protected void gvCategories_SelectedIndexChanged(object sender, EventArgs e)
        {

            txtName.Text =  gvCategories.SelectedRow.Cells[1].Text;
            txtNotes.Text = gvCategories.SelectedRow.Cells[2].Text;                

        }
    }
}