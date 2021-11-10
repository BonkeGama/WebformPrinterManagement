using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = "";
        string password = "";
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("select Username, Password from Users where Email=@Email", con);
        cmd.Parameters.AddWithValue("Email", RadTextBox1.Text);
        con.Open();
        using (SqlDataReader sdr = cmd.ExecuteReader())
        {

            if (sdr.Read())
            {
                username = sdr["Username"].ToString();
                password = sdr["Password"].ToString();

            }

        }
        con.Close();

        if (!string.IsNullOrEmpty(password))
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("bonkegama@outlook.com");
            msg.To.Add(RadTextBox1.Text);
            msg.Subject = " Recover your Password";
            msg.Body = ("Your Username is:" + username + "<br/><br/>" + "Your Password is:" + password);
            msg.IsBodyHtml = true;

            SmtpClient smt = new SmtpClient();
            smt.Host = "smtp.outlook.com";
            System.Net.NetworkCredential ntwd = new NetworkCredential();
            ntwd.UserName = "bonkegama@outlook.com"; //Your Email ID  
            ntwd.Password = "1@Miselolwam"; // Your Password  
            smt.UseDefaultCredentials = true;
            smt.Credentials = ntwd;
            smt.Port = 587;
            smt.EnableSsl = true;
            smt.Send(msg);
            lbmsg.Text = "Username and Password Sent Successfully";
            lbmsg.ForeColor = System.Drawing.Color.ForestGreen;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

}