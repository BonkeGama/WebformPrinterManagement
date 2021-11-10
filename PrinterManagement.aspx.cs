using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class PrinterManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RadAjaxManager manager = RadAjaxManager.GetCurrent(Page);
        manager.AjaxSettings.AddAjaxSetting(manager, OrdersGrid);
        manager.AjaxRequest += new RadAjaxControl.AjaxRequestDelegate(RadAjaxManager1_AjaxRequest);    
    }

    //Pop up message
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }

    //Filter list by Timestamp button method
    protected void RadButton2_Click(object sender, EventArgs e)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        DateTime fromdate = Convert.ToDateTime(RadDatePicker1.SelectedDate);
        DateTime Todate = Convert.ToDateTime(RadDatePicker2.SelectedDate);
        var result = from x in dc.Printers where x.CreateTimestamp >= fromdate && x.CreateTimestamp <= Todate select x;
        OrdersGrid.DataSource = result;
        OrdersGrid.DataSourceID = String.Empty;
        OrdersGrid.DataBind();
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    //Single delete exception
    protected void RadGrid_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        DataClassesDataContext DbContext = new DataClassesDataContext();

        var engId = (int)((GridDataItem)e.Item).GetDataKeyValue("EngenPrintersID");

        var product = DbContext.Printers.Where(n => n.EngenPrintersID == engId).FirstOrDefault();

        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            DisplayMessage(true, "This printer " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngenPrintersID"] + " cannot be deleted");
        }
        else
        {
            DisplayMessage(false, "This printer " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngenPrintersID"] + "is deleted");
        }
    }

         //Multiple delete exception
    protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            DisplayMessage(true, " Printer(s) " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ENgenPrintersID"] + " cannot be deleted");
        }
        else
        {
            DisplayMessage(false, "Printer(s) " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ENgenPrintersID"] + " deleted");
        }
    }

    //Delete exception message
    private void DisplayMessage(bool isError, string text)
    {
        if (isError)
        {
            this.Label3.Text = text;
        }

        else
        {
            this.Label4.Text = text;
        }
    }

    //Delete confirmation 
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
        OrdersGrid.DataSource = GetGridSource();
    }
    private DataTable GetGridSource()
    {
        DataTable dataTable = new DataTable();

        return dataTable;
    }
    protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        GridDataItem dataItem = e.Item as GridDataItem;
        DeletedIDs.Add((int)dataItem.GetDataKeyValue("EngenPrintersID"));
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem item = e.Item as GridDataItem;
            ImageButton button = item["DeleteColumn"].Controls[0] as ImageButton;

            string dataKeyID = item.GetDataKeyValue("EngenPrintersID").ToString();
            string message = string.Format("Delete record <b>{0}</b> from <b>{1}</b> - {2}?",
            dataKeyID);
            button.Attributes.Add("onclick", string.Format("if(!$find('{0}').confirm('{1}', event, 'Delete Record'))return false;",
            item.OwnerTableView.OwnerGrid.ClientID, message));
        }
    }

    //Hyperlink for pop up edit
    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            HyperLink editLink = (HyperLink)e.Item.FindControl("EditLink");
            editLink.Attributes["href"] = "javascript:void(0);";
            editLink.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngenPrintersID"], e.Item.ItemIndex);
        }
    }

    protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
    {
        OrdersGrid.MasterTableView.SortExpressions.Clear();
        OrdersGrid.MasterTableView.GroupByExpressions.Clear();
        OrdersGrid.Rebind();
        
    }

    //Multiple delete c# code
    protected void Button1_Click(object sender, EventArgs e)
    {
        DeleteListi.Items.Clear();
        foreach (GridDataItem item in OrdersGrid.MasterTableView.Items)
        {
            CheckBox CheckBox1 = item.FindControl("CheckPrinter") as CheckBox;
            if (CheckBox1 != null && CheckBox1.Checked)
            {
                DeleteListi.Items.Add(item["PrinterName"].Text.ToString());

                DeletePrinterWindow.VisibleOnPageLoad = true;
                DeletePrinterWindow.Visible = true;
            }
        }
        OrdersGrid.Rebind();
    }

    private void DeleteRecord(string ID)
    {
        string constr = ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ToString();
        SqlConnection connection = new SqlConnection(constr);
        string sqlStatement = "DELETE FROM Printers WHERE PrinterName = @Id";

        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(sqlStatement, connection);
            cmd.Parameters.AddWithValue("@Id", ID);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Deletion Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            connection.Close();
        }
    }

    protected void DelPrinter(object sender, EventArgs e)
    {




        if (DeleteListi.SelectedItem.Text == null)
        {
            //promovali.Text = "Please select an item for deletion.";
            Response.Redirect("PrinterManagement.aspx");
        }
        else
        {
            for (int i = 0; i <= DeleteListi.Items.Count - 1; i++)
            {
                if (DeleteListi.Items[i].Selected)
                {
                    DeleteRecord(DeleteListi.Items[i].Value.ToString());
                }
            }
            string remove = DeleteListi.SelectedItem.Text;
            Items.Remove(remove);

        }
        Response.Redirect("PrinterManagement.aspx");
    }

}
