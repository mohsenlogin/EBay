using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMS.Controller;

namespace LMS.CityAffairs
{
    public partial class AllLegalDocs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ddlMunicipality.SelectedValue = Session["OId"].ToString();
            }
            catch (Exception ex) 
            { 
                // ignore, no ploblem sir! 
            }
            sdsLegalDocs.DataBind();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Search"]))
                {
                    txtSearch.Text = Uri.UnescapeDataString(Request.QueryString["Search"]);
                }
            }
        }

        protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void gvLegalDocs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count >= 5)
            {
                //try
                {
                    //if (!string.IsNullOrEmpty(e.Row.Cells[5].Text) && e.Row.Cells[5].Text != "&nbsp;")
                    //{
                    //    e.Row.Cells[5].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[5].Text));
                    //}
                    if (!string.IsNullOrEmpty(e.Row.Cells[7].Text) && e.Row.Cells[7].Text != "&nbsp;")
                    {
                        e.Row.Cells[7].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[7].Text));

                    }
                    //if (!string.IsNullOrEmpty(e.Row.Cells[9].Text) && e.Row.Cells[9].Text != "&nbsp;")
                    //{
                    //    e.Row.Cells[9].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[9].Text));
                    //}
                    if (!string.IsNullOrEmpty(e.Row.Cells[4].Text) && e.Row.Cells[4].Text != "&nbsp;" &&
                        e.Row.Cells[4].Text == "در حال برگزاری دادگاه")
                    {
                        e.Row.Cells[4].BackColor = Color.Orange;
                    }
                }
                //catch (FormatException fe)
                {

                }
            }
        }

        protected void gvLegalDocs_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            var queryStrings = HttpUtility.ParseQueryString(Request.QueryString.ToString());

            if (e.CommandName == "EditRecord")
            {
                int rowIndex = int.Parse(e.CommandArgument.ToString());
                queryStrings.Set("DocId", gvLegalDocs.DataKeys[rowIndex]["Id"].ToString());
                Response.Redirect("~/AddLegalDoc.aspx?" + queryStrings);
            }
            else if (e.CommandName == "CourtSessions")
            {
                int rowIndex = int.Parse(e.CommandArgument.ToString());
                queryStrings.Set("DocId", gvLegalDocs.DataKeys[rowIndex]["Id"].ToString());
                Session["LDId"] = gvLegalDocs.DataKeys[rowIndex]["Id"].ToString();
                queryStrings.Set("Step", "4");
                Response.Redirect("~/AddLegalDoc.aspx?" + queryStrings);
            }
        }

        protected void gvLegalDocs_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void ddlMunicipality_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["OId"] = ddlMunicipality.SelectedValue;
            sdsLegalDocs.DataBind();
        }
    }
}