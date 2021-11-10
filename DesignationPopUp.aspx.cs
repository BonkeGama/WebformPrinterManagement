using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class DesignationPopUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadButton1_Click(object sender, EventArgs e)
    {
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
}