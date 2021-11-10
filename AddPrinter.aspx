<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddPrinter.aspx.cs" Inherits="AddPrinter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

     <script type="text/javascript">
         function CloseAndRebind(args) {
             GetRadWindow().BrowserWindow.refreshGrid(args);
             GetRadWindow().close();
         }

         function GetRadWindow() {
             var oWindow = null;
             if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
             else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

             return oWindow;
         }

         function CancelEdit() {
             GetRadWindow().close();
         }
     </script>

               <telerik:RadScriptManager ID="RadScriptManager2" runat="server">
                <Scripts>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                </Scripts>
            </telerik:RadScriptManager>

    <div align="center">
        
        ADD PRINTER<br />
        <table  OnItemCommand="Item_ItemCommand" >
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
                    <telerik:RadButton ID="RadButton1" runat="server" CommandName="PerformInsert" OnClick="RadButton1_Click" Text="Add Printer">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
   
    </div>


    </asp:Content>

