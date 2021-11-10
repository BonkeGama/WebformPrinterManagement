<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrinterEdit.aspx.cs" Inherits="PrinterEdit" %>

<!DOCTYPE html>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editing Record</title>
    <style>
        body {
            font: 14px/1.4 Helvetica, Arial, sans-serif;
        }
 
        button.RadButton span.rbIcon {
            vertical-align: sub;
        }
 
        .rdfLabel.rdfBlock {
            margin-top: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                <Scripts>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                </Scripts>
            </telerik:RadScriptManager>
            <br />
            <br />
            <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RadDataForm1" DataSourceID="SqlDataSource1"
                DataKeyNames="EngenPrintersID" OnItemCommand="RadDataForm1_ItemCommand" OnPreRender="RadDataForm1_PreRender">
                <LayoutTemplate>
                    <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfInlineBlock" style="width: 362px;">
                        <div id="itemPlaceholder" runat="server" class="rdfLeftAligned"></div>
                    </div>
                </LayoutTemplate>
                <ItemTemplate></ItemTemplate>
                <EditItemTemplate>
                    <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="FirstNameLabel" CssClass="rdfLabel rdfBlock" Text="Printer Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FirstNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("PrinterName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="LastNameLabel" CssClass="rdfLabel rdfBlock" Text="Folder To Monitor:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="LastNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FolderToMonitor") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator2" ControlToValidate="LastNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="TitleLabel" CssClass="rdfLabel rdfBlock" Text="Output Type:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="TitleTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("OutputType") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator3" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                         <div class="rdfRow">
                            <asp:Label runat="server" ID="Label1" CssClass="rdfLabel rdfBlock" Text="File Output:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FileOutput") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator4" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                         <div class="rdfRow">
                            <asp:Label runat="server" ID="Label2" CssClass="rdfLabel rdfBlock" Text="Active:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("Active") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator5" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                         <div class="rdfRow">
                            <asp:Label runat="server" ID="Label3" CssClass="rdfLabel rdfBlock" Text="Create Timestamp:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("CreateTimestamp") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator6" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow" style="float: right; padding-right: 10px;">
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonUpdate" Text="Update" CommandName="Update"
                                Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbOk"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonCancel" Text="Cancel" CommandName="Cancel"
                                CausesValidation="false" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbCancel"></Icon>
                            </telerik:RadButton>
                        </div>
                    </fieldset>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="FirstNameLabel" CssClass="rdfLabel rdfBlock" Text="First Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FirstNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("PrinterName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                            <div class="rdfRow">
                            <asp:Label runat="server" ID="LastNameLabel" CssClass="rdfLabel rdfBlock" Text="Last Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="LastNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FolderToMonitor") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator2" ControlToValidate="LastNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>

                        <div class="rdfRow">
                            <asp:Label runat="server" ID="TitleLabel" CssClass="rdfLabel rdfBlock" Text="Title:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="TitleTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("OutputType") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator3" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="Label4" CssClass="rdfLabel rdfBlock" Text="Title:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FileOutput") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator7" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="Label5" CssClass="rdfLabel rdfBlock" Text="Title:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("Active") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator8" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow" style="float: right; padding-right: 10px;">
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonPerformInsert" Text="Insert"
                                CommandName="PerformInsert" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbOk"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonCancel" Text="Cancel"
                                CommandName="Cancel" CausesValidation="false" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbCancel"></Icon>
                            </telerik:RadButton>
                        </div>
                    </fieldset>
                </InsertItemTemplate>
            </telerik:RadDataForm>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrintersConnectionString %>"
                InsertCommand="INSERT INTO [Printers] ([PrinterName],[FolderToMonitor], [OutputType], [FileOutput], [Active], [CreateTimestamp]) VALUES (@PrinterName,@PrinterMakeID, @FolderToMonitor, @OutputType, @FileOutput, @Active, @CreateTimestamp)"
                SelectCommand="SELECT [EngenPrintersID], [PrinterName], [FolderToMonitor], [OutputType], [FileOutput], [Active], [CreateTimestamp] FROM [Printers] WHERE ([EngenPrintersID] = @EngenPrintersID)"
                UpdateCommand="UPDATE [Printers] SET [PrinterName] = @PrinterName, [FolderToMonitor] = @FolderToMonitor, [OutputType] = @OutputType, [FileOutput] = @FileOutput, [Active] = @Active, [CreateTimestamp] = @CreateTimestamp WHERE [EngenPrintersID] = @EngenPrintersID">
                <InsertParameters>
                    <asp:Parameter Name="PrinterName" />
                    <asp:Parameter Name="FolderToMonitor" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="OutputType" Type="String" />
                    <asp:Parameter Name="FileOutput" Type="String" />
                    <asp:Parameter Name="Active" Type="Boolean" />
                    <asp:Parameter Name="CreateTimestamp" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                        <asp:Parameter Name="PrinterName" />
                    <asp:Parameter Name="FolderToMonitor" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="OutputType" Type="String" />
                    <asp:Parameter Name="FileOutput" Type="String" />
                    <asp:Parameter Name="Active" Type="Boolean" />
                    <asp:Parameter Name="CreateTimestamp" Type="String" />
                    <asp:Parameter Name="EngenPrintersID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="EngenPrintersID" QueryStringField="EngenPrintersID" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
