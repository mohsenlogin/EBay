using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LMS.Controller;

namespace LMS
{
    public partial class AddLegalDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)        
        {
             if (!IsPostBack)
            {
                if (Request.QueryString["Step"] != null)
                {
                    int step = int.Parse(Request.QueryString["Step"]);
                    if (step >= 1 && step <= 4)
                        mvAddLegalDoc.ActiveViewIndex = step - 1;
                }
                else
                {
                    // if this is not a returning incomplete form, show first step
                    mvAddLegalDoc.ActiveViewIndex = 0;
                }
            }
           
             if (mvAddLegalDoc.ActiveViewIndex == 0)
             {
                 DataView dvLegalDocInfo = ((DataView)sdsLegalDocument.Select(DataSourceSelectArguments.Empty));
                 DataTable dtLegalDocInfo = null;
                 if (dvLegalDocInfo != null)
                     dtLegalDocInfo = dvLegalDocInfo.Table;
                 if (dtLegalDocInfo != null && dtLegalDocInfo.Rows.Count == 1 && dtLegalDocInfo.Rows[0] != null)
                 {
                     txtTitle.Text = dtLegalDocInfo.Rows[0]["Title"].ToString();
                     txtNumber.Text = dtLegalDocInfo.Rows[0]["Number"].ToString();
                     if (dtLegalDocInfo.Rows[0]["PrepareDate"] != null)
                         txtPrepareDate.Text = Utilities.convertGeorgianDateToPersian(dtLegalDocInfo.Rows[0]["PrepareDate"].ToString());
                     ddlType.SelectedValue = dtLegalDocInfo.Rows[0]["Type"].ToString();
                     ddlCategory.SelectedValue = dtLegalDocInfo.Rows[0]["CategoryRef"].ToString();
                     ddlCourt.SelectedValue = dtLegalDocInfo.Rows[0]["CourtRef"].ToString();
                     ddlRelatedMunicipality.SelectedValue = dtLegalDocInfo.Rows[0]["MunicipalityRef"].ToString();
                     if (dtLegalDocInfo.Rows[0]["AnnounceDate"] != null)
                         txtAnnounceDate.Text = Utilities.convertGeorgianDateToPersian(dtLegalDocInfo.Rows[0]["AnnounceDate"].ToString());
                     txtReceiver.Text = dtLegalDocInfo.Rows[0]["Reciever"].ToString();
                     if (dtLegalDocInfo.Rows[0]["CourtRoomDate"] != null)
                         txtCourtDate.Text = Utilities.convertGeorgianDateToPersian(dtLegalDocInfo.Rows[0]["CourtRoomDate"].ToString());
                     if (dtLegalDocInfo.Rows[0]["IndicatorRegisterDate"] != null)
                         txtIndicatorRegisterDate.Text = Utilities.convertGeorgianDateToPersian(dtLegalDocInfo.Rows[0]["IndicatorRegisterDate"].ToString());
                     ddlWorkflueStatus.SelectedValue = dtLegalDocInfo.Rows[0]["WorkflueStatus"].ToString();
                     txtSummary.Text = dtLegalDocInfo.Rows[0]["Summary"].ToString();
                 }
             }
             else if (mvAddLegalDoc.ActiveViewIndex == 3)
             {
                 
             }
           
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            //todo: check if there is any problem with user data
            //-----------------------------//uncomment
            if (!string.IsNullOrEmpty(txtPrepareDate.Text))
            {
                sdsLegalDocument.InsertParameters.Add("PrepareDate", Utilities.convertPersianDateToGeorgian(txtPrepareDate.Text).ToString("yyyy-MM-dd hh:mm"));
            }
            if (!string.IsNullOrEmpty(txtAnnounceDate.Text))
            {
                sdsLegalDocument.InsertParameters.Add("AnnounceDate", Utilities.convertPersianDateToGeorgian(txtAnnounceDate.Text).ToString("yyyy-MM-dd hh:mm"));
            }

            if (!string.IsNullOrEmpty(txtCourtDate.Text))
            {
                sdsLegalDocument.InsertParameters.Add("CourtRoomDate", Utilities.convertPersianDateToGeorgian(txtAnnounceDate.Text).ToString("yyyy-MM-dd hh:mm"));
            }
            if (!string.IsNullOrEmpty(txtIndicatorRegisterDate.Text))
            {
                sdsLegalDocument.InsertParameters.Add("IndicatorRegisterDate", Utilities.convertPersianDateToGeorgian(txtIndicatorRegisterDate.Text).ToString("yyyy-MM-dd hh:mm"));
            }
            else
            {
                sdsLegalDocument.InsertParameters.Add("IndicatorRegisterDate", null);
            }

            if (!string.IsNullOrEmpty(txtAnnounceToAgentDate.Text))
            {
                sdsLegalDocument.InsertParameters.Add("AnnounceToAgentDate", Utilities.convertPersianDateToGeorgian(txtAnnounceToAgentDate.Text).ToString("yyyy-MM-dd hh:mm"));
            }
            else
            {
                sdsLegalDocument.InsertParameters.Add("AnnounceToAgentDate", null);
            }

            sdsLegalDocument.InsertParameters.Add("AnnounceToAgentDate", null);

            Session["LDId"] = sdsLegalDocument.Insert();
            //uncomment-----------------------

             //"3";
            
            mvAddLegalDoc.ActiveViewIndex = 1;
        }

        protected void btnAddPerson_Click(object sender, EventArgs e)
        {
            sdsPerson.Insert();
        }

        protected void btnAddExistingPerson_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnGoGeneralInfo_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 0;
        }

        protected void gvPersons_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["LDId"] != null && gvPersons.SelectedValue != null)
            {
                sdsComplainants.InsertParameters.Clear();
                sdsComplainants.InsertParameters.Add("LegalDocumentRef", Session["LDId"].ToString());
                sdsComplainants.InsertParameters.Add("PersonRef", System.Data.DbType.Int32, gvPersons.SelectedValue.ToString());
                sdsComplainants.InsertParameters.Add("LegalPersonalityRef", null);
                sdsComplainants.InsertParameters.Add("MunicipalityRef", null);
                //sdsComplainants.InsertParameters.Add("ID", null);
                try
                {
                    sdsComplainants.Insert();
                }
                catch (SqlException sqlex)
                {
                    throw sqlex;
                }
            }
        }

        protected void sdsLegalDocument_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //get id of inserted record and Save it in session, use encryption if required
            Session["LDId"] = e.Command.Parameters["@Id"].Value;
        }

        protected void btnAddMunicipality_Click(object sender, EventArgs e)
        {
            if (Session["LDId"] != null && ddlMunicipalities.SelectedValue != null)
            {
                sdsComplainants.InsertParameters.Clear();
                sdsComplainants.InsertParameters.Add("LegalDocumentRef", Session["LDId"].ToString());
                sdsComplainants.InsertParameters.Add("MunicipalityRef", System.Data.DbType.Int32, ddlMunicipalities.SelectedValue.ToString());
                sdsComplainants.InsertParameters.Add("LegalPersonalityRef", null);
                sdsComplainants.InsertParameters.Add("PersonRef", null);
                sdsComplainants.Insert();
            }
        }

        protected void btnAddLegalPersonality_Click(object sender, EventArgs e)
        {
            if (Session["LDId"] != null)
            {
                sdsLegalPersonalities.Insert();
                
            }
        }

        protected void sdsLegalPersonalities_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (!string.IsNullOrEmpty(e.Command.Parameters["@Id"].Value.ToString() ))
            {
                sdsComplainants.InsertParameters.Clear();
                sdsComplainants.InsertParameters.Add("MunicipalityRef", null);
                sdsComplainants.InsertParameters.Add("LegalPersonalityRef", e.Command.Parameters["@Id"].Value.ToString());
                sdsComplainants.InsertParameters.Add("PersonRef", null);
                sdsComplainants.InsertParameters.Add("LegalDocumentRef", Session["LDId"].ToString());
                sdsComplainants.Insert();
            }

        }

        protected void btnAddMunicipalityInvited_Click(object sender, EventArgs e)
        {

        }

        protected void btnGoAttachements_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 2;
        }

        protected void btnUploadAttachement_Click(object sender, EventArgs e)
        {
            if (fuAttachements.HasFile)
            {
                if (fuAttachements.FileBytes.Length <= 409600)
                {
                    if (Session["LDId"] != null)
                    {
                        try
                        {
                            // upload physical file to server
                            string imagePath = Server.MapPath("~") + "Images" + Path.DirectorySeparatorChar + "UploadedFiles" + Path.DirectorySeparatorChar + Session["LDId"].ToString();
                            if (!Directory.Exists(imagePath))
                            {
                                Directory.CreateDirectory(imagePath);
                            }
                            fuAttachements.PostedFile.SaveAs(imagePath);

                            // now insert attachement record info in db

                            sdsAttachements.InsertParameters.Clear();
                            sdsAttachements.InsertParameters.Add("LegalDocumentId", Session["LDId"].ToString());
                            sdsAttachements.InsertParameters.Add("Type", Path.GetExtension(fuAttachements.FileName));
                            sdsAttachements.InsertParameters.Add("Url", fuAttachements.FileName);
                            sdsAttachements.Insert();
                            lblMessage.ForeColor = Color.Green;
                            lblMessage.Text = "فایل با موفقیت ارسال شد";
                        }
                        catch (UnauthorizedAccessException uae)
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Text = "خطای دسترسی و ذخیره سازی";
                        }
                        catch (IOException ioex)
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Text = "در ارسال فایل مشکلی به وجود آمده است.";
                        }

                    }
                }
                else
                {
                    lblMessage.Text = "حجم فایل پیوست بیش از اندازه مجاز است";
                }
            }
        }

        protected void btnViewSummary_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 4;
        }

        protected void btnGoComplementaryInfo_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 1;
        }

        protected void sdsPerson_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void btnSessionsFinish_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 4;
        }

        protected void btnSessionsNext_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 3;
        }

        protected void btnSummaryPrevious_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 3;
        }

        protected void btnSessionsPrevious_Click(object sender, EventArgs e)
        {
            mvAddLegalDoc.ActiveViewIndex = 2;
        }

        protected void btnAddSession_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSessionCourtDate.Text))
            {
                sdsSessions.InsertParameters["CourtDate"].DefaultValue= Utilities.convertPersianDateToGeorgian(txtSessionCourtDate.Text).ToString("yyyy-MM-dd hh:mm");
            }
           

            if (!string.IsNullOrEmpty(txtReferToExpertDate.Text))
            {
                sdsSessions.InsertParameters["ReferToExpertDate"].DefaultValue =  Utilities.convertPersianDateToGeorgian(txtReferToExpertDate.Text).ToString("yyyy-MM-dd hh:mm");
            }
            else
            {
                sdsSessions.InsertParameters["ReferToExpertDate"].DefaultValue= null;
            }

            if (!string.IsNullOrEmpty(txtProtestVerdictDate.Text))
            {
                sdsSessions.InsertParameters["ProtestVerdictDate"].DefaultValue  = Utilities.convertPersianDateToGeorgian(txtProtestVerdictDate.Text).ToString("yyyy-MM-dd hh:mm");
            }
            else
            {
                sdsSessions.InsertParameters["ProtestVerdictDate"].DefaultValue = null;
            }
            if (!string.IsNullOrEmpty(txtExpertVerdictAnnounceDate.Text))
            {
                sdsSessions.InsertParameters["ExpertVerdictAnnounceDate"].DefaultValue = Utilities.convertPersianDateToGeorgian(txtExpertVerdictAnnounceDate.Text).ToString("yyyy-MM-dd hh:mm");
            }
            else
            {
                sdsSessions.InsertParameters["ExpertVerdictAnnounceDate"].DefaultValue = null;
            }
            if (!string.IsNullOrEmpty(txtFinalVerdictDate.Text))
            {
                sdsSessions.InsertParameters["FinalVerdictDate"].DefaultValue = Utilities.convertPersianDateToGeorgian(txtFinalVerdictDate.Text).ToString("yyyy-MM-dd hh:mm");
            }
            else
            {
                sdsSessions.InsertParameters["FinalVerdictDate"].DefaultValue =  null;
            }
            
            sdsSessions.Insert();
            lblSessionsMessage.ForeColor = Color.Green;
            lblSessionsMessage.Text = "اطلاعات جلسه دادگاه با موفقیت به لیست اضافه شد";
        }

        protected void gvCourtSessions_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            sdsSessions.DeleteParameters["Id"].DefaultValue = e.Keys[0].ToString();
        }

        protected void gvCourtSessions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count >= 11)
            {
                //try
                {
                    if (e.Row.RowIndex != -1)
                    {
                        if (!string.IsNullOrEmpty(e.Row.Cells[2].Text) && e.Row.Cells[2].Text != "&nbsp;")
                        {
                            e.Row.Cells[2].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[2].Text));
                        }
                        if (!string.IsNullOrEmpty(e.Row.Cells[3].Text) && e.Row.Cells[3].Text != "&nbsp;")
                        {
                            e.Row.Cells[3].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[3].Text));
                        }
                        if (!string.IsNullOrEmpty(e.Row.Cells[5].Text) && e.Row.Cells[5].Text != "&nbsp;")
                        {
                            e.Row.Cells[5].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[5].Text));
                        }
                        if (!string.IsNullOrEmpty(e.Row.Cells[7].Text) && e.Row.Cells[7].Text != "&nbsp;")
                        {
                            e.Row.Cells[5].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[7].Text));
                        }
                        if (!string.IsNullOrEmpty(e.Row.Cells[8].Text) && e.Row.Cells[8].Text != "&nbsp;")
                        {
                            e.Row.Cells[8].Text = Utilities.convertGeorgianDateToPersian(DateTime.Parse(e.Row.Cells[8].Text));
                        }
                        //if (!string.IsNullOrEmpty(e.Row.Cells[7].Text) && e.Row.Cells[7].Text != "&nbsp;" &&
                        //    e.Row.Cells[7].Text == "در حال برگزاری دادگاه")
                        //{
                        //    e.Row.Cells[7].BackColor = Color.Orange;
                        //}
                    }
                }
                //catch (FormatException fe)
                {

                }
            }
        }

        protected void gvCourtSessions_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            lblSessionsMessage.ForeColor = Color.Green;
            lblSessionsMessage.Text = "اطلاعات جلسه دادگاه حذف شد";
        }

        

       
    }
}