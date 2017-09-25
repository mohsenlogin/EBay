<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddLegalDoc.aspx.cs" Inherits="LMS.AddLegalDoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2
        {
            text-align: left;
            height: 22px;
        }
        .auto-style3
        {
            height: 22px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("btnShowAddMunicipality").click(function () {
                $("divAddMunicipality").animate({
                    height: 'toggle'
                });
            });
        });
        $('divAddMunicipality').animate({ height: 'toggle' });
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server"><asp:MultiView ID="mvAddLegalDoc" runat="server">
    <asp:View ID="viwMainInfo" runat="server">
        <table style="text-align:center" >
        <tr>
            <td>&nbsp;</td>
            <td>
                
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"  CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ToolTip="اطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="PrimaryData" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="تعیین عنوان پرونده ضروری است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="تیتر پرونده" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                عنوان پرونده:</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="formControls"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvAnnounceDate" runat="server" ControlToValidate="txtAnnounceDate" ErrorMessage="تاریخ ابلاغ را مشخص ننموده اید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                تاریخ ابلاغ:</td>
            <td>
                <asp:TextBox ID="txtAnnounceDate" runat="server" CssClass="formControls"  onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="rfvNumber" runat="server" ControlToValidate="txtNumber" ErrorMessage="لطفاً شماره پرونده حقوقی را مشخص نمایید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                شماره پرونده:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtNumber" runat="server" CssClass="formControls"></asp:TextBox>
            </td>
            <td class="auto-style3">
                تاریخ ثبت در اندیکاتور:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtIndicatorRegisterDate" runat="server" CssClass="formControls" onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
        </tr>        
        <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvReceiver" runat="server" ControlToValidate="txtReceiver" ErrorMessage="نام دریافت کننده ابلاغ را مشخص نمایید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                دریافت کننده ابلاغ:</td>
            <td>
                <asp:TextBox ID="txtReceiver" runat="server" CssClass="formControls"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCourtRoomDate" runat="server" ControlToValidate="txtCourtDate" ErrorMessage="تاریخ دادگاه را نیز مشخص کنید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                تاریخ دادگاه:</td>
            <td>
                <asp:TextBox ID="txtCourtDate" runat="server" CssClass="formControls"  onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvNumber1" runat="server" ControlToValidate="ddlType" ErrorMessage="نوع پرونده انتخاب نشده است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvType" runat="server" ControlToValidate="ddlType" ErrorMessage="نوع پرونده را از لیست انتخاب نمایید" Font-Bold="True" Font-Size="Large" ForeColor="Red" Operator="NotEqual" ValidationGroup="PrimaryData" ValueToCompare="&lt;   انتخاب نوع پرونده   &gt;">*</asp:CompareValidator>
                نوع پرونده:</td>
            <td>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="formControls" Width="100%" Height="35" >
                    <asp:ListItem Selected="True">&lt;   انتخاب نوع پرونده   &gt;</asp:ListItem>
                    <asp:ListItem>کیفری</asp:ListItem>
                    <asp:ListItem>حقوقی</asp:ListItem>
                       <asp:ListItem>اداری</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <br />
                تاریخ ابلاغ به نماینده:<br /> </td>
            <td>
                <asp:TextBox ID="txtAnnounceToAgentDate" runat="server" CssClass="formControls" onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
             </td>
        </tr>
        <tr>
            <td class="tableLabels">
                <asp:LinkButton ID="lbtnCategory" runat="server" CausesValidation="False" Enabled="False">دسته بندی:</asp:LinkButton>
            </td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="formControls" Width="100%" Height="35px"  DataSourceID="sdsCategories" DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Category] ORDER BY [Name]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNumber0" runat="server" ControlToValidate="txtPrepareDate" ErrorMessage="تاریخ تنظیم پرونده باید مشخص شود" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="PrimaryData">*</asp:RequiredFieldValidator>
                تاریخ تنظیم:</td>
            <td>
                <asp:TextBox ID="txtPrepareDate" runat="server" CssClass="formControls" onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
             </td>
        </tr>
       
        <tr>
            <td class="tableLabels">
                <asp:LinkButton ID="lbtnCourt" runat="server" CausesValidation="False" Enabled="False">دادگاه/دادسرا:</asp:LinkButton>
            </td>
            <td>
                <asp:DropDownList ID="ddlCourt" runat="server" CssClass="formControls" Width="100%" Height="35px"  DataSourceID="sdsCourts" DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsCourts" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Court] ORDER BY [Name]"></asp:SqlDataSource>
            </td>
            <td rowspan="2">توضیحات:</td>
            <td rowspan="2">
                <asp:TextBox ID="txtNotes" runat="server" CssClass="formControls" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="tableLabels">
                <asp:CompareValidator ID="cvWorkflueStatus" runat="server" ControlToValidate="ddlWorkflueStatus" ErrorMessage="وضعیت گردش کار انتخاب نشده است" Font-Bold="True" Font-Size="Large" ForeColor="Red" Operator="NotEqual" ValidationGroup="PrimaryData" ValueToCompare="&lt;   انتخاب وضعیت گردش کار   &gt;">*</asp:CompareValidator>
                وضعیت گردش کار:</td>
            <td>
                <asp:DropDownList ID="ddlWorkflueStatus" runat="server" CssClass="formControls"  Height="35" Width="100%">
                    <asp:ListItem Selected="True">&lt;   انتخاب وضعیت گردش کار   &gt;</asp:ListItem>
                    <asp:ListItem>دادگاه تشکیل نشده</asp:ListItem>
                    <asp:ListItem>در حال برگزاری دادگاه</asp:ListItem>
                    <asp:ListItem>رای به له شهرداری</asp:ListItem>
                    <asp:ListItem>رای به علیه شهرداری</asp:ListItem>
                    <asp:ListItem>صرفنظر شده</asp:ListItem>
                    <asp:ListItem>سایر</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
       
            <tr>
                <td class="tableLabels">
                    <asp:LinkButton ID="lbtnMunicipality" runat="server" CausesValidation="False" Enabled="False">مربوط به شهرداری:&nbsp;</asp:LinkButton>
                    <br />
                </td>
                <td>
                    <asp:DropDownList ID="ddlRelatedMunicipality" runat="server" CssClass="formControls" DataSourceID="sdsMunicipalities" DataTextField="Name" DataValueField="Id" Enabled="False"  Height="35px" Width="100%">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsMunicipalities" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Municipality] ORDER BY [Name]"></asp:SqlDataSource>
                </td>
                <td>شماره ابلاغ:</td>
                <td>
                    <asp:TextBox ID="txtAnnounceNo" runat="server" CssClass="formControls"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:right;">
                    <asp:TextBox ID="txtSummary" runat="server" CssClass="formControls" Height="100px" placeholder="خلاصه پرونده" TextMode="MultiLine" Width="99%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableLabels">&nbsp;</td>
                <td>
                    <asp:Button ID="btnNext" runat="server" BackColor="#0099CC" CausesValidation="False" CssClass="bigButton"  OnClick="btnNext_Click" Text="مرحله بعد" ValidationGroup="PrimaryData" Width="90%" />
                </td>
                <td></td>
                <td>
                    <asp:SqlDataSource ID="sdsLegalDocument" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [LegalDocument] WHERE [Id] = @original_Id AND [Title] = @original_Title AND [Number] = @original_Number AND [PrepareDate] = @original_PrepareDate AND (([ArchiveNo] = @original_ArchiveNo) OR ([ArchiveNo] IS NULL AND @original_ArchiveNo IS NULL)) AND [Type] = @original_Type AND [WorkflueStatus] = @original_WorkflueStatus AND (([Cost] = @original_Cost) OR ([Cost] IS NULL AND @original_Cost IS NULL)) AND [MunicipalityRef] = @original_MunicipalityRef AND [CourtRef] = @original_CourtRef AND (([Summary] = @original_Summary) OR ([Summary] IS NULL AND @original_Summary IS NULL)) AND [AnnounceDate] = @original_AnnounceDate AND [Confirmer] = @original_Confirmer AND (([ParentDocRef] = @original_ParentDocRef) OR ([ParentDocRef] IS NULL AND @original_ParentDocRef IS NULL)) AND [Reciever] = @original_Reciever AND (([IndicatorRegisterDate] = @original_IndicatorRegisterDate) OR ([IndicatorRegisterDate] IS NULL AND @original_IndicatorRegisterDate IS NULL)) AND [CourtRoomDate] = @original_CourtRoomDate AND (([AnnounceNo] = @original_AnnounceNo) OR ([AnnounceNo] IS NULL AND @original_AnnounceNo IS NULL)) AND (([AnnounceToAgentDate] = @original_AnnounceToAgentDate) OR ([AnnounceToAgentDate] IS NULL AND @original_AnnounceToAgentDate IS NULL)) AND (([ReferToExpertDate] = @original_ReferToExpertDate) OR ([ReferToExpertDate] IS NULL AND @original_ReferToExpertDate IS NULL)) AND (([ExpertName] = @original_ExpertName) OR ([ExpertName] IS NULL AND @original_ExpertName IS NULL)) AND (([ExpertVerdictAnnounceDate] = @original_ExpertVerdictAnnounceDate) OR ([ExpertVerdictAnnounceDate] IS NULL AND @original_ExpertVerdictAnnounceDate IS NULL)) AND (([ProtestVerdictDate] = @original_ProtestVerdictDate) OR ([ProtestVerdictDate] IS NULL AND @original_ProtestVerdictDate IS NULL)) AND (([VoteProtestDate] = @original_VoteProtestDate) OR ([VoteProtestDate] IS NULL AND @original_VoteProtestDate IS NULL)) AND (([ReconsiderVote] = @original_ReconsiderVote) OR ([ReconsiderVote] IS NULL AND @original_ReconsiderVote IS NULL)) AND [CategoryRef] = @original_CategoryRef AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND [Status] = @original_Status" InsertCommand="INSERT INTO [LegalDocument] ([Title], [Number], [PrepareDate], [ArchiveNo], [Type], [WorkflueStatus], [Cost], [MunicipalityRef], [CourtRef], [Summary], [AnnounceDate], [Confirmer], [ParentDocRef], [Reciever], [IndicatorRegisterDate], [CourtRoomDate], [AnnounceNo], [AnnounceToAgentDate], [ReferToExpertDate], [ExpertName], [ExpertVerdictAnnounceDate], [ProtestVerdictDate], [VoteProtestDate], [ReconsiderVote], [CategoryRef], [Notes], [Status]) VALUES (@Title, @Number, @PrepareDate, @ArchiveNo, @Type, @WorkflueStatus, @Cost, @MunicipalityRef, @CourtRef, @Summary, @AnnounceDate, @Confirmer, @ParentDocRef, @Reciever, @IndicatorRegisterDate, @CourtRoomDate, @AnnounceNo, @AnnounceToAgentDate, @ReferToExpertDate, @ExpertName, @ExpertVerdictAnnounceDate, @ProtestVerdictDate, @VoteProtestDate, @ReconsiderVote, @CategoryRef, @Notes, @Status); SELECT @ID = SCOPE_IDENTITY();" OldValuesParameterFormatString="original_{0}" OnInserted="sdsLegalDocument_Inserted" SelectCommand="SELECT Id, Title, Number, PrepareDate, ArchiveNo, Type, WorkflueStatus, Cost, MunicipalityRef, CourtRef, Summary, AnnounceDate, Confirmer, ParentDocRef, Reciever, IndicatorRegisterDate, CourtRoomDate, AnnounceNo, AnnounceToAgentDate, CategoryRef, Notes, Status FROM LegalDocument WHERE (Id = @Id)" UpdateCommand="UPDATE [LegalDocument] SET [Title] = @Title, [Number] = @Number, [PrepareDate] = @PrepareDate, [ArchiveNo] = @ArchiveNo, [Type] = @Type, [WorkflueStatus] = @WorkflueStatus, [Cost] = @Cost, [MunicipalityRef] = @MunicipalityRef, [CourtRef] = @CourtRef, [Summary] = @Summary, [AnnounceDate] = @AnnounceDate, [Confirmer] = @Confirmer, [ParentDocRef] = @ParentDocRef, [Reciever] = @Reciever, [IndicatorRegisterDate] = @IndicatorRegisterDate, [CourtRoomDate] = @CourtRoomDate, [AnnounceNo] = @AnnounceNo, [AnnounceToAgentDate] = @AnnounceToAgentDate, [ReferToExpertDate] = @ReferToExpertDate, [ExpertName] = @ExpertName, [ExpertVerdictAnnounceDate] = @ExpertVerdictAnnounceDate, [ProtestVerdictDate] = @ProtestVerdictDate, [VoteProtestDate] = @VoteProtestDate, [ReconsiderVote] = @ReconsiderVote, [CategoryRef] = @CategoryRef, [Notes] = @Notes, [Status] = @Status WHERE [Id] = @original_Id AND [Title] = @original_Title AND [Number] = @original_Number AND [PrepareDate] = @original_PrepareDate AND (([ArchiveNo] = @original_ArchiveNo) OR ([ArchiveNo] IS NULL AND @original_ArchiveNo IS NULL)) AND [Type] = @original_Type AND [WorkflueStatus] = @original_WorkflueStatus AND (([Cost] = @original_Cost) OR ([Cost] IS NULL AND @original_Cost IS NULL)) AND [MunicipalityRef] = @original_MunicipalityRef AND [CourtRef] = @original_CourtRef AND (([Summary] = @original_Summary) OR ([Summary] IS NULL AND @original_Summary IS NULL)) AND [AnnounceDate] = @original_AnnounceDate AND [Confirmer] = @original_Confirmer AND (([ParentDocRef] = @original_ParentDocRef) OR ([ParentDocRef] IS NULL AND @original_ParentDocRef IS NULL)) AND [Reciever] = @original_Reciever AND (([IndicatorRegisterDate] = @original_IndicatorRegisterDate) OR ([IndicatorRegisterDate] IS NULL AND @original_IndicatorRegisterDate IS NULL)) AND [CourtRoomDate] = @original_CourtRoomDate AND (([AnnounceNo] = @original_AnnounceNo) OR ([AnnounceNo] IS NULL AND @original_AnnounceNo IS NULL)) AND (([AnnounceToAgentDate] = @original_AnnounceToAgentDate) OR ([AnnounceToAgentDate] IS NULL AND @original_AnnounceToAgentDate IS NULL)) AND (([ReferToExpertDate] = @original_ReferToExpertDate) OR ([ReferToExpertDate] IS NULL AND @original_ReferToExpertDate IS NULL)) AND (([ExpertName] = @original_ExpertName) OR ([ExpertName] IS NULL AND @original_ExpertName IS NULL)) AND (([ExpertVerdictAnnounceDate] = @original_ExpertVerdictAnnounceDate) OR ([ExpertVerdictAnnounceDate] IS NULL AND @original_ExpertVerdictAnnounceDate IS NULL)) AND (([ProtestVerdictDate] = @original_ProtestVerdictDate) OR ([ProtestVerdictDate] IS NULL AND @original_ProtestVerdictDate IS NULL)) AND (([VoteProtestDate] = @original_VoteProtestDate) OR ([VoteProtestDate] IS NULL AND @original_VoteProtestDate IS NULL)) AND (([ReconsiderVote] = @original_ReconsiderVote) OR ([ReconsiderVote] IS NULL AND @original_ReconsiderVote IS NULL)) AND [CategoryRef] = @original_CategoryRef AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND [Status] = @original_Status">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_Title" Type="String" />
                            <asp:Parameter Name="original_Number" Type="String" />
                            <asp:Parameter Name="original_PrepareDate" Type="DateTime" />
                            <asp:Parameter Name="original_ArchiveNo" Type="String" />
                            <asp:Parameter Name="original_Type" Type="String" />
                            <asp:Parameter Name="original_WorkflueStatus" Type="String" />
                            <asp:Parameter Name="original_Cost" Type="Decimal" />
                            <asp:Parameter Name="original_MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="original_CourtRef" Type="Int32" />
                            <asp:Parameter Name="original_Summary" Type="String" />
                            <asp:Parameter Name="original_AnnounceDate" Type="DateTime" />
                            <asp:Parameter Name="original_Confirmer" Type="String" />
                            <asp:Parameter Name="original_ParentDocRef" Type="Int32" />
                            <asp:Parameter Name="original_Reciever" Type="String" />
                            <asp:Parameter Name="original_IndicatorRegisterDate" Type="DateTime" />
                            <asp:Parameter Name="original_CourtRoomDate" Type="DateTime" />
                            <asp:Parameter Name="original_AnnounceNo" Type="String" />
                            <asp:Parameter Name="original_AnnounceToAgentDate" Type="DateTime" />
                            <asp:Parameter Name="original_ReferToExpertDate" Type="DateTime" />
                            <asp:Parameter Name="original_ExpertName" Type="String" />
                            <asp:Parameter Name="original_ExpertVerdictAnnounceDate" Type="DateTime" />
                            <asp:Parameter Name="original_ProtestVerdictDate" Type="DateTime" />
                            <asp:Parameter Name="original_VoteProtestDate" Type="DateTime" />
                            <asp:Parameter Name="original_ReconsiderVote" Type="String" />
                            <asp:Parameter Name="original_CategoryRef" Type="Int32" />
                            <asp:Parameter Name="original_Notes" Type="String" />
                            <asp:Parameter Name="original_Status" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtNumber" Name="Number" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="PrepareDate" />
                            <asp:Parameter Name="ArchiveNo" Type="String" />
                            <asp:ControlParameter ControlID="ddlType" Name="Type" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlWorkflueStatus" Name="WorkflueStatus" PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="Cost" Type="Decimal" />
                            <asp:ControlParameter ControlID="ddlRelatedMunicipality" Name="MunicipalityRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlCourt" Name="CourtRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtSummary" Name="Summary" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="AnnounceDate" />
                            <asp:Parameter Name="Confirmer" Type="String" />
                            <asp:Parameter Name="ParentDocRef" Type="Int32" />
                            <asp:ControlParameter ControlID="txtReceiver" Name="Reciever" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="CourtRoomDate" />
                            <asp:ControlParameter ControlID="txtAnnounceNo" Name="AnnounceNo" PropertyName="Text" Type="String" />
                            <%--<asp:Parameter Name="AnnounceToAgentDate" />--%>
                            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryRef" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtNotes" Name="Notes" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                            <asp:Parameter Name="ID" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id" QueryStringField="DocId" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="Number" Type="String" />
                            <asp:Parameter Name="PrepareDate" Type="DateTime" />
                            <asp:Parameter Name="ArchiveNo" Type="String" />
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:Parameter Name="WorkflueStatus" Type="String" />
                            <asp:Parameter Name="Cost" Type="Decimal" />
                            <asp:Parameter Name="MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="CourtRef" Type="Int32" />
                            <asp:Parameter Name="Summary" Type="String" />
                            <asp:Parameter Name="AnnounceDate" Type="DateTime" />
                            <asp:Parameter Name="Confirmer" Type="String" />
                            <asp:Parameter Name="ParentDocRef" Type="Int32" />
                            <asp:Parameter Name="Reciever" Type="String" />
                            <asp:Parameter Name="IndicatorRegisterDate" Type="DateTime" />
                            <asp:Parameter Name="CourtRoomDate" Type="DateTime" />
                            <asp:Parameter Name="AnnounceNo" Type="String" />
                            <asp:Parameter Name="AnnounceToAgentDate" Type="DateTime" />
                            <asp:Parameter Name="ReferToExpertDate" Type="DateTime" />
                            <asp:Parameter Name="ExpertName" Type="String" />
                            <asp:Parameter Name="ExpertVerdictAnnounceDate" Type="DateTime" />
                            <asp:Parameter Name="ProtestVerdictDate" Type="DateTime" />
                            <asp:Parameter Name="VoteProtestDate" Type="DateTime" />
                            <asp:Parameter Name="ReconsiderVote" Type="String" />
                            <asp:Parameter Name="CategoryRef" Type="Int32" />
                            <asp:Parameter Name="Notes" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_Title" Type="String" />
                            <asp:Parameter Name="original_Number" Type="String" />
                            <asp:Parameter Name="original_PrepareDate" Type="DateTime" />
                            <asp:Parameter Name="original_ArchiveNo" Type="String" />
                            <asp:Parameter Name="original_Type" Type="String" />
                            <asp:Parameter Name="original_WorkflueStatus" Type="String" />
                            <asp:Parameter Name="original_Cost" Type="Decimal" />
                            <asp:Parameter Name="original_MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="original_CourtRef" Type="Int32" />
                            <asp:Parameter Name="original_Summary" Type="String" />
                            <asp:Parameter Name="original_AnnounceDate" Type="DateTime" />
                            <asp:Parameter Name="original_Confirmer" Type="String" />
                            <asp:Parameter Name="original_ParentDocRef" Type="Int32" />
                            <asp:Parameter Name="original_Reciever" Type="String" />
                            <asp:Parameter Name="original_IndicatorRegisterDate" Type="DateTime" />
                            <asp:Parameter Name="original_CourtRoomDate" Type="DateTime" />
                            <asp:Parameter Name="original_AnnounceNo" Type="String" />
                            <asp:Parameter Name="original_AnnounceToAgentDate" Type="DateTime" />
                            <asp:Parameter Name="original_ReferToExpertDate" Type="DateTime" />
                            <asp:Parameter Name="original_ExpertName" Type="String" />
                            <asp:Parameter Name="original_ExpertVerdictAnnounceDate" Type="DateTime" />
                            <asp:Parameter Name="original_ProtestVerdictDate" Type="DateTime" />
                            <asp:Parameter Name="original_VoteProtestDate" Type="DateTime" />
                            <asp:Parameter Name="original_ReconsiderVote" Type="String" />
                            <asp:Parameter Name="original_CategoryRef" Type="Int32" />
                            <asp:Parameter Name="original_Notes" Type="String" />
                            <asp:Parameter Name="original_Status" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
    </table>
    </asp:View>
    <asp:View ID="viwComplementaryInfo" runat="server">
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="vsLegalPersonalities" runat="server" CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" 
                        ToolTip="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="AddLegalPersonality" />
                    <asp:ValidationSummary ID="vsPerson" runat="server" CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ToolTip="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="AddPerson" />
                </td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td>خواهان (ها):</td>
                <td>
                    <input type="button" id="btnShowAddPerson"  
                        onclick="if (document.getElementById('divViewPersons').style.display != 'none') { document.getElementById('divViewPersons').style.display = 'none'; } else { document.getElementById('divViewPersons').style.display = 'block'; document.getElementById('divAddLegalPersonality').style.display = 'none'; document.getElementById('divAddMunicipality').style.display = 'none'; }"
                         value="افزودن شخص" class="squareButton" style="background-color:#0099CC"  />
                    &nbsp;<input type="button" id="btnShowAddLegalPersonality"  
                        onclick="    if (document.getElementById('divAddLegalPersonality').style.display != 'none') { document.getElementById('divAddLegalPersonality').style.display = 'none'; } else { document.getElementById('divAddLegalPersonality').style.display = 'block'; document.getElementById('divViewPersons').style.display = 'none'; document.getElementById('divAddMunicipality').style.display = 'none'; }"
                         value="افزودن شخصیت حقوقی" class="squareButton" style="background-color:#0099CC"  />
                    &nbsp;<input type="button" id="btnShowAddMunicipality"  
                        onclick="if (document.getElementById('divAddMunicipality').style.display != 'none') { document.getElementById('divAddMunicipality').style.display = 'none'; } else { document.getElementById('divAddMunicipality').style.display = 'block'; document.getElementById('divViewPersons').style.display = 'none'; document.getElementById('divAddLegalPersonality').style.display = 'none'; }" 
                        value="افزودن شهرداری" class="squareButton" style="background-color:#0099CC"  />
                </td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>                    
                    <div id="divViewPersons" style="display:none;">
                        <table><tr><td><a class="squareButton" href="#" onclick="if (document.getElementById('divExistingPersons').style.display == 'none') {document.getElementById('divExistingPersons').style.display = 'block';document.getElementById('divAddPerson').style.display = 'none';} " >مشاهده اشخاص موجود</a> </td>
                        <td><a class="squareButton" href="#" onclick="if (document.getElementById('divAddPerson').style.display == 'none') {document.getElementById('divAddPerson').style.display = 'block';document.getElementById('divExistingPersons').style.display = 'none';} ">تعریف شخص جدید</a></td></tr>
                        </table>
                        <div id="divExistingPersons" style="display:block">
                        <table style="width:90%">
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>
                                <asp:GridView  ID="gvPersons" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsPersons" Font-Size="9pt" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvPersons_SelectedIndexChanged" Caption="لیست اشخاص موجود">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" CancelText="لغو" DeleteText="حذف" EditText="ویرایش" InsertText="درج" NewText="جدید" SelectText="افزودن این شخص بعنوان خواهان" UpdateText="به روز رسانی" />
                                        <asp:BoundField DataField="FirstName" HeaderText="نام" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" SortExpression="LastName" />
                                        <asp:BoundField DataField="NationalCode" HeaderText="کد ملی" SortExpression="NationalCode" />
                                        <asp:BoundField DataField="Phone" HeaderText="تلفن" SortExpression="Phone" />
                                        <asp:BoundField DataField="Mobile" HeaderText="همراه" SortExpression="Mobile" />
                                        <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                                        <asp:BoundField DataField="Name" HeaderText="استان" SortExpression="Name" />
                                        <asp:BoundField DataField="Expr1" HeaderText="شهرستان" SortExpression="Expr1" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sdsPersons" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="uspGetPersons" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Person WHERE (Id = @Id)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="OfficeId" SessionField="OId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                        </table>
                            </div>
                        <div id="divAddPerson" style="display:block">

                        <table style="width:100%;">
                            <tr>
                                <td style="table-layout:auto">
                                    <asp:RequiredFieldValidator ID="rfvLegalPersonalityName0" runat="server" ControlToValidate="txtPersonFirstName" ErrorMessage="تعیین نام شخص الزامی است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddPerson">*</asp:RequiredFieldValidator>
                                    نام:</td>
                                <td>
                                    <asp:TextBox id="txtPersonFirstName" runat="server" CssClass="formControls" ></asp:TextBox>
                                </td>
                                <td>استان:</td>
                                <td>     <asp:DropDownList ID="ddlPersonProvince" runat="server" CssClass="formControls" DataSourceID="sdsProvince" DataTextField="Name" DataValueField="Id" Width="80%"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvLegalPersonalityName1" runat="server" ControlToValidate="txtPersonLastName" ErrorMessage="لطفا نام خانوادگی را مشخص نمایید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddPerson">*</asp:RequiredFieldValidator>
                                    نام خانوادگی:</td>
                                <td>
                                    <asp:TextBox id="txtPersonLastName" runat="server" CssClass="formControls"  />
                                </td>
                                <td>شهرستان:</td>
                                <td>     <asp:DropDownList ID="ddlPersonCity" runat="server" CssClass="formControls" DataSourceID="sdsCity" DataTextField="Name" DataValueField="Id" Width="80%"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvLegalPersonalityName2" runat="server" ControlToValidate="txtPersonNationalCode" ErrorMessage="لطفا کد ملی را وارد نمایید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddPerson">*</asp:RequiredFieldValidator>
                                    کد ملی:</td>
                                <td>
                                    <asp:TextBox id="txtPersonNationalCode" runat="server" CssClass="formControls" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvLegalPersonalityName4" runat="server" ControlToValidate="txtPersonAddress" ErrorMessage="آدرس شخص را تعیین نکرده اید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddPerson">*</asp:RequiredFieldValidator>
                                    آدرس:</td>
                                <td rowspan="2">
                                    <asp:TextBox ID="txtPersonAddress" runat="server" Height="70px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvLegalPersonalityName3" runat="server" ControlToValidate="txtPersonPhone" ErrorMessage="تلفن مشخص نشده است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddPerson">*</asp:RequiredFieldValidator>
                                    تلفن:</td>
                                <td>
                                    <asp:TextBox id="txtPersonPhone" runat="server" CssClass="formControls"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>همراه: </td>
                                <td>
                                    <asp:TextBox id="txtPersonMobile" runat="server" CssClass="formControls"  />
                                </td>
                                <td>نوع:</td>
                                <td>     
                                    <asp:DropDownList ID="ddlPersonType" runat="server" CssClass="formControls" Width="80%">
                                        <asp:ListItem>&gt; انتخاب نمایید &gt;</asp:ListItem>
                                        <asp:ListItem>کارمند شهرداری </asp:ListItem>
                                        <asp:ListItem>شهردار</asp:ListItem>
                                        <asp:ListItem>شخص عادی</asp:ListItem>
                                        <asp:ListItem>سایر </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnAddPerson" runat="server" CssClass="bigButton" Text="افزودن به لیست خواهان (ها)" OnClick="btnAddPerson_Click" BackColor="Red" ValidationGroup="AddPerson" />
                                    <asp:SqlDataSource ID="sdsPerson" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Person] WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [NationalCode] = @original_NationalCode AND [Phone] = @original_Phone AND (([Mobile] = @original_Mobile) OR ([Mobile] IS NULL AND @original_Mobile IS NULL)) AND [ProvinceRef] = @original_ProvinceRef AND [CityRef] = @original_CityRef AND [Address] = @original_Address AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([OfficeRef] = @original_OfficeRef) OR ([OfficeRef] IS NULL AND @original_OfficeRef IS NULL))" InsertCommand="INSERT INTO [Person] ([FirstName], [LastName], [NationalCode], [Phone], [Mobile], [ProvinceRef], [CityRef], [Address], [Type], [OfficeRef]) VALUES (@FirstName, @LastName, @NationalCode, @Phone, @Mobile, @ProvinceRef, @CityRef, @Address, @Type, @OfficeRef)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [FirstName], [LastName], [NationalCode], [Phone], [Mobile], [ProvinceRef], [CityRef], [Address], [Type], [OfficeRef] FROM [Person]" UpdateCommand="UPDATE [Person] SET [FirstName] = @FirstName, [LastName] = @LastName, [NationalCode] = @NationalCode, [Phone] = @Phone, [Mobile] = @Mobile, [ProvinceRef] = @ProvinceRef, [CityRef] = @CityRef, [Address] = @Address, [Type] = @Type, [OfficeRef] = @OfficeRef WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [NationalCode] = @original_NationalCode AND [Phone] = @original_Phone AND (([Mobile] = @original_Mobile) OR ([Mobile] IS NULL AND @original_Mobile IS NULL)) AND [ProvinceRef] = @original_ProvinceRef AND [CityRef] = @original_CityRef AND [Address] = @original_Address AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([OfficeRef] = @original_OfficeRef) OR ([OfficeRef] IS NULL AND @original_OfficeRef IS NULL))" OnInserted="sdsPerson_Inserted">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_Id" Type="Int32" />
                                            <asp:Parameter Name="original_FirstName" Type="String" />
                                            <asp:Parameter Name="original_LastName" Type="String" />
                                            <asp:Parameter Name="original_NationalCode" Type="String" />
                                            <asp:Parameter Name="original_Phone" Type="String" />
                                            <asp:Parameter Name="original_Mobile" Type="String" />
                                            <asp:Parameter Name="original_ProvinceRef" Type="Int32" />
                                            <asp:Parameter Name="original_CityRef" Type="Int32" />
                                            <asp:Parameter Name="original_Address" Type="String" />
                                            <asp:Parameter Name="original_Type" Type="String" />
                                            <asp:Parameter Name="original_OfficeRef" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtPersonFirstName" Name="FirstName" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonLastName" Name="LastName" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonNationalCode" Name="NationalCode" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonPhone" Name="Phone" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonMobile" Name="Mobile" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="ddlPersonProvince" Name="ProvinceRef" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlPersonCity" Name="CityRef" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="txtPersonAddress" Name="Address" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="ddlPersonType" Name="Type" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="ddlPersonOffice" Name="OfficeRef" PropertyName="SelectedValue" Type="Int32" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="FirstName" Type="String" />
                                            <asp:Parameter Name="LastName" Type="String" />
                                            <asp:Parameter Name="NationalCode" Type="String" />
                                            <asp:Parameter Name="Phone" Type="String" />
                                            <asp:Parameter Name="Mobile" Type="String" />
                                            <asp:Parameter Name="ProvinceRef" Type="Int32" />
                                            <asp:Parameter Name="CityRef" Type="Int32" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="OfficeRef" Type="Int32" />
                                            <asp:Parameter Name="original_Id" Type="Int32" />
                                            <asp:Parameter Name="original_FirstName" Type="String" />
                                            <asp:Parameter Name="original_LastName" Type="String" />
                                            <asp:Parameter Name="original_NationalCode" Type="String" />
                                            <asp:Parameter Name="original_Phone" Type="String" />
                                            <asp:Parameter Name="original_Mobile" Type="String" />
                                            <asp:Parameter Name="original_ProvinceRef" Type="Int32" />
                                            <asp:Parameter Name="original_CityRef" Type="Int32" />
                                            <asp:Parameter Name="original_Address" Type="String" />
                                            <asp:Parameter Name="original_Type" Type="String" />
                                            <asp:Parameter Name="original_OfficeRef" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>شهرداری/اداره محل کار:</td>
                                <td>
                                    <asp:DropDownList ID="ddlPersonOffice" runat="server" CssClass="formControls" DataSourceID="sdsMuniciplitiesCompainants" DataTextField="Name" DataValueField="Id" Width="80%" Enabled="False">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </div>                     
                    <div id="divAddMunicipality" style="display:none;">
                    <table><tr><td style="width:50%">
                    <asp:DropDownList ID="ddlMunicipalities" runat="server" DataSourceID="sdsMuniciplitiesCompainants" DataTextField="Name" DataValueField="Id" Width="100%"  Font-Size="Small" Font-Bold="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="sdsMuniciplitiesCompainants" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Municipality] ORDER BY [Name]"></asp:SqlDataSource></td><td>
                <asp:button ID="btnAddMunicipality" runat="server" Text="افزودن به لیست خواهان (ها)" CssClass="bigControls" OnClick="btnAddMunicipality_Click" CausesValidation="False" />    </td></tr></table>
                </div>
                    <div id="divAddLegalPersonality" style="display:none">
                        <!-- tAB LINKS---------->
                         <table><tr><td><a class="squareButton" onclick="if (document.getElementById('divExistingLegalPersonalities').style.display == 'none') {document.getElementById('divExistingLegalPersonalities').style.display = 'block';document.getElementById('divAddNewLegalPersonality').style.display = 'none'; } "  >مشاهده اشخاص حقوقی موجود</a> </td>
                        <td><a class="squareButton" onclick="if (document.getElementById('divAddNewLegalPersonality').style.display == 'none') {document.getElementById('divAddNewLegalPersonality').style.display = 'block';document.getElementById('divExistingLegalPersonalities').style.display = 'none';} ">تعریف شخصیت حقوقی جدید</a></td></tr>
                        </table>
                        <!-- add new legal pers---------->
                        <div id="divAddNewLegalPersonality" style="display:block;">
                        <table><tr><td>
                        <div> نام:<asp:RequiredFieldValidator ID="rfvLegalPersonalityName" runat="server" ControlToValidate="txtLegalPersonalityName" ErrorMessage="تعیین نام شخصیت حقوقی الزامی است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddLegalPersonality">*</asp:RequiredFieldValidator>
                            <asp:TextBox  id="txtLegalPersonalityName" runat="server" CssClass="formControls" Width="100%" ValidationGroup="AddLegalPersonality" /> &nbsp;
                                                     
                        </div> </td>
                            <td>نوع شخصیت حقوقی:<asp:DropDownList ID="ddlLegalPersonalityType" runat="server" CssClass="formControls" Width="100%" ValidationGroup="AddLegalPersonality">
                                <asp:ListItem>ادارات دولتی</asp:ListItem>
                                <asp:ListItem>شرکت خصوصی</asp:ListItem>
                                <asp:ListItem>سایر</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            </tr>
                            <tr><td>
                        استان:
                         <asp:DropDownList ID="ddlLegalPersonalityProvince" runat="server" CssClass="formControls" DataSourceID="sdsProvince" DataTextField="Name" DataValueField="Id" Width="100%" ValidationGroup="AddLegalPersonality"></asp:DropDownList>
                         <asp:SqlDataSource ID="sdsProvince" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Province] ORDER BY [Name]"></asp:SqlDataSource>
                      </td>
                                <td>شهرستان:
                                    <asp:DropDownList ID="ddlLegalPersonalityCity" runat="server" CssClass="formControls" DataSourceID="sdsCity" DataTextField="Name" DataValueField="Id" Width="100%" ValidationGroup="AddLegalPersonality">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsCity" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [City]"></asp:SqlDataSource>
                                </td>
                            </tr> <tr><td colspan="2">
                                &nbsp;</td></tr>
                            <tr><td colspan="2">    
                                           
                                <asp:RequiredFieldValidator ID="rfvLegalPersonalityAddress" runat="server" ControlToValidate="txtLegalPersonalityAddress" ErrorMessage="لطفاً آدرس شخصیت حقوقی را تعیین نمایید." Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="تیتر پرونده" ValidationGroup="AddLegalPersonality">*</asp:RequiredFieldValidator>
                                           
 آدرس:
                        <asp:TextBox ID="txtLegalPersonalityAddress" runat="server" TextMode="MultiLine" Height="60" Width="100%" ValidationGroup="AddLegalPersonality"></asp:TextBox>
</td></tr>
                            <tr><td colspan="2">
                                <asp:RequiredFieldValidator ID="rfvLegalPersonalityPhone" runat="server" ControlToValidate="txtLegalPersonalityPhone" ErrorMessage="لطفاً تلفن شخصیت حقوقی را تعیین نمایید." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="AddLegalPersonality">*</asp:RequiredFieldValidator>
                                تلفن:
                                <asp:TextBox ID="txtLegalPersonalityPhone" runat="server" class="formControls" TextMode="Phone" ValidationGroup="AddLegalPersonality" Width="100%" />
                    </td></tr><tr><td colspan="2"><asp:Button ID="btnAddLegalPersonality" runat="server" CssClass="bigButton" Text="افزودن به لیست خواهان ها" BackColor="#FF3300" Font-Bold="True"  OnClick="btnAddLegalPersonality_Click" ValidationGroup="AddLegalPersonality"/> </td></tr></table>

                        </div>
                        <div id="divExistingLegalPersonalities" style="display:none;">
                             <table style="width:90%">
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>
                                <div class ="roundCorners">
                                <asp:GridView ID="gvExistingLegalPersonalities" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsLegalPersonalities" Font-Size="9pt" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvPersons_SelectedIndexChanged" Caption="لیست اشخاص حقوقی موجود">
                                    <Columns>
                                        <asp:CommandField SelectText="افزودن به لیست خواهان (ها)" ShowSelectButton="True" DeleteText="حذف" ShowDeleteButton="True" />
                                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                        <asp:BoundField DataField="ProvinceName" HeaderText="استان" SortExpression="ProvinceName" />
                                        <asp:BoundField DataField="CityName" HeaderText="شهر" SortExpression="CityName" />
                                        <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                                        <asp:BoundField DataField="Phone" HeaderText="تلفن" SortExpression="Phone" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                                    </div>
                                <asp:SqlDataSource ID="sdsLegalPersonalities" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="usp_getLegalPersonalities" SelectCommandType="StoredProcedure" InsertCommand="usp_insertLegalPersonality" InsertCommandType="StoredProcedure" OnInserted="sdsLegalPersonalities_Inserted" DeleteCommand="DELETE FROM LegalPersonality WHERE (Id = @Id)">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtLegalPersonalityName" Name="Name" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlLegalPersonalityProvince" Name="ProvinceId" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlLegalPersonalityCity" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtLegalPersonalityAddress" Name="Address" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txtLegalPersonalityPhone" Name="Phone" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlLegalPersonalityType" Name="Type" PropertyName="SelectedValue" Type="String" />
                                        <asp:SessionParameter Name="MunicipalityId" SessionField="OId" Type="Int32" />
                                        <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                    </InsertParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="Id" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="MunicipalityId" SessionField="OId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:button ID="btnAddExistingLegalPersonality" runat="server" Text="افزودن به لیست خواهان (ها)" CssClass="bigControls" CausesValidation="False" OnClick="btnAddExistingPerson_Click" Enabled="False" BackColor="#FF3300" ForeColor="White" /> 
                                </td></tr>
                        </table>
                        </div>

                    </div>
                   
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="sdsComplainants" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Complainant] WHERE [Id] = @original_Id" InsertCommand="[usp_insertCompainant]" InsertCommandType="StoredProcedure" OldValuesParameterFormatString="original_{0}" SelectCommand="usp_getComplainantsInfo" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [Complainant] SET [PersonRef] = @PersonRef, [LegalPersonalityRef] = @LegalPersonalityRef, [MunicipalityRef] = @MunicipalityRef, [LegalDocumentRef] = @LegalDocumentRef WHERE [Id] = @original_Id AND (([PersonRef] = @original_PersonRef) OR ([PersonRef] IS NULL AND @original_PersonRef IS NULL)) AND (([LegalPersonalityRef] = @original_LegalPersonalityRef) OR ([LegalPersonalityRef] IS NULL AND @original_LegalPersonalityRef IS NULL)) AND (([MunicipalityRef] = @original_MunicipalityRef) OR ([MunicipalityRef] IS NULL AND @original_MunicipalityRef IS NULL)) AND [LegalDocumentRef] = @original_LegalDocumentRef">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="LegalDocumentRef" SessionField="LDId" Type="Int32" />
                            <asp:Parameter Name="PersonRef" Type="Int32" />
                            <asp:Parameter Name="LegalPersonalityRef" Type="Int32" />
                            <asp:Parameter Name="MunicipalityRef" Type="Int32" />
                            <asp:Parameter Direction="Output" Name="ID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PersonRef" Type="Int32" />
                            <asp:Parameter Name="LegalPersonalityRef" Type="Int32" />
                            <asp:Parameter Name="MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="LegalDocumentRef" Type="Int32" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_PersonRef" Type="Int32" />
                            <asp:Parameter Name="original_LegalPersonalityRef" Type="Int32" />
                            <asp:Parameter Name="original_MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="original_LegalDocumentRef" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <div >
                    <asp:GridView CssClass="roundCorners" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" Font-Size="9pt" ForeColor="Black" Caption="لیست خواهان (های) پرونده حقوقی" DataSourceID="sdsComplainants">
                        <Columns>
                            <asp:CommandField CancelText="لغو" DeleteText="حذف خواهان" EditText="ویرایش" ShowDeleteButton="True" />
                            <asp:BoundField DataField="FirstName" HeaderText="نام شخص" SortExpression="FirstName" />
                            <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی شخص" SortExpression="LastName" />
                            <asp:BoundField DataField="LegalPersonalityName" HeaderText="نام شخصیت حقوقی" SortExpression="LegalPersonalityName" />
                            <asp:BoundField DataField="MunicipalityName" HeaderText="نام شهرداری" SortExpression="MunicipalityName" />
                            <asp:CommandField />
                        </Columns>
                        <EmptyDataTemplate>
                            هنوز هیچ طرف خواهانی تعیین نشده است. برای افزودن خواهان(ها) از گزینه های &quot;افزودن شخص&quot; و یا &quot;افزودن شخصیت حقوقی&quot; و یا افزودن &quot;شهرداری&quot; استفاده کنید.
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>

                    </div>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
           <%-- <tr>
                <td colspan="2" >
                    <table style="width:80%"><tr><td style="width:80%; text-align:center">
                    <asp:Button ID="btnGoGeneralInfo" Width="40%" runat="server" BackColor="#0099CC" 
                        CausesValidation="False" CssClass="bigButton"  OnClick="btnGoGeneralInfo_Click" Text="<    مرحله قبل "  />
                    <asp:Button ID="btnGoAttachements" Width="40%" runat="server" BackColor="#0099CC"
                         CausesValidation="False" CssClass="bigButton"  OnClick="btnNext_Click" Text="مرحله بعد     >" />
                </td></tr></table></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>--%>
        </table>
        <hr noshade="noshade" style="width:70%"/>
        <!-- خوانده ها-->
         <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" 
                        ToolTip="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="AddLegalPersonalityInvited" />
                </td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td>خوانده (ها):</td>
                <td>
                    <input type="button" id="Button1"  
                        onclick="if (document.getElementById('divViewPersonsInvited').style.display != 'none') { document.getElementById('divViewPersonsInvited').style.display = 'none'; } else { document.getElementById('divViewPersonsInvited').style.display = 'block'; document.getElementById('divAddLegalPersonalityInvited').style.display = 'none'; document.getElementById('divAddMunicipalityInvited').style.display = 'none'; }"
                         value="افزودن شخص" class="squareButton" style="background-color:#0099CC"  />
                    &nbsp;<input type="button" id="Button2"  
                        onclick="    if (document.getElementById('divAddLegalPersonalityInvited').style.display != 'none') { document.getElementById('divAddLegalPersonalityInvited').style.display = 'none'; } else { document.getElementById('divAddLegalPersonalityInvited').style.display = 'block'; document.getElementById('divViewPersonsInvited').style.display = 'none'; document.getElementById('divAddMunicipalityInvited').style.display = 'none'; }"
                         value="افزودن شخصیت حقوقی" class="squareButton" style="background-color:#0099CC"  />
                    &nbsp;<input type="button" id="Button3"  
                        onclick="if (document.getElementById('divAddMunicipalityInvited').style.display != 'none') { document.getElementById('divAddMunicipalityInvited').style.display = 'none'; } else { document.getElementById('divAddMunicipalityInvited').style.display = 'block'; document.getElementById('divViewPersonsIvited').style.display = 'none'; document.getElementById('divAddLegalPersonalityInvited').style.display = 'none'; }" 
                        value="افزودن شهرداری" class="squareButton" style="background-color:#0099CC"  />
                </td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>                    
                    <div id="divViewPersonsInvited" style="display:none;">
                        <table><tr><td><a class="squareButton" onclick="if (document.getElementById('divExistingPersons').style.display == 'none') {document.getElementById('divExistingPersons').style.display = 'block';document.getElementById('divAddPerson').style.display = 'none';} " >مشاهده اشخاص موجود</a> </td>
                        <td><a class="squareButton" onclick="if (document.getElementById('divAddPersonInvited').style.display == 'none') {document.getElementById('divAddPersonInvited').style.display = 'block';document.getElementById('divExistingPersons').style.display = 'none';} ">تعریف شخص جدید</a></td></tr>
                        </table>
                        <div id="div2" style="display:block">
                        <table style="width:90%">
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>
                                <asp:GridView ID="gvExistingPersonsInvited" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsPersons" Font-Size="9pt" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvPersons_SelectedIndexChanged" Caption="لیست اشخاص موجود">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" CancelText="لغو" DeleteText="حذف" EditText="ویرایش" InsertText="درج" NewText="جدید" SelectText="افزودن این شخص بعنوان خواهان" UpdateText="به روز رسانی" />
                                        <asp:BoundField DataField="FirstName" HeaderText="نام" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" SortExpression="LastName" />
                                        <asp:BoundField DataField="NationalCode" HeaderText="کد ملی" SortExpression="NationalCode" />
                                        <asp:BoundField DataField="Phone" HeaderText="تلفن" SortExpression="Phone" />
                                        <asp:BoundField DataField="Mobile" HeaderText="همراه" SortExpression="Mobile" />
                                        <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                                        <asp:BoundField DataField="Name" HeaderText="استان" SortExpression="Name" />
                                        <asp:BoundField DataField="Expr1" HeaderText="شهرستان" SortExpression="Expr1" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="uspGetPersons" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="OfficeId" SessionField="OId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                        </table>
                            </div>
                        <div id="divAddPersonInvited" style="display:block">

                        <table style="width:100%;">
                            <tr>
                                <td style="table-layout:auto">نام:</td>
                                <td>
                                    <asp:TextBox id="txtFirstNameInvited" runat="server" CssClass="formControls" ></asp:TextBox>
                                </td>
                                <td>استان:</td>
                                <td>     <asp:DropDownList ID="ddlPersonProvinceInvited" runat="server" CssClass="formControls" DataSourceID="sdsProvince" DataTextField="Name" DataValueField="Id" Width="80%"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>نام خانوادگی:</td>
                                <td>
                                    <asp:TextBox id="txtLastNameInvited" runat="server" CssClass="formControls"  />
                                </td>
                                <td>شهرستان:</td>
                                <td>     <asp:DropDownList ID="ddlPersonCityInvited" runat="server" CssClass="formControls" DataSourceID="sdsCity" DataTextField="Name" DataValueField="Id" Width="80%"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>کد ملی:</td>
                                <td>
                                    <asp:TextBox id="txtNationalNoInvited" runat="server" CssClass="formControls" />
                                </td>
                                <td>آدرس:</td>
                                <td rowspan="2">
                                    <asp:TextBox ID="txtPersonAddressInvited" runat="server" Height="70px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>تلفن:</td>
                                <td>
                                    <asp:TextBox id="txtPersonPhoneInvited" runat="server" CssClass="formControls"  />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>همراه: </td>
                                <td>
                                    <asp:TextBox id="txtMobileInvited" runat="server" CssClass="formControls"  />
                                </td>
                                <td>نوع:</td>
                                <td>     
                                    <asp:DropDownList ID="ddlPersonTypeInvited" runat="server" CssClass="formControls" Width="80%">
                                        <asp:ListItem>&gt; انتخاب نمایید &gt;</asp:ListItem>
                                        <asp:ListItem>کارمند شهرداری </asp:ListItem>
                                        <asp:ListItem>شهردار</asp:ListItem>
                                        <asp:ListItem>شخص عادی</asp:ListItem>
                                        <asp:ListItem>سایر </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnAddPersonInvited" runat="server" CssClass="bigControls" Text="افزودن به لیست خواهان (ها)" OnClick="btnAddPerson_Click" />
                                    <asp:SqlDataSource ID="sdsPersonInvited" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Person] WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [NationalCode] = @original_NationalCode AND [Phone] = @original_Phone AND (([Mobile] = @original_Mobile) OR ([Mobile] IS NULL AND @original_Mobile IS NULL)) AND [ProvinceRef] = @original_ProvinceRef AND [CityRef] = @original_CityRef AND [Address] = @original_Address AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([OfficeRef] = @original_OfficeRef) OR ([OfficeRef] IS NULL AND @original_OfficeRef IS NULL))" InsertCommand="INSERT INTO [Person] ([FirstName], [LastName], [NationalCode], [Phone], [Mobile], [ProvinceRef], [CityRef], [Address], [Type], [OfficeRef]) VALUES (@FirstName, @LastName, @NationalCode, @Phone, @Mobile, @ProvinceRef, @CityRef, @Address, @Type, @OfficeRef)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [FirstName], [LastName], [NationalCode], [Phone], [Mobile], [ProvinceRef], [CityRef], [Address], [Type], [OfficeRef] FROM [Person]" UpdateCommand="UPDATE [Person] SET [FirstName] = @FirstName, [LastName] = @LastName, [NationalCode] = @NationalCode, [Phone] = @Phone, [Mobile] = @Mobile, [ProvinceRef] = @ProvinceRef, [CityRef] = @CityRef, [Address] = @Address, [Type] = @Type, [OfficeRef] = @OfficeRef WHERE [Id] = @original_Id AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [NationalCode] = @original_NationalCode AND [Phone] = @original_Phone AND (([Mobile] = @original_Mobile) OR ([Mobile] IS NULL AND @original_Mobile IS NULL)) AND [ProvinceRef] = @original_ProvinceRef AND [CityRef] = @original_CityRef AND [Address] = @original_Address AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([OfficeRef] = @original_OfficeRef) OR ([OfficeRef] IS NULL AND @original_OfficeRef IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_Id" Type="Int32" />
                                            <asp:Parameter Name="original_FirstName" Type="String" />
                                            <asp:Parameter Name="original_LastName" Type="String" />
                                            <asp:Parameter Name="original_NationalCode" Type="String" />
                                            <asp:Parameter Name="original_Phone" Type="String" />
                                            <asp:Parameter Name="original_Mobile" Type="String" />
                                            <asp:Parameter Name="original_ProvinceRef" Type="Int32" />
                                            <asp:Parameter Name="original_CityRef" Type="Int32" />
                                            <asp:Parameter Name="original_Address" Type="String" />
                                            <asp:Parameter Name="original_Type" Type="String" />
                                            <asp:Parameter Name="original_OfficeRef" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtPersonFirstName" Name="FirstName" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonLastName" Name="LastName" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonNationalCode" Name="NationalCode" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonPhone" Name="Phone" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtPersonMobile" Name="Mobile" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="ddlPersonProvince" Name="ProvinceRef" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlPersonCity" Name="CityRef" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="txtPersonAddress" Name="Address" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="ddlPersonType" Name="Type" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="ddlPersonOffice" Name="OfficeRef" PropertyName="SelectedValue" Type="Int32" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="FirstName" Type="String" />
                                            <asp:Parameter Name="LastName" Type="String" />
                                            <asp:Parameter Name="NationalCode" Type="String" />
                                            <asp:Parameter Name="Phone" Type="String" />
                                            <asp:Parameter Name="Mobile" Type="String" />
                                            <asp:Parameter Name="ProvinceRef" Type="Int32" />
                                            <asp:Parameter Name="CityRef" Type="Int32" />
                                            <asp:Parameter Name="Address" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="OfficeRef" Type="Int32" />
                                            <asp:Parameter Name="original_Id" Type="Int32" />
                                            <asp:Parameter Name="original_FirstName" Type="String" />
                                            <asp:Parameter Name="original_LastName" Type="String" />
                                            <asp:Parameter Name="original_NationalCode" Type="String" />
                                            <asp:Parameter Name="original_Phone" Type="String" />
                                            <asp:Parameter Name="original_Mobile" Type="String" />
                                            <asp:Parameter Name="original_ProvinceRef" Type="Int32" />
                                            <asp:Parameter Name="original_CityRef" Type="Int32" />
                                            <asp:Parameter Name="original_Address" Type="String" />
                                            <asp:Parameter Name="original_Type" Type="String" />
                                            <asp:Parameter Name="original_OfficeRef" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>شهرداری/اداره محل کار:</td>
                                <td>
                                    <asp:DropDownList ID="ddlPersonMunicipalityInvited" runat="server" CssClass="formControls" DataSourceID="sdsMuniciplitiesCompainants" DataTextField="Name" DataValueField="Id" Width="80%" Enabled="False">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>

                    </div>
                    </div>                     
                    <div id="divAddMunicipalityInvited" style="display:none;">
                    <table><tr><td style="width:50%">
                    <asp:DropDownList ID="ddlMunicipalitiesInvited" runat="server" DataSourceID="sdsMuniciplitiesCompainants" DataTextField="Name" DataValueField="Id" Width="100%"  Font-Size="Small" Font-Bold="True"></asp:DropDownList>
                        </td><td>
                <asp:button ID="btnAddMunicipalityInvited" runat="server" Text="افزودن به لیست خوانده (ها)" CssClass="bigControls" OnClick="btnAddMunicipalityInvited_Click" CausesValidation="False" />    </td></tr></table>
                </div>
                    <div id="divAddLegalPersonalityInvited" style="display:none">
                        <!-- tAB LINKS---------->
                         <table><tr><td><a class="squareButton" onclick="if (document.getElementById('divExistingLegalPersonalities').style.display == 'none') {document.getElementById('divExistingLegalPersonalities').style.display = 'block';document.getElementById('divAddNewLegalPersonality').style.display = 'none'; } "  >مشاهده اشخاص حقوقی موجود</a> </td>
                        <td><a class="squareButton" onclick="if (document.getElementById('divAddNewLegalPersonality').style.display == 'none') {document.getElementById('divAddNewLegalPersonality').style.display = 'block';document.getElementById('divExistingLegalPersonalities').style.display = 'none';} ">تعریف شخصیت حقوقی جدید</a></td></tr>
                        </table>
                        <!-- add new legal pers---------->
                        <div id="div6" style="display:block;">
                        <table><tr><td>
                        <div> نام:<asp:TextBox  id="txtLegalPersonalityNameInvited" runat="server" CssClass="formControls" Width="100%" /> &nbsp;
                            <asp:RequiredFieldValidator ID="rfvLPNameInvited" runat="server" ErrorMessage="تعیین نامه شخصیت حقوقی الزامی است" ControlToValidate="txtLegalPersonalityNameInvited" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="تیتر پرونده" ValidationGroup="AddLegalPersonalityInvited">*</asp:RequiredFieldValidator>
                         
                        </div> </td>
                            <td>نوع شخصیت حقوقی:<asp:DropDownList ID="ddlLPType" runat="server" CssClass="formControls" Width="100%" ValidationGroup="AddLegalPersonality">
                                <asp:ListItem>ادارات دولتی</asp:ListItem>
                                <asp:ListItem>شرکت خصوصی</asp:ListItem>
                                <asp:ListItem>سایر</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            </tr>
                            <tr><td>
                        استان:
                         <asp:DropDownList ID="ddlLPProvinceInvited" runat="server" CssClass="formControls" DataSourceID="sdsProvince" DataTextField="Name" DataValueField="Id" Width="100%" ValidationGroup="AddLegalPersonality"></asp:DropDownList>
                      </td>
                                <td>شهرستان:
                                    <asp:DropDownList ID="ddlLPCityInvited" runat="server" CssClass="formControls" DataSourceID="sdsCity" DataTextField="Name" DataValueField="Id" Width="100%" ValidationGroup="AddLegalPersonality">
                                    </asp:DropDownList>
                                </td>
                            </tr> <tr><td colspan="2">
                                &nbsp;</td></tr>
                            <tr><td colspan="2">    
                                           
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLegalPersonalityAddress" ErrorMessage="لطفاً آدرس شخصیت حقوقی را تعیین نمایید." Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="تیتر پرونده" ValidationGroup="AddLegalPersonalityInvited">*</asp:RequiredFieldValidator>
                                           
 آدرس:
                        <asp:TextBox ID="txtLPAddressInvited" runat="server" TextMode="MultiLine" Height="60" Width="100%" ValidationGroup="AddLegalPersonality"></asp:TextBox>
</td></tr>
                            <tr><td colspan="2">
                    تلفن:
                    <asp:TextBox runat="server" id="txtLPPhoneInvited"  class="formControls" Width="100%" TextMode="Phone" ValidationGroup="AddLegalPersonality"/>
                    </td></tr><tr><td colspan="2"><asp:Button ID="btnLPAddInvited" runat="server" CssClass="bigButton" Text="افزودن به لیست خوانده ها" BackColor="#FF3300" Font-Bold="True"  OnClick="btnAddLegalPersonality_Click" ValidationGroup="AddLegalPersonalityInvited"/> </td></tr></table>

                        </div>
                        <div id="div7" style="display:none;">
                             <table style="width:90%">
                            <tr><td>لیست اشخاص موجود</td></tr>
                            <tr><td>
                                <asp:GridView ID="GridView3" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsLegalPersonalities" Font-Size="9pt" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="gvPersons_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField SelectText="انتخاب این شخصیت حقوقی" ShowSelectButton="True" DeleteText="حذف" ShowDeleteButton="True" />
                                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                        <asp:BoundField DataField="ProvinceName" HeaderText="استان" SortExpression="ProvinceName" />
                                        <asp:BoundField DataField="CityName" HeaderText="شهر" SortExpression="CityName" />
                                        <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                                        <asp:BoundField DataField="Phone" HeaderText="تلفن" SortExpression="Phone" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="usp_getLegalPersonalities" SelectCommandType="StoredProcedure" InsertCommand="usp_insertLegalPersonality" InsertCommandType="StoredProcedure" OnInserted="sdsLegalPersonalities_Inserted">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="txtLegalPersonalityName" Name="Name" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlLegalPersonalityProvince" Name="ProvinceId" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlLegalPersonalityCity" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtLegalPersonalityAddress" Name="Address" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txtLegalPersonalityPhone" Name="Phone" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlLegalPersonalityType" Name="Type" PropertyName="SelectedValue" Type="String" />
                                        <asp:SessionParameter Name="MunicipalityId" SessionField="OId" Type="Int32" />
                                        <asp:Parameter Name="Id" Type="Int32" Direction="Output" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="MunicipalityId" SessionField="OId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:button ID="Button7" runat="server" Text="افزودن به لیست خواهان (ها)" CssClass="bigControls" CausesValidation="False" OnClick="btnAddExistingPerson_Click" Enabled="False" BackColor="#FF3300" ForeColor="White" /> 
                                </td></tr>
                        </table>
                        </div>
                    </div>                   
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="sdsLegalPersonalityInvited" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Complainant] WHERE [Id] = @original_Id" InsertCommand="[usp_insertCompainant]" InsertCommandType="StoredProcedure" OldValuesParameterFormatString="original_{0}" SelectCommand="usp_getComplainantsInfo" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [Complainant] SET [PersonRef] = @PersonRef, [LegalPersonalityRef] = @LegalPersonalityRef, [MunicipalityRef] = @MunicipalityRef, [LegalDocumentRef] = @LegalDocumentRef WHERE [Id] = @original_Id AND (([PersonRef] = @original_PersonRef) OR ([PersonRef] IS NULL AND @original_PersonRef IS NULL)) AND (([LegalPersonalityRef] = @original_LegalPersonalityRef) OR ([LegalPersonalityRef] IS NULL AND @original_LegalPersonalityRef IS NULL)) AND (([MunicipalityRef] = @original_MunicipalityRef) OR ([MunicipalityRef] IS NULL AND @original_MunicipalityRef IS NULL)) AND [LegalDocumentRef] = @original_LegalDocumentRef">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="LegalDocumentRef" SessionField="LDId" Type="Int32" />
                            <asp:Parameter Name="PersonRef" Type="Int32" />
                            <asp:Parameter Name="LegalPersonalityRef" Type="Int32" />
                            <asp:Parameter Name="MunicipalityRef" Type="Int32" />
                            <asp:Parameter Direction="Output" Name="ID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PersonRef" Type="Int32" />
                            <asp:Parameter Name="LegalPersonalityRef" Type="Int32" />
                            <asp:Parameter Name="MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="LegalDocumentRef" Type="Int32" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_PersonRef" Type="Int32" />
                            <asp:Parameter Name="original_LegalPersonalityRef" Type="Int32" />
                            <asp:Parameter Name="original_MunicipalityRef" Type="Int32" />
                            <asp:Parameter Name="original_LegalDocumentRef" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView CssClass="roundCorners" ID="gvInvited" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" Font-Size="9pt" ForeColor="Black" Caption="لیست خوانده (های) پرونده حقوقی" DataSourceID="sdsLegalPersonalityInvited">
                        <Columns>
                            <asp:CommandField CancelText="لغو" DeleteText="حذف خوانده" EditText="ویرایش" ShowDeleteButton="True" />
                            <asp:BoundField DataField="FirstName" HeaderText="نام شخص" SortExpression="FirstName" />
                            <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی شخص" SortExpression="LastName" />
                            <asp:BoundField DataField="LegalPersonalityName" HeaderText="نام شخصیت حقوقی" SortExpression="LegalPersonalityName" />
                            <asp:BoundField DataField="MunicipalityName" HeaderText="نام شهرداری" SortExpression="MunicipalityName" />
                            <asp:CommandField />
                        </Columns>
                        <EmptyDataTemplate>
                            هنوز هیچ طرف خوانده ای تعیین نشده است. برای افزودن خوانده (ها) از گزینه های &quot;افزودن شخص&quot; و یا &quot;افزودن شخصیت حقوقی&quot; و یا افزودن &quot;شهرداری&quot; استفاده نمایید.
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" >
                    <table style="width:80%"><tr><td style="width:80%; text-align:center">
                    <asp:Button ID="btnGoGeneralInfo" Width="30%" runat="server" BackColor="#0099CC" 
                        CausesValidation="False" CssClass="bigButton"  OnClick="btnGoGeneralInfo_Click" Text="<    مرحله قبل "  />
                    <asp:Button ID="btnGoAttachements" Width="30%" runat="server" BackColor="#0099CC"
                         CausesValidation="False" CssClass="bigButton"  OnClick="btnGoAttachements_Click" Text="مرحله بعد     >" />
                </td></tr></table></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="viwAttachements" runat="server" >

        <table style="width:100%;">
            <tr>
                <td colspan="3">اسکن مستندات پیوست</td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:middle;">
                    <asp:FileUpload ID="fuAttachements" runat="server" />
                    شرح فایل پیوست:
                    <asp:TextBox ID="txtAttachementTitle" runat="server"></asp:TextBox>
                    <asp:Button ID="btnUploadAttachement" runat="server" BackColor="Red" CssClass="squareButton" Font-Bold="True" Height="40px" Text="               ارسال                 " OnClick="btnUploadAttachement_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:middle;">حداکثر حجم فایل پیوست 400 کیلو بایت می باشد.</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView5" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" Caption="فایل های مستندات پیوست" DataKeyNames="Id" DataSourceID="sdsAttachements">
                        <Columns>
                            <asp:CommandField CancelText="لغو" DeleteText="حذف این فایل پیوست" EditText="ویرایش" SelectText="نمایش" ShowDeleteButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title" />
                            <asp:BoundField DataField="Url" HeaderText="تصویر" SortExpression="Url" />
                            <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                        </Columns>
                        <EmptyDataTemplate>
                            لیست فایل های پیوست خالی است
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsAttachements" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Attachement] WHERE [Id] = @original_Id " InsertCommand="usp_insertAttachement" InsertCommandType="StoredProcedure" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Url], [LegalDocumentRef], [Type], [Title] FROM [Attachement] ORDER BY [Title]" UpdateCommand="UPDATE [Attachement] SET [Url] = @Url, [LegalDocumentRef] = @LegalDocumentRef, [Type] = @Type, [Title] = @Title WHERE [Id] = @original_Id AND [Url] = @original_Url AND [LegalDocumentRef] = @original_LegalDocumentRef AND [Type] = @original_Type AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_Url" Type="String" />
                            <asp:Parameter Name="original_LegalDocumentRef" Type="Int32" />
                            <asp:Parameter Name="original_Type" Type="String" />
                            <asp:Parameter Name="original_Title" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Url" Type="String" />
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:ControlParameter ControlID="txtAttachementTitle" Name="Title" PropertyName="Text" Type="String" />
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            <asp:SessionParameter Name="LegalDocumentId" SessionField="LDId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Url" Type="String" />
                            <asp:Parameter Name="LegalDocumentRef" Type="Int32" />
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_Url" Type="String" />
                            <asp:Parameter Name="original_LegalDocumentRef" Type="Int32" />
                            <asp:Parameter Name="original_Type" Type="String" />
                            <asp:Parameter Name="original_Title" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr><td colspan="2">                         <asp:Button ID="btnGoComplementaryInfo" Width="20%" runat="server" BackColor="#0099CC" 
                        CausesValidation="False" CssClass="bigButton"  OnClick="btnGoComplementaryInfo_Click" Text="<    مرحله قبل "  />
                                   <asp:Button ID="btnAttachmentsFinish" runat="server" BackColor="#0099CC" CausesValidation="False" CssClass="bigButton"  OnClick="btnSessionsFinish_Click" Text="             اتمام ثبت      " Width="20%" />
                                   <asp:Button ID="btnAttachmentsNext" Width="20%" runat="server" BackColor="#0099CC"
                         CausesValidation="False" CssClass="bigButton"  Text="ورود اطلاعات جلسات دادگاه     &gt;" OnClick="btnSessionsNext_Click" />
                </td></tr>
        </table>

    </asp:View>
    <asp:View ID="viwSessions" runat="server">
        <table style="text-align:center; " >
        <tr>
            <td>&nbsp;</td>
            <td>
                
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:ValidationSummary ID="ValidationSummarySessions" runat="server"  CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ToolTip="اطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="SessionData" />
            </td>
        </tr>
        <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvAgent" runat="server" ControlToValidate="txtTitle" ErrorMessage="تعیین عنوان پرونده ضروری است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="تیتر پرونده" ValidationGroup="SessionData">*</asp:RequiredFieldValidator>
                نماینده حقوقی:</td>
            <td>
                <asp:DropDownList ID="ddlAgent" runat="server" CssClass="formControls" DataSourceID="sdsAgents" DataTextField="Name" DataValueField="Id"  Height="35px" Width="100%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsAgents" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT Agent.Id, (Person.FirstName+' '+ Person.LastName ) as Name FROM Agent INNER JOIN Person ON Agent.PersonRef = Person.Id WHERE (Person.OfficeRef = @OfficeId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="OfficeId" SessionField="OId" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvSessionCourtDate" runat="server" ControlToValidate="txtSessionCourtDate" ErrorMessage="تاریخ دادگاه را مشخص ننموده اید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="SessionData">*</asp:RequiredFieldValidator>
                تاریخ دادگاه:</td>
            <td>
                <asp:TextBox ID="txtSessionCourtDate" runat="server" CssClass="formControls"  onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tableLabels">
                نام کارشناس:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtExpertName" runat="server" CssClass="formControls"></asp:TextBox>
            </td>
            <td class="auto-style3">
                تاریخ ارجاع به کارشناس:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtReferToExpertDate" runat="server" CssClass="formControls" onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
        </tr>        
        <tr>
            <td class="tableLabels">
                تاریخ اعتراض به رای:</td>
            <td>
                <asp:TextBox ID="txtProtestVerdictDate" runat="server" CssClass="formControls" onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
            <td>
                تاریخ ابلاغ رای کارشناس:</td>
            <td>
                <asp:TextBox ID="txtExpertVerdictAnnounceDate" runat="server" CssClass="formControls"  onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tableLabels" colspan="2" rowspan="2">
                <asp:TextBox ID="txtReconsiderVote" runat="server" CssClass="formControls" Height="150px" placeholder="رای تجدید نظر" TextMode="MultiLine" ></asp:TextBox>
            </td>
            <td>
                <br />
                تاریخ ابلاغ رای نهایی:<br /> </td>
            <td>
                <asp:TextBox ID="txtFinalVerdictDate" runat="server" CssClass="formControls" onclick="PersianDatePicker.Show(this,'1396/04/09');"></asp:TextBox>
             </td>
        </tr>
            <tr>
                <td>توضیحات:</td>
                <td>
                    <asp:TextBox ID="txtSessionNotes" runat="server" CssClass="formControls" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                </td>
            </tr>
       
            <tr>
                <td class="tableLabels" colspan="4" style="text-align:right;">
                    <asp:TextBox ID="txtFinalVerdict" runat="server" CssClass="formControls" Height="100px" placeholder="رای نهایی دادگاه" TextMode="MultiLine" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableLabels">
                    <asp:Button ID="btnAddSession" runat="server" BackColor="Red" CssClass="squareButton" Font-Bold="True" Height="40px" OnClick="btnAddSession_Click" Text="               افزودن جلسه دادگاه به لیست                 " ValidationGroup="SessionData" />
                </td>
                <td colspan="3">
                    <asp:Label ID="lblSessionsMessage" runat="server" Font-Bold="True"></asp:Label>
                    <asp:SqlDataSource ID="sdsSessions" runat="server" ConflictDetection="CompareAllValues" 
                        ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" 
                        InsertCommand="INSERT INTO CourtSession(LegalDocumentRef, AgentRef, CourtDate, RefereToExpertDate, ExpertName, ExpertVerdictAnnounceDate, FinalVerdict, FinalVerdictDate, ProtestVerdictDate, Notes, ReconsiderVote) VALUES (@LegalDocumentRef, @AgentRef, @CourtDate, @ReferToExpertDate, @ExpertName, @ExpertVerdictAnnounceDate, @FinalVerdict, @FinalVerdictDate, @ProtestVerdictDate, @Notes, @ReconsiderVote)"
                         OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT CourtSession.Id, CourtSession.LegalDocumentRef, CourtSession.AgentRef, CourtSession.CourtDate, CourtSession.RefereToExpertDate, CourtSession.ExpertName, CourtSession.ExpertVerdictAnnounceDate, CourtSession.FinalVerdict, CourtSession.FinalVerdictDate, CourtSession.ProtestVerdictDate, CourtSession.Notes, CourtSession.ReconsiderVote, Person.FirstName + ' ' + Person.LastName AS AgentName FROM CourtSession INNER JOIN Agent ON CourtSession.AgentRef = Agent.Id INNER JOIN Person ON Agent.PersonRef = Person.Id" 
                        DeleteCommand="DELETE FROM CourtSession WHERE (Id = @Id)"> 
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32"  />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="LegalDocumentRef" SessionField="LDId" />
                            <asp:ControlParameter ControlID="ddlAgent" Name="AgentRef" PropertyName="SelectedValue" />
                            <asp:Parameter Name="CourtDate" />
                            <asp:Parameter Name="ReferToExpertDate" />
                            <asp:ControlParameter ControlID="txtExpertName" Name="ExpertName" PropertyName="Text" />
                            <asp:Parameter Name="ExpertVerdictAnnounceDate" />
                            <asp:ControlParameter ControlID="txtFinalVerdict" Name="FinalVerdict" PropertyName="Text" />
                            <asp:Parameter Name="FinalVerdictDate" />
                            <asp:Parameter Name="ProtestVerdictDate" />
                            <asp:ControlParameter ControlID="txtNotes" Name="Notes" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtReconsiderVote" Name="ReconsiderVote" PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
    </table> 
       
                    <asp:GridView ID="gvCourtSessions" runat="server" AutoGenerateColumns="False" Caption="لیست جلسات دادگاه" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsSessions" GridLines="None" Width="95%" OnRowDeleting="gvCourtSessions_RowDeleting" ForeColor="#333333" OnRowDataBound="gvCourtSessions_RowDataBound" OnRowDeleted="gvCourtSessions_RowDeleted">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField DeleteText="حذف" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="AgentName" HeaderText="نماینده حقوقی" ReadOnly="True" SortExpression="AgentName" />
                            <asp:BoundField DataField="CourtDate" HeaderText="تاریخ دادگاه" SortExpression="CourtDate" />
                            <asp:BoundField DataField="RefereToExpertDate" HeaderText="تاریخ ارجاع به کارشناس" SortExpression="RefereToExpertDate" />
                            <asp:BoundField DataField="ExpertName" HeaderText="نام کارشناس" SortExpression="ExpertName" />
                            <asp:BoundField DataField="ExpertVerdictAnnounceDate" HeaderText="تاریخ اعلام رای کارشناس" SortExpression="ExpertVerdictAnnounceDate" />
                            <asp:BoundField DataField="FinalVerdict" HeaderText="رای نهایی" SortExpression="FinalVerdict" />
                            <asp:BoundField DataField="FinalVerdictDate" HeaderText="تاریخ رای نهایی" SortExpression="FinalVerdictDate" />
                            <asp:BoundField DataField="ProtestVerdictDate" HeaderText="تاریخ اعتراض به رای" SortExpression="ProtestVerdictDate" />
                            <asp:BoundField DataField="Notes" HeaderText="توضیحات" SortExpression="Notes" />
                            <asp:BoundField DataField="ReconsiderVote" HeaderText="رای تجدید نظر" SortExpression="ReconsiderVote" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            هنوز هیچ جلسه دادگاهی تعریف نشده است
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" Height="50px" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
               
        <table style="width:100%">
        <tr><td colspan="2">                         <asp:Button ID="btnSessionsPrevious" Width="30%" runat="server" BackColor="#0099CC" 
                        CausesValidation="False" CssClass="bigButton"  Text="<    مرحله قبل " OnClick="btnSessionsPrevious_Click"  />
                                   <asp:Button ID="btnViewSummary" Width="30%" runat="server" BackColor="#0099CC"
                         CausesValidation="False" CssClass="bigButton"  Text="تایید اطلاعات     &gt;" OnClick="btnViewSummary_Click" />
                </td></tr>

        </table>
    </asp:View>
    <asp:View ID="viwSummary" runat="server">    
        <div style="font-size:x-large;">اطلاعات پرونده حقوقی با موفقیت افزوده شد. 
        <br />
        جهت ویرایش اطلاعات پرونده در هر زمان می توانید با ورود به قسمت "مشاهده پرونده های پیشین" پرونده مورد نظر را ویرایش نمایید.
        </div>
        <asp:Button ID="btnSummaryPrevious" runat="server" BackColor="#0099CC" CausesValidation="False" CssClass="bigButton"  Text="&lt;    مرحله قبل " Width="30%" OnClick="btnSummaryPrevious_Click" />
    
    </asp:View>
    </asp:MultiView>
    
</asp:Content>
