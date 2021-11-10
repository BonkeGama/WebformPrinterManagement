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

public partial class AddPrinter : System.Web.UI.Page
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
        RadTextBox1.Text = string.Empty; RadTextBox2.Text = string.Empty; RadTextBox3.Text = string.Empty; RadTextBox4.Text = string.Empty;
        RadTextBox1.Focus();
    }

    protected void RadButton1_Click(object sender, EventArgs e)
    {
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(cs);

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Printers (PrinterName,PrinterMakeID,FolderToMonitor,OutputType,FileOutput,Active) VALUES('" + RadTextBox1.Text + "','" + RadComboBox1.SelectedValue + "','" + RadTextBox2.Text + "' ,'" + RadTextBox3.Text + "','" + RadTextBox4.Text + "','" + RadRadioButtonList1.SelectedValue + "')", con);
            cmd.Parameters.AddWithValue("@PrinterName", RadTextBox1.Text);
            //    cmd.Parameters.AddWithValue("@DesignationName", TextBox1.Text);
            cmd.ExecuteNonQuery();
            ShowMessage("Printer Added Succesfully......!");
           // Response.Redirect("PrinterManagement.aspx");
            clear();
        }
        catch (SqlException ex)
        {
            ShowMessage(ex.Message);

        }
        finally
        {
            con.Close();

        }
    }

    protected void Item_ItemCommand(object sender, Telerik.Web.UI.RadDataFormCommandEventArgs e)
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

}