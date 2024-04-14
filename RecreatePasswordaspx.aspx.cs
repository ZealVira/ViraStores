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
    public partial class RecreatePasswordaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["otp"] == null)
            {
                Response.Redirect("ForgotPassword.aspx");
            }
        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C: \Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
                if (Session["otp"] != null)
                {
                    //Session["user"] = "nileshvira75@gmail.com";
                    //string username = Session["userID"].ToString();
                    string username = "zeal.vira@gmail.com";
                    string strpass = encryptpass(TextBox1.Text);
                    string upd = "UPDATE userDetails SET Password = @pass where user = '" + username + "'";
                    SqlCommand update = new SqlCommand(upd, con);
                    update.Parameters.AddWithValue("@pass", strpass);
                    con.Open();
                    int i = update.ExecuteNonQuery();
                    con.Close();
                    if (i > 0)
                    {
                        ShowMessage("Your Password has been updated successfully");
                    }
                }
                else
                {
                    Response.Redirect("ForgotPassword.aspx");
                    Label3.Text = "Session timed out";
                }
            }
            catch
            {
                Label3.Text = "error";
            }
        }

        public string encryptpass(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

    }
}