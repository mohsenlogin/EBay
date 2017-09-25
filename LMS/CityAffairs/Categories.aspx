<%@ Page Title="" Language="C#" MasterPageFile="~/CityAffairs/Manager.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="LMS.CityAffairs.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
     <table style="text-align:center" >
       
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"  CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ToolTip="اطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="Categories" />
            </td>            
        </tr>
        <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtName" ErrorMessage="تعیین عنوان دسته بندی ضروری است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="تیتر پرونده" ValidationGroup="Categories">*</asp:RequiredFieldValidator>
                عنوان:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="formControls" ValidationGroup="Categories" Width="100%"></asp:TextBox>
            </td>
         </tr>
         <tr>
            <td class="tableLabels">
                شرح:</td>
            <td>
                <asp:TextBox ID="txtNotes" runat="server" CssClass="formControls" Height="70px" TextMode="MultiLine"></asp:TextBox>
            </td>
         </tr>
         <tr>
            <td class="tableLabels">
                <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Category] ([Name], [Notes]) VALUES (@Name, @Notes)" SelectCommand="SELECT [Id], [Name], [Notes] FROM [Category] ORDER BY [Name]" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Notes] = @Notes WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtNotes" Name="Notes" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
             </td>
            <td>
                    <asp:Button ID="btnInsert" runat="server" BackColor="#0099CC" CausesValidation="False" CssClass="bigButton"  OnClick="btnInsert_Click" Text="ثبت" ValidationGroup="Categories" Width="90%" />
            </td>
         </tr>
         <tr>
             <td colspan="2">
                  
             </td>
         </tr>
       </table>
      <div class ="roundCorners" style = "width:95%; text-align:center;">
                        <asp:GridView ID="gvCategories" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsCategory" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvCategories_SelectedIndexChanged" Width="90%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField DeleteText="حذف" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="Name" HeaderText="عنوان" SortExpression="Name" />
                                <asp:BoundField DataField="Notes" HeaderText="شرح" SortExpression="Notes" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" CssClass="topCornerRound" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" Height="50px" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
</asp:Content>
