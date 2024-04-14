using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;

namespace proj1
{
    public partial class ProfileUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            /*userID = Session["userID"].ToString();
            if (userID == null)
            {
                Response.Write("null");
            }*/
            //string userID;
            if (Session["userID"] != null)
            {
                userID = Session["userID"].ToString();
                string selUser = "select COUNT(*) from userDetails where userId= @user";
                SqlCommand comUser = new SqlCommand(selUser, con);
                comUser.Parameters.AddWithValue("@user", userID);
                con.Open();
                int userCount = (int)comUser.ExecuteScalar();
                con.Close();
                if (userCount == 0)
                {
                    Panel1.Visible = false;
                }
                else
                {
                    Panel1.Visible = true;
                    string sel = "select * from userDetails where userId= @user";
                    SqlCommand com = new SqlCommand(sel, con);
                    com.Parameters.AddWithValue("@user", userID);
                    con.Open();
                    
                        SqlDataReader drUser = com.ExecuteReader();
                        try
                        {
                            while (drUser.Read())
                            {
                                username.Text = drUser["Name"].ToString();
                                email.Text = drUser["UserID"].ToString();
                                phone.Text = drUser["PhoneNumber"].ToString();
                                DropDownList1.SelectedValue = drUser["Gender"].ToString();
                                if (drUser["Image"] != null)
                                {
                                    ProfilePicture.ImageUrl = drUser["Image"].ToString();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                        finally
                        {
                            con.Close();
                            drUser.Close();
                        }
                    
                }
                /*SqlDataReader dr = comUser.ExecuteReader();
                try
                {
                    while (dr.Read())
                    {
                        username.Text = dr["Name"].ToString();
                        email.Text = dr["UserID"].ToString();
                        phone.Text = dr["PhoneNumber"].ToString();
                        DropDownList1.SelectedValue = dr["Gender"].ToString();
                        if (dr["Image"] != null)
                        {
                            ProfilePicture.ImageUrl = dr["Image"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    con.Close();
                }*/
            }
            else
            {
                Button3.Visible = true;
                Label1.Text = "You haven't signed in yet";
                Label2.Text = "Sign in to see your account details";
                Panel1.Visible = false;
            }
            //string userID;
            /*if (!IsPostBack)
                {
                    string sel = "select COUNT(*) from userDetails where userId= @user";
                    SqlCommand com = new SqlCommand(sel, con);
                    com.Parameters.AddWithValue("@user", userID);
                    con.Open();
                    int user = (int)com.ExecuteScalar();
                    if (user == 0)
                    {
                        
                    }
                    else
                    {
                        SqlDataReader dr = com.ExecuteReader();
                        try
                        {
                            while (dr.Read())
                            {
                                username.Text = dr["Name"].ToString();
                                email.Text = dr["UserID"].ToString();
                                phone.Text = dr["PhoneNumber"].ToString();
                                DropDownList1.SelectedValue = dr["Gender"].ToString();
                                if (dr["Image"] != null)
                                {
                                    ProfilePicture.ImageUrl = dr["Image"].ToString();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                        finally
                        {
                            con.Close();
                        }
                

                    
                }
           }*/
        }
            string userID;
            protected void LinkButton1_Click(object sender, EventArgs e)
            {
                string text = LinkButton1.Text;
                if (text == "change")
                {
                    username.ReadOnly = false;
                    LinkButton1.Text = "done";
                }
                else
                {
                    username.ReadOnly = true;
                    string name = username.Text;
                    string update = "Update userDetails SET Name = @Name where userId = @userID";
                    con.Open();
                    SqlCommand updateCmd = new SqlCommand(update, con);
                    updateCmd.Parameters.AddWithValue("@Name", name);
                    updateCmd.Parameters.AddWithValue("@userID", userID);

                    int updatedRows = updateCmd.ExecuteNonQuery();
                    if (updatedRows > 0)
                    {
                        ShowMessage("Name updated");
                    }
                    LinkButton1.Text = "change";
                    con.Close();
                }
            }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string text1 = LinkButton2.Text;
            if (text1 == "change")
            {
                phone.ReadOnly = false;
                LinkButton2.Text = "done";
            }
            else
            {
                phone.ReadOnly = true;
                string num = phone.Text;
                string update1 = "Update userDetails SET PhoneNumber = @numb where userId = @userID";
                con.Open();
                SqlCommand updateCmd1 = new SqlCommand(update1, con);
                updateCmd1.Parameters.AddWithValue("@numb", num);
                updateCmd1.Parameters.AddWithValue("@userID", userID);

                int updatedRows = updateCmd1.ExecuteNonQuery();
                if (updatedRows > 0)
                {
                    ShowMessage("Number updated");
                }
                LinkButton2.Text = "change";
                
                con.Close();
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string text2 = LinkButton3.Text;
            if (text2 == "change")
            {
                DropDownList1.Enabled = true;
                LinkButton3.Text = "done";
            }
            else
            {
                DropDownList1.Enabled = true;
                string gender = DropDownList1.SelectedValue;
                string update1 = "Update userDetails SET Gender = @gender where userId = @userID";
                con.Open();
                SqlCommand updateCmd1 = new SqlCommand(update1, con);
                updateCmd1.Parameters.AddWithValue("@gender", gender);
                updateCmd1.Parameters.AddWithValue("@userID", userID);

                int updatedRows = updateCmd1.ExecuteNonQuery();
                if (updatedRows > 0)
                {
                    ShowMessage("Gender updated");
                }
                LinkButton3.Text = "change";

                con.Close();
            }
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
                        FileUpload1.SaveAs(Server.MapPath("~/image/users/" + FileUpload1.FileName));
                        lblMessage.Text = "uploaded";
                        path = "/image/users/" + FileUpload1.FileName;
                        //Response.Write(path);
                        string Update = "update userDetails set Image=@Image WHERE userId = @userID";
                        SqlCommand updateCommand = new SqlCommand(Update, con);
                        updateCommand.Parameters.AddWithValue("@Image", path);
                        updateCommand.Parameters.AddWithValue("@userID", userID); // Assuming userID is the parameter for the user ID

                        try
                        {
                            con.Open();
                            int rowsAffected = updateCommand.ExecuteNonQuery();
                            con.Close();

                            if (rowsAffected > 0)
                            {
                                lblMessage.Text = "Image updated successfully";
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                            }
                            else
                            {
                                //Response.Write("No rows affected. Image update failed.");
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write("An error occurred: " + ex.Message);
                        }
                        finally
                        {
                            if (con.State == ConnectionState.Open)
                            {
                                con.Close();
                            }
                        }
                    }
                }
            }
            else
            {
                lblMessage.Text = "please select a file";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginMaster.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["userID"] = null;
            Response.Redirect("~/try.aspx");
        }
    }
}