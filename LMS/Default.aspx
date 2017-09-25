<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LMS._Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <center>
    <table style="width:70%; vertical-align:middle; font-family:DefaultFont;font-size:19px; font-weight:bold;" dir="rtl">
        <tr>
            <td colspan="3" style="text-align:center;">
                 <asp:TextBox ID="txtSearch" runat="server" CssClass="bigControlsWithBorder" placeholder="جستجو در پرونده های حقوقی موجود با تایپ قسمتی از عنوان، خلاصه یا هر چیزی که ازپرونده به خاطر دارید!" Width="90%" ToolTip="با تایپ قسمتی از عنوان، خلاصه یا هر چیزی که ازپرونده به خاطر دارید آنرا بیابید!" AutoCompleteType="Search"></asp:TextBox>
               <asp:ImageButton ImageUrl="Images/search.png"  style="vertical-align:middle;width:50px;position:relative; right:-70px;top:2px; " runat="server" BorderWidth="0" ID="ibtnSearch" OnClick="ibtnSearch_Click" OnCommand="ibtnSearch_Command" /> 
            </td>
        </tr>
        <tr>
            <td class="BigTitle" id="tdAddNewLegalDoc" onmouseover="document.getElementById('tdAddNewLegalDoc').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdAddNewLegalDoc').style.backgroundColor = 'white';" >
                <a class="noUnderLine" href="AddLegalDoc.aspx" ><img src="Images/Legal.png" style="width:120px;height:120px;"  /><br />ثبت پرونده حقوقی جدید</a> </td>
             <td class="BigTitle" id="tdManagePersons"
                  onmouseover="document.getElementById('tdManagePersons').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdManagePersons').style.backgroundColor = 'white';" >
                 <a class="noUnderLine" href="" ><img src="Images/user2.PNG" style="width:120px;height:120px;"  /><br />تعریف و مدیریت اشخاص</a> </td>
              <td class="BigTitle" id="tdManageLegalDocs" 
                   onmouseover="document.getElementById('tdManageLegalDocs').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdManageLegalDocs').style.backgroundColor = 'white';"><a class="noUnderLine" href="LegalDocs.aspx" ><img src="Images/archive.png" style="width:120px;height:120px;"  /><br />مشاهده پیشینه پرونده ها</a> </td>
        </tr>
       <%-- <tr>
                <td class="BigTitle"><a class="noUnderLine" href="" ><img src="../Images/add139.png" style="width:120px;height:120px;"  /><br /></a> </td>
             <td class="BigTitle"><a class="noUnderLine" href="" ><img src="../Images/statistics.png" style="width:120px;height:120px;"  /><br /></a> </td>
           
             <td class="BigTitle"><a class="noUnderLine" href="" ><img src="../Images/education31.png" style="width:120px;height:120px;"  /><br /></a> </td>
        </tr>
          --%>
    </table>
        </center>
</asp:Content>