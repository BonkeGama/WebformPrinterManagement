<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrinterManagement.aspx.cs" Inherits="PrinterManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- Multiple delete script--%>

     <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
        <Windows>

            <telerik:RadWindow ID="RadWindow1" runat="server" NavigateUrl="AddPrinters.aspx" Style="display: none;" MinHeight="500px" MinWidth="1000px" Modal="True" OnClientClose="NationClientClose" InitialBehavior="None" VisibleStatusbar="False">
            </telerik:RadWindow>

            <telerik:RadWindow ID="RadWindowEdit" runat="server" Style="display: none;" MinHeight="500px" MinWidth="1000px" Modal="True" VisibleStatusbar="False">
            </telerik:RadWindow>

            <telerik:RadWindow RenderMode="Lightweight" ID="UploadFile" runat="server" Title="Upload file" MinHeight="500px" MinWidth="1000px"
                Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                Modal="true" NavigateUrl="DocumentManagement.aspx" OnClientClose="NationClientClose" VisibleStatusbar="False">
            </telerik:RadWindow>

              <telerik:RadWindow ID="DeletePrinterWindow" runat="server" Au  MinHeight="500px" MinWidth="1000px" Modal="True" VisibleOnPageLoad="False">

           <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <h2>Select printers to be deleted</h2>
                        <br />
                    </td>
                </tr>
                <tr><td>
                        <telerik:RadListBox   runat="server" ID="DeleteListi" DataTextField="PrinterName" DataValueField="EngenPrintersID" SelectionMode="Multiple"></telerik:RadListBox>
                    </td></tr>
            <tr><td>
                 <telerik:RadButton  runat="server" ID="DeleteLis" Text="Delete selected printers" OnClick="DelPrinter"></telerik:RadButton>
                </td></tr>
          
                </table>
        </ContentTemplate>
    </telerik:RadWindow>

        </Windows>
    </telerik:RadWindowManager>
  
     <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">

          <style type="text/css">
            .orderText {
                font: normal 12px Arial,Verdana;
                margin-top: 6px;
            }

        </style>
            <style type="text/css">
                .MyButton {
                    width: 30px;
                    height: 30px;
                }

    </style>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">

            <script type="text/javascript"> 
        function NationClientClose(sender, args) {
                    window.location.reload();
	
         }
            </script>
 
    <script type="text/javascript"> 
        function clearRadDatePicker() {
            var datepicker1 = $find("<%= RadDatePicker1.ClientID %>");
        var datepicker2 = $find("<%= RadDatePicker2.ClientID %>");
            datepicker1.clear();
            datepicker2.clear();
        }
    </script>

        <script type="text/javascript">
            function ShowEditForm(id, rowIndex) {
                var grid = $find("<%= OrdersGrid.ClientID %>");
 
                var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                grid.get_masterTableView().selectItem(rowControl, true);
 
                window.radopen("PrinterEdit.aspx?EngenPrintersID=" + id, "RadWindowEdit");
                return false;
            }

       function Addprinters() {
         window.radopen("AddPrinters.aspx", "RadWindow1");
                return false;
            }       
            function pop() {
                window.radopen("", "multidel");
                return false;
            }

            function ShowUploadForm() {
                window.radopen("DocumentPopUp.aspx", "UploadFile");
                return false;
            }

            function refreshGrid(arg) {
                if (!arg) {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                }
                else {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                }
            }

            function RowDblClick(sender, eventArgs) {
                window.radopen("PrinterEdit.aspx?EngenPrintersID=" + eventArgs.getDataKeyValue("EngenPrintersID"), "RadWindowEdit");
            }

            function closeRadWindow() {
                $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest();
            }

        </script>
        <script type="text/javascript">
            function RowSelected(sender, eventArgs) {
                var grid = sender;
                var MasterTable = grid.get_masterTableView(); var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
                var cell = MasterTable.getCellByColumnUniqueName(row, "EngenPrintersID");
                //here cell.innerHTML holds the value of the cell  
            }
            function GetSelectedNames() {
                var grid = $find("<%=OrdersGrid.ClientID %>");
                var MasterTable = grid.get_masterTableView();
                var selectedRows = MasterTable.get_selectedItems();
                for (var i = 0; i < selectedRows.length; i++) {
                    var row = selectedRows[i];
                    var cell = MasterTable.getCellByColumnUniqueName(row, "EngenPrintersID")
                    //here cell.innerHTML holds the value of the cell    
                }
            }
        </script>

        </telerik:RadCodeBlock>
   <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="OrdersGrid" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="OrdersGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="OrdersGrid" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="OrdersGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="OrdersGrid"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="Label3"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="Label4"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

     <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
        <telerik:RadAjaxLoadingPanel runat="server" ID="gridLoadingPanel"></telerik:RadAjaxLoadingPanel>
 
    <div class="demo-container" runat="server" id="demoContainer" align="center">
              PRINTERS<br />
        <br />
       <table>
           <tr>
               <td>
                   <telerik:RadLabel ID="RadLabel4" runat="server">Printer Make</telerik:RadLabel>
               </td>
               <td>
                   <telerik:RadComboBox ID="NamesDDL" runat="server" AutoPostBack="True" DataSourceID="dllDataSource"
                       DataTextField="PrinterMake" DataValueField="PrinterMakeID"
                       AppendDataBoundItems="true">
                       <Items>
                           <telerik:RadComboBoxItem Text="All" Value="0" Selected="true"></telerik:RadComboBoxItem>
                       </Items>
                   </telerik:RadComboBox>
               </td>
           </tr>
           <tr>
               <td>
                   <telerik:RadLabel ID="RadLabel3" runat="server">
                       Created TimeStamp From
                   </telerik:RadLabel>
               </td>
               <td>
                   <telerik:RadDatePicker ID="RadDatePicker1" runat="server"></telerik:RadDatePicker>
               </td>
           </tr>
           <tr>
               <td>
                   <telerik:RadLabel ID="RadLabel2" runat="server">
                       Created TimeStamp To
                   </telerik:RadLabel>
               </td>
               <td>
                   <telerik:RadDatePicker ID="RadDatePicker2" runat="server"></telerik:RadDatePicker>
               </td>
           </tr>
       </table>
             <br />
             <br />
        <telerik:RadButton ID="RadButton1" runat="server" Text="Add Printer" AutoPostBack="false" OnClientClicked="Addprinters"></telerik:RadButton>
        <telerik:RadButton ID="RadButton2" runat="server" Text="Search" OnClick="RadButton2_Click"></telerik:RadButton>
        <telerik:RadButton ID="RadButton3" runat="server" Text="Clear" OnClientClicked="clearRadDatePicker"></telerik:RadButton>
        <telerik:RadButton  runat="server" ID="RadButton4" Text="Delete selected printers" OnClick="Button1_Click"></telerik:RadButton>
        <br />
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <br />
              <div>
            <asp:Label ID="Label3" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#FF8080"></asp:Label>
            <asp:Label ID="Label4" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#00C000"></asp:Label>
            <asp:Label ID="Label5" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#FF8080"></asp:Label>
            <asp:Label ID="Label6" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#00C000"></asp:Label>    
            </div>
            <telerik:RadGrid RenderMode="Lightweight" ID="OrdersGrid" AllowPaging="True" OnItemDeleted="RadGrid1_ItemDeleted"  OnItemCreated="RadGrid1_ItemCreated" DataSourceID="gridSource" runat="server" AllowSorting="True" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowMultiRowEdit="True" AllowMultiRowSelection="True" Font-Size="Small" AllowFilteringByColumn="True">
                  <PagerStyle Mode="NumericPages"></PagerStyle>
                 <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                 <ExportSettings>
                     <Pdf PageWidth="">
                     </Pdf>
                 </ExportSettings>
                 <MasterTableView AutoGenerateColumns="False" DataKeyNames="EngenPrintersID" ClientDataKeyNames="EngenPrintersID"
            Width="100%" CommandItemDisplay="Top" PageSize="5" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">

           <%-- <CommandItemTemplate>
                    <div style="padding: 5px 5px;">
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Delete all selected customers?')"
                            runat="server" CommandName="DeleteSelected"><img style="border:0px;vertical-align:middle;" alt="" src="Images/Delete.png"/>Delete selected customers</asp:LinkButton>&nbsp;&nbsp;
                        </div>
            </CommandItemTemplate>--%>
                  
                     <Columns>
                         <telerik:GridBoundColumn DataField="EngenPrintersID" DataType="System.Int32" FilterControlAltText="Filter EngenPrintersID column" HeaderText="EngenPrintersID" ReadOnly="True" SortExpression="EngenPrintersID" UniqueName="EngenPrintersID" Visible="False">
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="PrinterName" FilterControlAltText="Filter PrinterName column" HeaderText="PrinterName" SortExpression="PrinterName" UniqueName="PrinterName">
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="PrinterMake" DataType="System.Int32" FilterControlAltText="Filter PrinterMakeID column" HeaderText="PrinterMakeID" SortExpression="PrinterMakeID" UniqueName="PrinterMakeID" Visible="False">
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FolderToMonitor" FilterControlAltText="Filter FolderToMonitor column" HeaderText="FolderToMonitor" SortExpression="FolderToMonitor" UniqueName="FolderToMonitor">
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="OutputType" FilterControlAltText="Filter OutputType column" HeaderText="OutputType" SortExpression="OutputType" UniqueName="OutputType">
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FileOutput" FilterControlAltText="Filter FileOutput column" HeaderText="FileOutput" SortExpression="FileOutput" UniqueName="FileOutput">
                         </telerik:GridBoundColumn>
                         <telerik:GridCheckBoxColumn DataField="Active" DataType="System.Boolean" FilterControlAltText="Filter Active column" HeaderText="Active" SortExpression="Active" UniqueName="Active">
                         </telerik:GridCheckBoxColumn>
                         <telerik:GridBoundColumn DataField="CreateTimestamp" DataType="System.DateTime" FilterControlAltText="Filter CreateTimestamp column" HeaderText="CreateTimestamp" SortExpression="CreateTimestamp" UniqueName="CreateTimestamp">
                         </telerik:GridBoundColumn>
                         <telerik:GridTemplateColumn>
                             <ItemTemplate>
                                 
                                 <asp:CheckBox ID="CheckPrinter" runat="server" />
                             </ItemTemplate>
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn>
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Upload" ImageUrl="~/Styles/Printer.png"
                                     OnClientClick="return ShowUploadForm();" CssClass="MyButton" />
                             </ItemTemplate>
                         </telerik:GridTemplateColumn>
                         <telerik:GridButtonColumn UniqueName="DeleteColumn"
                             ButtonType="ImageButton"
                             CommandName="Delete"
                             ConfirmText='Are you sure you want to delete this record?'
                             ConfirmTitle="Delete Record"
                             ConfirmDialogType="RadWindow"
                             Text="Delete">
                             <ItemStyle HorizontalAlign="Center" Width="20px" />
                         </telerik:GridButtonColumn>
                          <telerik:GridTemplateColumn UniqueName="TemplateEditColumn">
                    <ItemTemplate>
                        <asp:HyperLink ID="EditLink" runat="server" Text="Edit"></asp:HyperLink>
                    </ItemTemplate>
                          </telerik:GridTemplateColumn>
                    </Columns>
                    
                 </MasterTableView>
                 <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                 <ExportSettings>
                     <Pdf PageWidth="">
                     </Pdf>
                 </ExportSettings>
                 <ClientSettings>
                     <Selecting AllowRowSelect="True" EnableDragToSelectRows="True"></Selecting>
                     <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
                     <ClientEvents OnRowSelected="RowSelected" />
                      <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                 </ClientSettings>

                 <FilterMenu RenderMode="Lightweight"></FilterMenu>

                 <HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
 
             </telerik:RadGrid> 
         </div>
    <asp:SqlDataSource ID="dllDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>"
        SelectCommand="SELECT TOP 20 [PrinterMake], [PrinterMakeID] FROM [PrinterMakeTbl]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="gridSource" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>"
        SelectCommand="SELECT EngenPrintersID, PrinterName,PrinterMakeID, FolderToMonitor, OutputType, FileOutput, Active, CreateTimestamp FROM Printers WHERE ((PrinterMakeID = @PrinterMakeID and @PrinterMakeID <> 0) or (PrinterMakeID = PrinterMakeID and @PrinterMakeID = 0))" DeleteCommand="DELETE FROM [Printers] WHERE [EngenPrintersID] = @EngenPrintersID" UpdateCommand="UPDATE [Printers] SET [PrinterName] = @PrinterName, [PrinterMakeID] = @PrinterMakeID, [FolderToMonitor] = @FolderToMonitor, [OutputType] = @OutputType, [FileOutput] = @FileOutput, [Active] = @Active, [CreateTimestamp] = @CreateTimestamp WHERE [EngenPrintersID] = @EngenPrintersID">
        <SelectParameters>
            <asp:ControlParameter Name="PrinterMakeID" PropertyName="SelectedValue" ControlID="NamesDDL"></asp:ControlParameter>
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="EngenPrintersID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="PrinterName" Type="String" />
            <asp:Parameter Name="PrinterMakeID" Type="Int32" />
            <asp:Parameter Name="FolderToMonitor" Type="String" />
            <asp:Parameter Name="OutputType" Type="String" />
            <asp:Parameter Name="FileOutput" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="CreateTimestamp" Type="DateTime" />
            <asp:Parameter Name="EngenPrintersID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server" EnableAJAX="true" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="NamesDDL">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="OrdersGrid" LoadingPanelID="AjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="NamesDDL"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>

</asp:Content>

