using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Microsoft.ApplicationBlocks.Data;
namespace LMS.CityAffairs
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string thisConnectionString =
       ConfigurationManager.ConnectionStrings["LegalMSConnectionString"].ConnectionString;        

        ///public SqlParameter[] SearchValue = new SqlParameter[1];
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //ReportViewer1.Visible is set to false in design mode
            ReportViewer1.Visible = true;
            SqlConnection thisConnection = new SqlConnection(thisConnectionString);
            System.Data.DataSet thisDataSet = new System.Data.DataSet();
            ///SearchValue[0] = new SqlParameter("@MunicipalityId", ddlMunicipality.SelectedValue);

            /* Put the stored procedure result into a dataset */
            thisDataSet = SqlHelper.ExecuteDataset(thisConnection, "usp_getLegalDocsReport" /* SearchValue*/);

            /*or   thisDataSet = SqlHelper.ExecuteDataset(thisConnection, 
                   "ShowProductByCategory", dropdownlist1.selectedvalue); 
                   if you only have 1 input parameter  */

            /* Associate thisDataSet  (now loaded with the stored 
               procedure result) with the  ReportViewer datasource */
            ReportDataSource datasource = new
              ReportDataSource("DataSet1",
              thisDataSet.Tables[0]);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource);
            if (thisDataSet.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "Sorry, no products under this category!";
            }

            ReportViewer1.LocalReport.Refresh();
        }
    }
}