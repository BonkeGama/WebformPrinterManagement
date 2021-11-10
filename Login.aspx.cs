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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ToString());
    void ShowMessage(string msg)

    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    void clear()
    {
        RadTextBox1.Text = string.Empty; RadTextBox2.Text = string.Empty;
        RadTextBox1.Focus();
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    System.Threading.Thread.Sleep(3000);
    //    Label1.Text = DateTime.Now.ToString();
    //}

    protected void RadButton1_Click(object sender, EventArgs e)
    {
        try
        {
            string uid = RadTextBox1.Text;
            string pass = RadTextBox2.Text;
            con.Open();
            string qry = "select * from Users where UserName='" + uid + "' and Password='" + pass + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
         
            if (sdr.Read())
            {
                
                //   Label3.Text = "Login Sucess......!!";
                ShowMessage("Login Sucess..!!");
                 System.Threading.Thread.Sleep(3000);
                Response.Redirect("PrinterManagement.aspx");
            }
            else
            {
                // Label4.Text = "UserId & Password Is not correct Try again..!!";
                ShowMessage("Username & Password Is not correct try again..!!");
                
                clear();

            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        Response.Redirect("ForgotPassword.aspx");
    }

}