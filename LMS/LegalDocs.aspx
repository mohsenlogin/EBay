<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="LegalDocs.aspx.cs" Inherits="LMS.LegalDocs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <table style="width:100%; text-align:center; direction:rtl;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                 <asp:TextBox ID="txtSearch" runat="server" CssClass="bigControlsWithBorder" placeholder="جستجو در پرونده های حقوقی موجود با تایپ قسمتی از عنوان، خلاصه یا هر چیزی که ازپرونده به خاطر دارید!" Width="90%" ToolTip="با تایپ قسمتی از عنوان، خلاصه یا هر چیزی که ازپرونده به خاطر دارید آنرا بیابید!"></asp:TextBox>
               <asp:ImageButton ImageUrl="Images/search.png"  style="vertical-align:middle;width:50px;position:relative; right:-70px;top:0px; " runat="server" BorderWidth="0" ID="ibtnSearch" OnClick="ibtnSearch_Click" /> 
         
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:SqlDataSource ID="sdsLegalDocs" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="usp_GetLegalDocs" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="MunicipalityId" SessionField="OId" Type="Int32" />
                        <asp:ControlParameter ControlID="txtSearch" Name="Title" PropertyName="Text" Type="String" DefaultValue="%" />
                        <asp:ControlParameter ControlID="txtSearch" Name="Number" PropertyName="Text" Type="String" DefaultValue="%" />
                        <asp:ControlParameter ControlID="txtSearch" Name="Summary" PropertyName="Text" Type="String" DefaultValue="%" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class ="roundCorners" style="width:95%; text-align:center;">
                <asp:GridView ID="gvLegalDocs" runat="server" CellPadding="4" DataSourceID="sdsLegalDocs" ForeColor="#333333" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDataBound="gvLegalDocs_RowDataBound" Caption="پرونده های حقوقی ثبت شده" OnRowCommand="gvLegalDocs_RowCommand1" OnRowDeleted="gvLegalDocs_RowDeleted">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ButtonField CommandName="EditRecord" InsertVisible="False" Text="ویرایش"   />
                        <asp:ButtonField CommandName="CourtSessions" Text="جلسات دادگاه" />
                        <asp:TemplateField HeaderText="حذف" SortExpression="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="Button1" Text="تغییر" runat="server" CommandArgument='<%#Eval("Id")%>'/>
            </ItemTemplate>
        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title" />
                        <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                        <asp:BoundField DataField="WorkflueStatus" HeaderText="وضعیت گردش کار" SortExpression="WorkflueStatus" />
                        <asp:BoundField DataField="Summary" HeaderText="خلاصه" SortExpression="Summary" />
                        <asp:BoundField DataField="CourtRoomDate" HeaderText="تاریخ دادگاه" SortExpression="CourtRoomDate" >
                        <ControlStyle Font-Names="tahoma" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CategoryName" HeaderText="طبقه بندی" SortExpression="CategoryName" />
                        <asp:BoundField DataField="CourtName" HeaderText="نام دادگاه" SortExpression="CourtName" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <EmptyDataTemplate>
                        هیچ پرونده ای با شرایط مذکور وجود ندارد
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="60px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="topCornerRound" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" Height="40px" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                    </div>
            </td>
        </tr>
    </table>
</asp:Content>
