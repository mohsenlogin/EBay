<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteMe.aspx.cs" Inherits="LMS.deleteMe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtInputText" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
        <asp:Button ID="btnGo" runat="server" OnClick="btnGo_Click" Text="GO" />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
