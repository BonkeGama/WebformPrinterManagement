using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.Globalization;

public partial class UserManagemennt : System.Web.UI.Page
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
        RadTextBox2.Text = string.Empty; RadTextBox3.Text = string.Empty; RadTextBox4.Text = string.Empty; RadTextBox5.Text = string.Empty; RadTextBox6.Text = string.Empty; pacinput.Text = string.Empty; 
        //TextBox2.Focus();
    }
    private void SendMail()
    {
        string filename = Server.MapPath("~/Event.html");
        string mailbody = System.IO.File.ReadAllText(filename);
        mailbody = mailbody.Replace("##UserName##", RadTextBox5.Text);
        mailbody = mailbody.Replace("##Password##", RadTextBox6.Text);
        string to = RadTextBox4.Text;
        string from = "bonkegama@outlook.com";
        MailMessage message = new MailMessage(from, to);
        message.Subject = "Auto Response Email";
        message.Body = mailbody;
        message.BodyEncoding = Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.outlook.com", 587);
        System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential("bonkegama@outlook.com", "1@****");
        client.EnableSsl = true;
        client.UseDefaultCredentials = true;
        client.Credentials = basicCredential;
        try
        {
            client.Send(message);
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message);
        }
    }

    protected void RadButton1_Click(object sender, EventArgs e)
    {
        //Code Start
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(cs);

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Users (FirstName,LastName,Email,UserName,Password,Address,DOB, DesignationID) VALUES('" + RadTextBox2.Text + "' ,'" + RadTextBox3.Text + "','" + RadTextBox4.Text + "','" + RadTextBox5.Text + "','" + RadTextBox6.Text + "','" + pacinput.Text + "','" + RadDatePicker1.FocusedDate + "','" + RadComboBox1.SelectedValue + "')", con);
            cmd.Parameters.AddWithValue("@Email", RadTextBox4.Text);
            cmd.Parameters.AddWithValue("@UserName", RadTextBox5.Text);
            cmd.Parameters.AddWithValue("@Password", RadTextBox6.Text);
            cmd.ExecuteNonQuery();
            ShowMessage("Registered successfully......!");
            SendMail();
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
}
