<%@ Page Title="" Language="C#" MasterPageFile="~/CityAffairs/Manager.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="LMS.CityAffairs.Reports" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <table style="width:100%;">
        <tr>
            <td><asp:SqlDataSource ID="sdsMunicipalities" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Municipality] ORDER BY [Name]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlMunicipality" runat="server" DataSourceID="sdsMunicipalities" 
                    DataTextField="Name" DataValueField="Id" Height="50px" Font-Names="DefaultFont"
                    style="position:relative;right:-400px; top:80px;"></asp:DropDownList>
  </td>
            <td>&nbsp;</td>
            <td>    <div style="text-align:center;">
            
                        <asp:Button ID="btnRefreshReport" runat="server" BackColor="Red" CssClass="bigButton"  OnClick="btnInsert_Click" Text="نمایش گزارش" />
            
         </div>   
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
                </rsweb:ReportViewer>
            </td>
        </tr>
    </table>
    <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="usp_GetLegalDocs" TypeName="LMS.LMSEntitiy, LMS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="municipalityId" Type="Object"></asp:Parameter>
            <asp:Parameter DefaultValue="" Name="title" Type="String"></asp:Parameter>
            <asp:Parameter DefaultValue="" Name="number" Type="String"></asp:Parameter>
            <asp:Parameter DefaultValue="" Name="summary" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>--%>
</asp:Content>
