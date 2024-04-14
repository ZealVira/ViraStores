using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace proj1
{

    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["admin"]?.ToString()?.Equals("true", StringComparison.OrdinalIgnoreCase) == true)
            {

            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }*/
        }
        string path;
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
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
                        path = "/image/Products/" + FileUpload1.FileName;
                        //Response.Write(path);
                    }
                }
            }
            else
            {
                lblMessage.Text = "please select a file";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void ShowMessage(string s)
        {
            Response.Write("<script>alert('"+s+"')</script>");
        }

        protected void Btn2_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
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
                        FileUpload1.SaveAs(Server.MapPath("~/image/Products/" + FileUpload1.FileName));
                        lblMessage.Text = "uploaded";
                        path = "/image/Products/" + FileUpload1.FileName;
                        ///Response.Write(path);
                        //lbl1.Text = path;
                    }
                }
            }
            else
            {
                lblMessage.Text = "please select a file";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            
            string name = txtName.Text.Trim();
            string brand = ddlBrand.SelectedValue.ToString();
            string size = ddlSize.SelectedValue.ToString();
            string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True";
            string sel = "SELECT COUNT(*) FROM prodInfo WHERE Name = @Name AND Brand = @Brand AND Size = @Size";
            
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    con.Open();
                    using (SqlCommand com = new SqlCommand(sel, con))
                    {
                        com.Parameters.AddWithValue("@Name", name);
                        com.Parameters.AddWithValue("@Brand", brand);
                        com.Parameters.AddWithValue("@Size", size);
                        int count = Convert.ToInt32(com.ExecuteScalar());
                        if (count == 0)
                        {
                            con.Close();
                            string ins = "INSERT INTO prodInfo VALUES (@Param0, @Param1, @Param2, @Param3, @Param4, @Param11, @Param5, @Param6, @Param7, @Param8, @Param9, @Param10)";
                            SqlCommand cmd = new SqlCommand(ins, con);
                            cmd.Parameters.AddWithValue("@Param0", txtProdID.Text);
                            cmd.Parameters.AddWithValue("@Param1", txtName.Text);
                            cmd.Parameters.AddWithValue("@Param2", brand);
                            cmd.Parameters.AddWithValue("@Param3", Convert.ToInt32(txtPrice.Text));
                            cmd.Parameters.AddWithValue("@Param4", Convert.ToInt32(txtMRP.Text));
                            cmd.Parameters.AddWithValue("@Param11", Convert.ToInt32(ddlGST.SelectedValue.ToString()));
                            cmd.Parameters.AddWithValue("@Param5", ddlCategory.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@Param6", txtSubCat.Text);
                            cmd.Parameters.AddWithValue("@Param7", size);
                            cmd.Parameters.AddWithValue("@Param8", txtStock.Text);
                            cmd.Parameters.AddWithValue("@Param9", txtDescription.Text);
                            //cmd.Parameters.AddWithValue("@Param10", "hello");
                            cmd.Parameters.AddWithValue("@Param10", path); // Handle null path

                            con.Open();
                            int i = cmd.ExecuteNonQuery();
                            con.Close();

                            string insert = "INSERT INTO productInfo (ProductId, Ingredients, Vegan, Disclaimer) VALUES (@Param0, @Param1, @Param2, @Param3)";
                            SqlCommand cmd1 = new SqlCommand(insert, con);
                            cmd1.Parameters.AddWithValue("@Param0", txtProdID.Text);
                            cmd1.Parameters.AddWithValue("@Param1", txtIngr.Text);
                            cmd1.Parameters.AddWithValue("@Param2", ddlVegan.SelectedValue.ToString());
                            cmd1.Parameters.AddWithValue("@Param3", txtDisclaimer.Text);
                            con.Open();
                            int j = cmd1.ExecuteNonQuery();
                            
                            if (i > 0 && j>0)
                            {
                                ShowMessage("Product added successfully");
                                txtProdID.Text = "";
                                txtName.Text = "";
                                ddlBrand.SelectedIndex = 0;
                                txtPrice.Text = "";
                                txtMRP.Text = "";
                                ddlGST.SelectedIndex = 0;
                                ddlVegan.SelectedIndex = 0;
                                txtDescription.Text = "";
                                ddlSize.SelectedIndex = 0;
                                txtStock.Text = "";
                                //txtCat.Text = "";
                                ddlCategory.SelectedIndex = 0;
                                txtSubCat.Text = "";
                                txtIngr.Text = "";
                                txtDisclaimer.Text = "";
                            }
                            else
                            {
                                ShowMessage("Couldn't insert the product");
                                lbl1.Text = "unsuccessful";
                            }
                            con.Close();

                        }
                        else
                        {
                            ShowMessage("The product you are trying to enter already exists");
                            con.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}