<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignationPopUp.aspx.cs" Inherits="DesignationPopUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>



     <script type="text/javascript">
         function validationCheck() {
             var summary = "";
             summary += isvalidFirstname();
             if (summary != "") {
                 alert(summary);
                 return false;
             }
             else {
                 return true;
             }
         }
         
         function isvalidFirstname() {
             var id;
             var temp = document.getElementById("<%=RadTextBox1.ClientID %>");
             id = temp.value;
             if (id == "") {
                 return ("Please enter Designation Name" + "\n");
             }
             else {
                 return "";
             }
         }
     </script>

        <div align="center">

            DESIGNATION<br />
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <br />
            Designation Name<br />
            <telerik:RadTextBox ID="RadTextBox1" runat="server"></telerik:RadTextBox>
            <br />
            <br />
            <br />
            <telerik:RadButton ID="RadButton1" runat="server" Text="Create Designation" OnClick="RadButton1_Click"></telerik:RadButton>
            </div>
    
        </div>
    </form>
</body>
</html>
