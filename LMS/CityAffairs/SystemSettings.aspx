<%@ Page Title="" Language="C#" MasterPageFile="~/CityAffairs/Manager.Master" AutoEventWireup="true" CodeBehind="SystemSettings.aspx.cs" Inherits="LMS.CityAffairs.SystemSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div style="text-align:center;">
    <asp:CheckBox ID="chkIsSystemActive" runat="server" Text="سامانه غیر فعال شود" />
                        <asp:Button ID="btnOk" runat="server" BackColor="#0099CC" CssClass="bigButton"  OnClick="btnInsert_Click" Text="ثبت" ValidationGroup="Courts" Width="30%" />
            
                        <asp:Button ID="btnCancel" runat="server" BackColor="Red" CssClass="bigButton"  OnClick="btnInsert_Click" Text="لفو تغییرات" ValidationGroup="Courts" Width="30%" />
            
    <asp:SqlDataSource ID="sdsSettings" runat="server"></asp:SqlDataSource>
         </div>   
</asp:Content>
