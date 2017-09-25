<%@ Page Title="" Language="C#" MasterPageFile="~/CityAffairs/Manager.Master" AutoEventWireup="true" CodeBehind="Courts.aspx.cs" Inherits="LMS.CityAffairs.Courts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
     <table style="text-align:center" >
       
        <tr>
            <td colspan="4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"  CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ToolTip="اطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="Courts" />
            </td>            
        </tr>
        <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="تعیین نام دادگاه/دادسرا ضروری است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="نام دادگاه/محکمه ...." ValidationGroup="Courts">*</asp:RequiredFieldValidator>
                نام:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="formControls" ValidationGroup="Courts"></asp:TextBox>
            </td>
            <td>
                نوع:</td>
            <td>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="formControls"  Height="35" Width="100%" ValidationGroup="Courts" Font-Names="DefaultFont">
                    <asp:ListItem>&lt; انتخاب نوع دادگاه/محکمه &gt;</asp:ListItem>
                    <asp:ListItem>دادسرا</asp:ListItem>
                    <asp:ListItem>شورای حل اختلاف</asp:ListItem>
                    <asp:ListItem>سایر</asp:ListItem>
                </asp:DropDownList></td>
         </tr>
         <tr>
            <td class="tableLabels">
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="تعیین تلفن ضروری است" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="شماره تلفن" ValidationGroup="Courts">*</asp:RequiredFieldValidator>
                تلفن:</td>
            <td>
                
                <asp:TextBox ID="txtPhone" runat="server" CssClass="formControls" ValidationGroup="Courts"></asp:TextBox>
                
            </td>
            <td>
                استان:</td>
            <td>
                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="formControls" Width="100%" Height="35px"  DataSourceID="sdsProvinces" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged" ValidationGroup="Courts">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsProvinces" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Province] ORDER BY [Name]"></asp:SqlDataSource>
             </td>
         </tr>
        <tr>
            <td class="tableLabels" rowspan="2">
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="آدرس را مشخص نکرده اید" Font-Bold="True" Font-Size="Large" ForeColor="Red" ToolTip="آدرس دقیق پستی" ValidationGroup="Courts">*</asp:RequiredFieldValidator>
                آدرس:</td>
            <td rowspan="2">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="formControls" ValidationGroup="Courts" Width="100%" Height="100%" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                شهر:</td>
            <td>
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="formControls" Width="100%" Height="35px"  DataSourceID="sdsCities" DataTextField="Name" DataValueField="Id" ValidationGroup="Courts">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsCities" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name], [ProvinceRef] FROM [City] WHERE ([ProvinceRef] = @ProvinceRef) ORDER BY [Name]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlProvince" Name="ProvinceRef" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
         </tr>
        
         <tr>
            <td>
                کد پستی:</td>
            <td>
                <asp:TextBox ID="txtPostalCode" runat="server" CssClass="formControls" ValidationGroup="Courts"></asp:TextBox>
             </td>
         </tr>
         <tr>
            <td class="tableLabels">
                <asp:SqlDataSource ID="sdsCourts" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" DeleteCommand="DELETE FROM [Court] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [ProvinceRef] = @original_ProvinceRef AND [CityRef] = @original_CityRef AND [Address] = @original_Address AND [Phone] = @original_Phone AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL))" InsertCommand="INSERT INTO [Court] ([Name], [ProvinceRef], [CityRef], [Address], [Phone], [Type], [PostalCode]) VALUES (@Name, @ProvinceRef, @CityRef, @Address, @Phone, @Type, @PostalCode)" SelectCommand="SELECT [Id], [Name], [ProvinceRef], [CityRef], [Address], [Phone], [Type], [PostalCode] FROM [Court] ORDER BY [Name]" UpdateCommand="UPDATE [Court] SET [Name] = @Name, [ProvinceRef] = @ProvinceRef, [CityRef] = @CityRef, [Address] = @Address, [Phone] = @Phone, [Type] = @Type, [PostalCode] = @PostalCode WHERE [Id] = @original_Id AND [Name] = @original_Name AND [ProvinceRef] = @original_ProvinceRef AND [CityRef] = @original_CityRef AND [Address] = @original_Address AND [Phone] = @original_Phone AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_ProvinceRef" Type="Int32" />
                        <asp:Parameter Name="original_CityRef" Type="Int32" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Type" Type="String" />
                        <asp:Parameter Name="original_PostalCode" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlProvince" Name="ProvinceRef" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlCity" Name="CityRef" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtAddress" Name="Address" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlType" Name="Type" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtPostalCode" Name="PostalCode" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="ProvinceRef" Type="Int32" />
                        <asp:Parameter Name="CityRef" Type="Int32" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="PostalCode" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_ProvinceRef" Type="Int32" />
                        <asp:Parameter Name="original_CityRef" Type="Int32" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Type" Type="String" />
                        <asp:Parameter Name="original_PostalCode" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
             </td>
            <td>
                    <asp:Button ID="btnInsert" runat="server" BackColor="#0099CC" CssClass="bigButton"  OnClick="btnInsert_Click" Text="ثبت" ValidationGroup="Courts" Width="90%" />
            </td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
         </tr>
         <tr>
             <td colspan="2">
                  
             </td>
             <td>
                  
                 &nbsp;</td>
             <td>
                  
                 &nbsp;</td>
         </tr>
       </table>
      <div class ="roundCorners" style = "text-align:center;">
                        <asp:GridView ID="gvCourts" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsCourts" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvCourts_SelectedIndexChanged" Width="90%" Caption="لیست دادگاهها و محاکم">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField DeleteText="حذف" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                <asp:BoundField DataField="Type" HeaderText="نوع" SortExpression="Type" />
                                <asp:BoundField DataField="ProvinceRef" HeaderText="استان" SortExpression="ProvinceRef" />
                                <asp:BoundField DataField="CityRef" HeaderText="شهر" SortExpression="CityRef" />
                                <asp:BoundField DataField="Phone" HeaderText="تلفن" SortExpression="Phone" />
                                <asp:BoundField DataField="PostalCode" HeaderText="کد پستی" SortExpression="PostalCode" />
                                <asp:BoundField DataField="Address" HeaderText="آدرس" SortExpression="Address" />
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
