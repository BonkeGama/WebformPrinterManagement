<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrinterMake.aspx.cs" Inherits="PrinterMake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager> <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
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
                    return ("Please enter Printer Make" + "\n");
                }
                else {
                    return "";
                }
            }
    </script>
    
    <script type="text/javascript">
        function MyClientShowing(sender, eventArgs) {

            eventArgs.set_cancelNativeDisplay(true);
            $telerik.$(eventArgs.get_loadingElement()).show("slow");
        }
        function MyClientHiding(sender, eventArgs) {

            eventArgs.set_cancelNativeDisplay(true);
            $telerik.$(eventArgs.get_loadingElement()).hide("slow");
        }
    </script>
    
        <br />
            <br />

    <div align="center">
        PRINTER MAKE<br />
        <br />
        <table>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel1" runat="server">
                        Printer Make
                    </telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="RadTextBox1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadButton ID="RadButton1" runat="server" Text="Create" OnClick="RadButton1_Click"></telerik:RadButton>
                </td>
            </tr>
        </table>
        <br />

        </div>
        <br />

    <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowMultiRowEdit="True" AllowMultiRowSelection="True" AllowPaging="True" AllowSorting="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="PrinterMakeID" DataSourceID="SqlDataSource1">
            <Columns>
               
                <telerik:GridBoundColumn DataField="PrinterMake" FilterControlAltText="Filter PrinterMake column" HeaderText="PrinterMake" SortExpression="PrinterMake" UniqueName="PrinterMake">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreateDate" DataType="System.DateTime" FilterControlAltText="Filter CreateDate column" HeaderText="CreateDate" SortExpression="CreateDate" UniqueName="CreateDate">
                </telerik:GridBoundColumn>
                  <telerik:GridButtonColumn UniqueName="DeleteColumn"
                        ButtonType="ImageButton"
                        CommandName="Delete"
                        ConfirmText='Are you sure you want to delete this record?'
                        ConfirmTitle="Delete Record"
                        ConfirmDialogType="RadWindow"
                        Text="Delete">
                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                    </telerik:GridButtonColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>" DeleteCommand="DELETE FROM [PrinterMakeTbl] WHERE [PrinterMakeID] = @PrinterMakeID" InsertCommand="INSERT INTO [PrinterMakeTbl] ([PrinterMake], [CreateDate]) VALUES (@PrinterMake, @CreateDate)" SelectCommand="SELECT * FROM [PrinterMakeTbl]" UpdateCommand="UPDATE [PrinterMakeTbl] SET [PrinterMake] = @PrinterMake, [CreateDate] = @CreateDate WHERE [PrinterMakeID] = @PrinterMakeID">
        <DeleteParameters>
            <asp:Parameter Name="PrinterMakeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PrinterMake" Type="String" />
            <asp:Parameter Name="CreateDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PrinterMake" Type="String" />
            <asp:Parameter Name="CreateDate" Type="DateTime" />
            <asp:Parameter Name="PrinterMakeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </asp:Content>

