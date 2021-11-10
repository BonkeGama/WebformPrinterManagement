using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrinterEdit : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Request.QueryString["EngenPrintersID"] == null)
        {
            RadDataForm1.IsItemInserted = true;
        }
        else
        {
            RadDataForm1.EditIndex = 0;
        }
    }
    protected void RadDataForm1_ItemCommand(object sender, Telerik.Web.UI.RadDataFormCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
        else if (e.CommandName == "PerformInsert")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
        }
    }
    protected void RadDataForm1_PreRender(object sender, EventArgs e)
    {
        if (RadDataForm1.Skin != SelectedSkin)
        {
            RadDataForm1.Skin = SelectedSkin;
            RadDataForm1.Rebind();
        }
    }
    public string SelectedSkin
    {
        get
        {
            return ConfigurationManager.AppSettings["Telerik.Skin"];
        }
    }
}
 

