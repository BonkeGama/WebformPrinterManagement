<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PopUP.aspx.cs" Inherits="PopUP" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
          <style type="text/css">
            .orderText {
                font: normal 12px Arial,Verdana;
                margin-top: 6px;
            }
        </style>
    </telerik:RadCodeBlock>
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
        <script type="text/javascript">
            function ShowEditForm(id, rowIndex) {
                var grid = $find("<%= RadGrid1.ClientID %>");
 
                var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                grid.get_masterTableView().selectItem(rowControl, true);
 
                window.radopen("EditForm_csharp.aspx?DesignationID=" + id, "window2");
                return false;
            }
            function ShowInsertForm() {
                window.radopen("EditForm_csharp.aspx", "window2");
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
                window.radopen("EditForm_csharp.aspx?DesignationID=" + eventArgs.getDataKeyValue("DesignationID"), "window2");
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="gridLoadingPanel"></telerik:RadAjaxLoadingPanel>
<div class="demo-container no-bg">
    <telerik:RadGrid RenderMode="Lightweight" OnItemCreated="RadGrid1_ItemCreated" ID="RadGrid1" runat="server"
        AllowPaging="True" Width="97%" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowMultiRowEdit="True" AllowMultiRowSelection="True" AllowSorting="True">
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="DesignationID" ClientDataKeyNames="DesignationID"
            Width="100%" CommandItemDisplay="Top" PageSize="5" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
            <Columns>
                <telerik:GridBoundColumn DataField="DesignationID" HeaderText="DesignationID" ReadOnly="True"
                    SortExpression="DesignationID" UniqueName="DesignationID" DataType="System.Int32" FilterControlAltText="Filter DesignationID column" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DesignationName" HeaderText="DesignationName" SortExpression="DesignationName"
                    UniqueName="DesignationName" FilterControlAltText="Filter DesignationName column">
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
                <telerik:GridTemplateColumn UniqueName="TemplateEditColumn">
                    <ItemTemplate>
                        <asp:HyperLink ID="EditLink" runat="server" Text="Edit"></asp:HyperLink>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
            <CommandItemTemplate>
                <a href="#" onclick="return ShowInsertForm();">Add New Record</a>
            </CommandItemTemplate>
        </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="true"></Selecting>
            <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
        </ClientSettings>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
    </telerik:RadGrid>
    </div>
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="True">
        <Windows>
            <telerik:RadWindow RenderMode="Lightweight" ID="window2" runat="server" Title="Editing record" Height="380px"
                Width="393px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                Modal="true" NavigateUrl="EditForm_csharp.aspx" VisibleStatusbar="False">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>"
        SelectCommand="SELECT * FROM [Designations]" DeleteCommand="DELETE FROM [Designations] WHERE [DesignationID] = @DesignationID" InsertCommand="INSERT INTO [Designations] ([DesignationName]) VALUES (@DesignationName)" UpdateCommand="UPDATE [Designations] SET [DesignationName] = @DesignationName WHERE [DesignationID] = @DesignationID">
        <DeleteParameters>
            <asp:Parameter Name="DesignationID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DesignationName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DesignationName" Type="String" />
            <asp:Parameter Name="DesignationID" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>

</asp:Content>

