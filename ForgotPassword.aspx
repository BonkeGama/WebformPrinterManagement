<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <div>
            <table style="width: 100%;">
                <caption class="style6">
                    RECOVER ACCOUNT
                </caption>
                <tr>
                    <td class="style1"></td>
                    <td class="style2"></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="style1"></td>
                    <td class="style2">Email Address
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBox1" runat="server"></telerik:RadTextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="style1"></td>
                    <td class="style2"></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="lbmsg" runat="server">  
                        </asp:Label>
                    </td>
                    <td class="style2">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Login  
                        </asp:LinkButton>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
