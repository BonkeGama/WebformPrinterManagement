<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPrinters.aspx.cs" Inherits="AddPrinters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" class="box" runat="server">
   
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
                    return ("Please enter Printer Name" + "\n");
                }
                else {
                    return "";
                }
            }
        </script>
     <div align="center">
        ADD PRINTER<br />
        <table>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel1" Text="Printer Name" runat="server"></telerik:RadLabel>
                </td>
                <td>

                    <telerik:RadTextBox ID="RadTextBox1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel2" runat="server">
                        Printer Make
                    </telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadComboBox ID="RadComboBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                    </telerik:RadComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>" SelectCommand="SELECT [PrinterMakeID], [PrinterMake] FROM [PrinterMakeTbl]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel3" Text="Folder To Moniter" runat="server"></telerik:RadLabel>
                    <br />
                </td>
                <td>

                    <telerik:RadTextBox ID="RadTextBox2" runat="server"></telerik:RadTextBox>
                </td>

            </tr>

            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel5" runat="server">
                        Output Type
                    </telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="RadTextBox3" runat="server"></telerik:RadTextBox>
                </td>
            </tr>


            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel4" runat="server">
                        File Output
                    </telerik:RadLabel>
                </td>

                <td>
                    <telerik:RadTextBox ID="RadTextBox4" runat="server"></telerik:RadTextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <telerik:RadRadioButtonList ID="RadRadioButtonList1" runat="server" Direction="Horizontal">
                        <Items>
                            <telerik:ButtonListItem Text="Active" Value="1" />
                            <telerik:ButtonListItem Text="InActive" Value="0" />
                        </Items>
                    </telerik:RadRadioButtonList>
                </td>
            </tr>

            <tr>
                <td>
                    <telerik:RadButton ID="RadButton1" runat="server" OnClick="RadButton1_Click" OnClientClicked="CloseAndRebind" Text="Add Printer">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </div>
    
 </form>

</body>
</html>
