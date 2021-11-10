using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class UserList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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