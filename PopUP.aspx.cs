using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class PopUP : System.Web.UI.Page
{

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

        DataColumn column = new DataColumn();
        column.DataType = Type.GetType("System.Int32");
        column.ColumnName = "DesignationID";
        dataTable.Columns.Add(column);

        column = new DataColumn();
        column.DataType = Type.GetType("System.String");
        column.ColumnName = "DesignationName";
        dataTable.Columns.Add(column);

        DataColumn[] PrimaryKeyColumns = new DataColumn[1];
        PrimaryKeyColumns[0] = dataTable.Columns["OrderID"];
        dataTable.PrimaryKey = PrimaryKeyColumns;

        for (int i = 0; i <= 80; i++)
        {
            if (DeletedIDs.Contains(i + 1))
                continue;

            DataRow row = dataTable.NewRow();
            row["DesignationID"] = i + 1;
            row["DesignationName"] = "Name " + (i + 1);
            dataTable.Rows.Add(row);
        }

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

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            HyperLink editLink = (HyperLink)e.Item.FindControl("EditLink");
            editLink.Attributes["href"] = "javascript:void(0);";
            editLink.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["DesignationID"], e.Item.ItemIndex);
        }
    }
    protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
    {
        if (e.Argument == "Rebind")
        {
            RadGrid1.MasterTableView.SortExpressions.Clear();
            RadGrid1.MasterTableView.GroupByExpressions.Clear();
            RadGrid1.Rebind();
        }
        else if (e.Argument == "RebindAndNavigate")
        {
            RadGrid1.MasterTableView.SortExpressions.Clear();
            RadGrid1.MasterTableView.GroupByExpressions.Clear();
            RadGrid1.MasterTableView.CurrentPageIndex = RadGrid1.MasterTableView.PageCount - 1;
            RadGrid1.Rebind();
        }
    }
}
