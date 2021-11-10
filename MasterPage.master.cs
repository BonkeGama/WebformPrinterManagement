using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadMenu1_ItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text.ToLower() == "logout")

        {

            System.Web.Security.FormsAuthentication.SignOut();

            Session.Abandon();

            //Redirect the page.
            Response.Redirect("Login.aspx");
           
        }

    }



}
