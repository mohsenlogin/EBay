<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LMS.Login" %>
<%@ MasterType VirtualPath="~/Site.master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .auto-style1
    {
        height: 50px;
    }
        .auto-style3
        {
            height: 79px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    
    <table style="width:100%;text-align:center;direction:rtl">
        <tr>
            
            <td><img src="Images/login.png" width="100"/> 
         
                    <asp:ValidationSummary ID="vsErrors" runat="server" CssClass="validationErrors" HeaderText="لطفاً اشکالات زیر را بررسی و رفع نمایید:" 
                        ToolTip="لطفاً اشکالات زیر را بررسی و رفع نمایید:" ValidationGroup="Login" />
                </div>         
       </td>   </tr>
        <tr>
            
            <td class="auto-style3" >
                <img alt="" src="Images/user.png" width="50" style="vertical-align: middle;" /><asp:label runat="server" CssClass="tableLabels"> نام کاربری :  </asp:label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="formControls" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="ورود نام کاربری الزامی است." ControlToValidate="txtUsername" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                         
               </td>
        </tr>
        <tr>
           
            <td>
                <img alt="" src="Images/pas.png" width="80" style="vertical-align: middle;" />گذرواژه:  
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="formControls"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="لطفاً گذرواژه خود را وارد نمایید" ControlToValidate="txtPassword" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="Login">*</asp:RequiredFieldValidator>
                         
                </td>  </tr>
        <tr style="text-align:center;" ><div style="text-align:center;display:block;">
            <td > <botdetect:webformscaptcha ID="capLogin" runat="server" CssClass="centerize" SoundStyle="Synth" HelpLinkEnabled="True" UseHorizontalIcons="False"/>
    <asp:TextBox ID="txtCaptchaCode" runat="server" PlaceHolder="حروف تصویر را وارد نمایید" CssClass="formControls" /></td>  </div>       
        </tr>
        <tr>
            
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="ورود به سامانه" CssClass="tiny" 
                    BackColor="#0099CC" Font-Bold="True" Font-Size="Small" ForeColor="White" Height="50px"
                     OnClick="btnLogin_Click" Width="200px" Font-Names="DefaultFont" ValidationGroup="Login" />
            </td>
        </tr>
    </table>
       
</asp:Content>
