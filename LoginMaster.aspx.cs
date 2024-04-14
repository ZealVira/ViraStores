using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

namespace proj1
{
    public partial class LoginMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["cart"] = 0;
            if (Session["user"] != null)
            {
                ShowMessage("CONGRATULATIONS! YOU HAVE SUCCESSFULLY CREATED AN ACCOUNT \n Please enter userId and Password again to Login");

            }
            if (!IsPostBack)
            {
                if (Request.Cookies["user"] != null && Request.Cookies["pass"] != null)
                {
                    mstTextBox1.Text = Request.Cookies["user"].Value;
                    password.Text = Request.Cookies["pass"].Value;
                }
            }
        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }

        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strpass = encryptpass(password.Text);
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            string a = "select * from userDetails";
            SqlCommand com = new SqlCommand(a, con);
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            string user = mstTextBox1.Text;
            string pass1="";
            try
            {
                while (dr.Read())
                {
                    if (strpass.Equals(dr["Password"].ToString().Trim()))
                    {
                        pass1 = dr["Password"].ToString().Trim();
                    }
                    string user1 = dr["UserId"].ToString().Trim();
                    string en = dr["Enabled"].ToString().ToLower().Trim();
                    if (user.Equals(user1) && strpass.Equals(pass1))
                    {
                        if (en.Equals("true"))
                        {
                            //Session["user"] = user;
                            if (CheckBox1.Checked)
                            {
                                Response.Cookies["user"].Value = user;
                                Response.Cookies["pass"].Value = strpass;
                                Response.Cookies["user"].Expires = DateTime.Now.AddDays(10);
                                Response.Cookies["pass"].Expires = DateTime.Now.AddDays(10);
                            }
                            else
                            {
                                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies["pass"].Expires = DateTime.Now.AddDays(-1);
                            }
                            Session["userID"] = user;

                            if (Session["RedirectUrl"] != null)
                            {
                               string redirectUrl = Session["RedirectUrl"].ToString();

                                Session.Remove("RedirectUrl");

                                Response.Redirect(redirectUrl);
                            }
                            else
                            {
                                Response.Redirect("HomePage.aspx");
                            }

                            
                        }
                        else
                        {
                            Response.Redirect("ContactAdmin.aspx");
                        }
                    }
                    else
                    {
                        Label4.Text = "Error";
                    }
                }
            }
            catch (Exception e1)
            {
                Label4.Text = e1.ToString();
            }
            dr.Close();
            con.Close();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("RegisterMaster.aspx");
        }
    }
}
