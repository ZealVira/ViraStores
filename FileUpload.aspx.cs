using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace proj1
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

            SqlDataAdapter da = new SqlDataAdapter("SELECT Image, Name, ProductId  FROM prodInfo", con);
         //   DataTable dt = new DataTable();
         //   da.Fill(dt);
         //   GridView2.DataSource = dt;
         //   DataBind();
                //byte[] bytes = (byte[])cmd.ExecuteScalar();
            //FileStream streem = new FileStream()
        }

        //string fileloc = "";
        protected void Button1_Click(object sender, EventArgs e)
        {
            /*if (FileUpload1.HasFile)
            {
                string FileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (FileExtension.ToLower() != ".jpg" && FileExtension.ToLower() != ".png" && FileExtension.ToLower() != ".jpeg")
                {
                    lblMessage.Text = "not supported format";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    if (fileSize > 3145728)
                    {
                        lblMessage.Text = "File size is greater than (3MB)";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else 
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/image/" + FileUpload1.FileName));
                        lblMessage.Text = "uploaded";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        fileloc = "~/image/" + FileUpload1.FileName + "/" + FileExtension;
                        Response.Write(fileloc);
                    }
                    
                }
                
            }
            else
            {
                lblMessage.Text = "please select a file";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }


            HttpPostedFile postedFile = FileUpload1.PostedFile;
            //string fileName = Path.GetFileName(postedFile.FileName);
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            string sel = "select * from Image " ;
            SqlCommand com = new SqlCommand(sel, con);
            con.Open();
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
               con.Close();
            }
            else if (count == 0)
            {
                con.Close();
                string ins = "INSERT INTO prodInfo VALUES ( @Param1, @Param2)";
                SqlCommand cmd = new SqlCommand(ins, con);
                cmd.Parameters.AddWithValue("@Param1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Param2", bytes);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    Label2.Text = "Successful";
                }
                else
                {
                    Response.Write("Insert unsuccessfull");
                    Label2.Text = "unsuccessful";
                }
            }
            else
            {
                Response.Write("else");
            }*/

            string path;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "image/AMUL/"+FileUpload1.FileName);
            }
            path = "/image/Products/" + FileUpload1.FileName;
            Response.Write(path);
            SqlCommand cmd1 = new SqlCommand("insert into Image values ('"+path+"')", con);
            con.Open();
            int i = Convert.ToInt32(cmd1.ExecuteNonQuery());
            if (i > 0)
            {
                Response.Write("Success");
            }
            con.Close();

        }

    }

        /*protected void txtGetImage_Click(object sender, EventArgs e)
        {
            try
            {
                Image1.ImageUrl = "ImageHandler.ashx?productId=" + txtrollno.Text;
                string ProductId = Context.Request.QueryString["productId"].ToString(); // Corrected casing
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
                con.Open();
                string sel = "select Image from prodInfo where ProductId=@ProductId";
                SqlCommand com = new SqlCommand(sel, con);
               // com.CommandType = CommandType.Text;
                com.Parameters.AddWithValue("@ProductId", ProductId.ToString());
                object data = com.ExecuteScalar();
                con.Close();
                con.Dispose();
                Context.Response.BinaryWrite((byte[])data);
            }
            catch
            {
                lblMessage.Text = "error";
            }

        }*/

        /*protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }*/
    }
