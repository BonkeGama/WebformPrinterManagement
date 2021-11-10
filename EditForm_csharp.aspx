<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditForm_csharp.aspx.cs" Inherits="EditForm_csharp" %>
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
                DataKeyNames="DesignationID" OnItemCommand="RadDataForm1_ItemCommand" OnPreRender="RadDataForm1_PreRender">
                <LayoutTemplate>
                    <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfInlineBlock" style="width: 362px;">
                        <div id="itemPlaceholder" runat="server" class="rdfLeftAligned"></div>
                    </div>
                </LayoutTemplate>
                <ItemTemplate></ItemTemplate>
                <EditItemTemplate>
                    <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="FirstNameLabel" CssClass="rdfLabel rdfBlock" Text="Designation Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FirstNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("DesignationName") %>' MaxLength="30" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
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
                            <asp:Label runat="server" ID="FirstNameLabel" CssClass="rdfLabel rdfBlock" Text="Designation Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FirstNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("DesignationName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
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
                InsertCommand="INSERT INTO [Designations] ([DesignationName]) VALUES (@DesignationName)"
                SelectCommand="SELECT [DesignationID], [DesignationName] FROM [Designations] WHERE ([DesignationID] = @DesignationID)"
                UpdateCommand="UPDATE [Designations] SET [DesignationName] = @DesignationName WHERE [DesignationID] = @DesignationID" DeleteCommand="DELETE FROM [Designations] WHERE [DesignationID] = @DesignationID">
                <DeleteParameters>
                    <asp:Parameter Name="DesignationID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DesignationName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DesignationName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="DesignationID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="DesignationID" QueryStringField="DesignationID" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

