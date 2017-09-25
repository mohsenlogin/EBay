<%@ Page Title="" Language="C#" MasterPageFile="~/CityAffairs/Manager.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LMS.CityAffairs.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <center>
        <div>
<asp:SqlDataSource ID="sdsMunicipalities" runat="server" ConnectionString="<%$ ConnectionStrings:LegalMSConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Municipality] ORDER BY [Name]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlMunicipality" runat="server" DataSourceID="sdsMunicipalities" 
                    DataTextField="Name" DataValueField="Id" Height="50px" Font-Names="DefaultFont"
                    style="position:relative;right:-400px; top:80px;" OnSelectedIndexChanged="ddlMunicipality_SelectedIndexChanged"></asp:DropDownList>
        </div>
    <table style="width:70%; vertical-align:middle; font-family:DefaultFont;font-size:19px; font-weight:bold;" dir="rtl">
       <tr>           
            <td colspan="3" style="text-align:center;">               
                 <asp:TextBox ID="txtSearch" runat="server" CssClass="bigControlsWithBorder" placeholder="                                               جستجو در پرونده های حقوقی موجود با تایپ قسمتی از عنوان، خلاصه یا هر چیزی که ازپرونده به خاطر دارید  !" Width="90%" ToolTip="                            با تایپ قسمتی از عنوان، خلاصه یا هر چیزی که ازپرونده به خاطر دارید آنرا بیابید!" AutoCompleteType="Search"></asp:TextBox>
               <asp:ImageButton ImageUrl="../Images/search.png"  style="vertical-align:middle;width:50px;position:relative; right:-70px;top:2px; " runat="server" BorderWidth="0" ID="ibtnSearch" OnClick="ibtnSearch_Click" /> 
            </td>
        </tr>
        <tr>
            <td class="BigTitle" id="tdReportByMunicipality" onmouseover="document.getElementById('tdReportByMunicipality').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdReportByMunicipality').style.backgroundColor = 'white';" >
                <a class="noUnderLine" href="AddLegalDoc.aspx" ><img src="../Images/report.png" style="width:120px;height:120px;"  /><br /></a><a href="AddLegalDoc.aspx">گزارش پرونده ها به تفکیک شهرداری</a> </td>
             <td class="BigTitle" id="tdReportSuspendedDocs"
                  onmouseover="document.getElementById('tdReportSuspendedDocs').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdReportSuspendedDocs').style.backgroundColor = 'white';" >
                 <a class="noUnderLine" href="" ><img src="../Images/report2.PNG" style="width:120px;height:120px;"  /><br />گزارش پرونده های معلق</a> </td>
              <td class="BigTitle" id="tdReportGeneral" 
                   onmouseover="document.getElementById('tdReportGeneral').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdReportGeneral').style.backgroundColor = 'white';"><a class="noUnderLine" href="Reports.aspx" ><img src="../Images/report-general.png" style="width:120px;height:120px;"  /><br />گزارش کلی پرونده ها</a> </td>
       
        </tr>
        <tr>
            <td class="BigTitle" id="tdAddNewLegalDoc" onmouseover="document.getElementById('tdAddNewLegalDoc').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdAddNewLegalDoc').style.backgroundColor = 'white';" >
                <a class="noUnderLine" href="../AddLegalDoc.aspx" ><img src="../Images/Legal.png" style="width:120px;height:120px;"  /><br />ثبت پرونده حقوقی جدید</a> </td>
              <td class="BigTitle" id="tdManageLegalDocs" 
                   onmouseover="document.getElementById('tdManageLegalDocs').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdManageLegalDocs').style.backgroundColor = 'white';"><a class="noUnderLine" href="AllLegalDocs.aspx" ><img src="../Images/archive.png" style="width:120px;height:120px;"  /><br />مشاهده پیشینه پرونده ها</a> </td>
        <td class="BigTitle" id="tdManagePersons"
                  onmouseover="document.getElementById('tdManagePersons').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdManagePersons').style.backgroundColor = 'white';" >
                 <a class="noUnderLine" href="SystemSettings.aspx" ><img src="../Images/Settings.PNG" style="width:120px;height:120px;"  /><br />تنظیمات سامانه</a> </td>
             
        </tr>
        <tr>
            <td class="BigTitle" id="tdCategories" onmouseover="document.getElementById('tdCategories').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdCategories').style.backgroundColor = 'white';" >
                <a class="noUnderLine" href="Categories.aspx" ><img src="../Images/Category.png" style="width:120px;height:120px;"  /><br /></a><a href="Categories.aspx">دسته بندی های پرونده های حقوقی</a> </td>
             <td class="BigTitle" id="tdCourts"
                  onmouseover="document.getElementById('tdCourts').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdCourts').style.backgroundColor = 'white';" >
                 <a class="noUnderLine" href="Courts.aspx" ><img src="../Images/Court.png" style="width:120px;height:120px;"  /><br />تعاریف دادگاهها و محاکم</a> </td>
              <td class="BigTitle" id="tdPosts" 
                   onmouseover="document.getElementById('tdPosts').style.backgroundColor = 'gold';"
                onmouseout="document.getElementById('tdPosts').style.backgroundColor = 'white';"><a class="noUnderLine" href="LegalDocs.aspx" ><img src="../Images/posts.png" style="width:120px;height:120px;"  /><br />تعاریف بخش های/پستهای شهرداریها</a> </td>
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
