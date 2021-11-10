using System;  
using System.Web;  
using System.Web.Security;  
using System.Web.UI;  
using System.Web.UI.WebControls;  
using System.Web.UI.WebControls.WebParts;  
using System.Web.UI.HtmlControls;  
using System.IO;  
using System.Data;  
using System.Data.SqlClient;  
using System.Configuration;
using Telerik.Web.UI;

public partial class DocumentManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    BindGrid();
        //}
        RadGrid1.ItemCommand += new GridCommandEventHandler(RadGrid1_ItemCommand);

        string constr = ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        SqlCommand conn = new SqlCommand("select EngenPrintersID,PrinterName from Printers", con);
        SqlDataAdapter da = new SqlDataAdapter(conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        RadDropDownList1.DataTextField = ds.Tables[0].Columns["PrinterName"].ToString();
        RadDropDownList1.DataValueField = ds.Tables[0].Columns["EngenPrintersID"].ToString();
        RadDropDownList1.DataSource = ds.Tables[0];
        RadDropDownList1.DataBind();
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select DocID, DocName from Documents";
                cmd.Connection = con;
                con.Open();
                //RadGrid1.DataSourceID = String.Empty;
                //RadGrid1.DataSource = cmd.ExecuteReader();
                //RadGrid1.DataBind();
                con.Close();
            }
        }
    }
    void ShowMessage(string msg)

    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void Upload(object sender, EventArgs e)
    {
        int EngenPrintersID = int.Parse(RadDropDownList1.SelectedValue);
        string PrinterName = RadDropDownList1.SelectedText;
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string constr = ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into Documents values ( @DocName, @DocType, @DocUrl, @EngenPrintersID)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@EngenPrintersID", EngenPrintersID);
                        //cmd.Parameters.AddWithValue("@PrinterName", filename);
                        cmd.Parameters.AddWithValue("@DocName", filename);
                        cmd.Parameters.AddWithValue("@DocType", contentType);
                        cmd.Parameters.AddWithValue("@DocUrl", bytes);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        ShowMessage("Document Added Successfully......!");
                        con.Close();
                    }
                }
            }
        }
    }
    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string fileName, contentType;
        string constr = ConfigurationManager.ConnectionStrings["CompanyPrintersConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select DocName, DocType, DocUrl from Documents where DocID=@id";
                cmd.Parameters.AddWithValue("@DocID", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                
                    bytes = (byte[])sdr["DocUrl"];
                    contentType = sdr["DocType"].ToString();
                    fileName = sdr["DocName"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {


        if (e.CommandName == "download_file")
        {
            GridDataItem ditem = (GridDataItem)e.Item;
            string filename = ditem["DocName"].Text;
            string path = MapPath("~/Styles/" + filename);
            byte[] bts = System.IO.File.ReadAllBytes(path);


            Response.Clear();
            Response.ClearHeaders();
            Response.AddHeader("Content-Type", "Application/octet-stream");
            Response.AddHeader("Content-Length", bts.Length.ToString());
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
            Response.BinaryWrite(bts);
            Response.Flush();
            Response.End();
        }
    }
}  
