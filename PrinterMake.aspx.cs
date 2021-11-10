using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Configuration;
using Telerik.Web.UI;
using BusinessObject;
using BusinessLogic;
public partial class PrinterMake : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                RadButton1.Attributes.Add("onclick", "javascript:return validationCheck()");
            }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message);
        }
    }
    void ShowMessage(string msg)

    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }

    void clear()
    {
        RadTextBox1.Text = string.Empty;
        RadTextBox1.Focus();
    }


 

    protected void RadButton1_Click(object sender, CallingDataMethodsEventArgs e)
    {
        //string cs = System.Configuration.ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ConnectionString;

        //SqlConnection con = new SqlConnection(cs);
        //try
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("insert into printermaketbl (printermake) values('" + RadTextBox1.Text + "')", con);
        //  //  cmd.parameters.addwithvalue("@designationname", textbox1.text);
        //    cmd.ExecuteNonQuery();
        // //   PrinterMakeBL bl = new PrinterMakeBL();
        // //   bl.PrimEntry(primake);

        ////return new JsonResult("Added Successfully");
        //ShowMessage("Printer Make Added Successfully......!");
        //    clear();
        //    Response.Redirect("FirstPage.aspx");

        //}
        //catch (SqlException ex)
        //{
        //    ShowMessage(ex.Message);

        //}
        //finally
        //{
        //    con.Close();
        //}

        PrinterMakeBL bl = new PrinterMakeBL();
        bl.insertPrimake(printermake);

        e.DataMethodsObject = new BusinessLogic.PrinterMakeBL();
    }

    public List<int> DeletedIDs
    {
        get
        {
            if (Session["DeletedIDs"] == null)
                Session["DeletedIDs"] = new List<int>();
            return (List<int>)Session["DeletedIDs"];
        }
    }
    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        RadGrid1.DataSource = GetGridSource();
    }
    private DataTable GetGridSource()
    {
        DataTable dataTable = new DataTable();

        return dataTable;
    }
    protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        GridDataItem dataItem = e.Item as GridDataItem;
        DeletedIDs.Add((int)dataItem.GetDataKeyValue("DesignationID"));
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem item = e.Item as GridDataItem;
            ImageButton button = item["DeleteColumn"].Controls[0] as ImageButton;

            string dataKeyID = item.GetDataKeyValue("DesignationID").ToString();
            string message = string.Format("Delete record <b>{0}</b> from <b>{1}</b> - {2}?",
            dataKeyID);
            button.Attributes.Add("onclick", string.Format("if(!$find('{0}').confirm('{1}', event, 'Delete Record'))return false;",
            item.OwnerTableView.OwnerGrid.ClientID, message));
        }
    }
}