using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;

namespace proj1
{
    public partial class RegisterMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (TextBox4.TextMode == TextBoxMode.Password)
            {
                TextBox4.TextMode = TextBoxMode.SingleLine;
            }
        }

        public static bool IsAlphaNumeric(string inputAlphabet)
        {
            const string expression = @"^[A-Za-z0-9]+$";

            Regex regex = new Regex(expression);
            return regex.IsMatch(inputAlphabet);
        }
        string strpass = "";
        public void checkPass(string pass)
        {
            if (pass.Length <= 6)
            {
                Label1.Text = "Password must have atleast 6 characters";
            }
            else
            {
                strpass = encryptpass(TextBox4.Text);
                Label4.Text = strpass;
            }
            if (!IsAlphaNumeric(pass))
            {
                Label1.Text = "Password must contain atleast one number and one upper lower case character";
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

        protected void ShowMessage(string s)
        {
            
            Response.Write("<script>alert('"+s+"')</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            checkPass(TextBox4.Text);

            // string strpass = encryptpass(TextBox4.Text);
            // Label4.Text = strpass;

            //Session["reg"] = "Registered";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            string enable = "true";
            string user = TextBox2.Text;
            string sel = "select * from userDetails where userId= '" + user + "'";
            SqlCommand com = new SqlCommand(sel, con);
            con.Open();
            int count = Convert.ToInt32(com.ExecuteScalar());
            con.Close();
            if (count > 0)
            {
                ShowMessage("This UserID already exists, please use other one");
                TextBox2.Text = "";
                TextBox6.Text = "";
            }


            else if (count == 0)
            {
                string ins = "INSERT INTO userDetails (Name, UserId, Password, Gender, PhoneNumber, Enabled) VALUES (@Param1, @Param2, @Param3, @Param4, @Param6, @Param7)";
                SqlCommand cmd = new SqlCommand(ins, con);
                cmd.Parameters.AddWithValue("@Param1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Param2", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Param3", strpass);
                cmd.Parameters.AddWithValue("@Param4", RadioButtonList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Param6", Convert.ToInt64(TextBox6.Text));
                cmd.Parameters.AddWithValue("@Param7", enable);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    Session["user"] = TextBox1.Text;
                    Response.Redirect("~/LoginMaster.aspx");
                }
                else
                {
                    ShowMessage("Some error occured, please try again later");
                }
            }
            else { Label2.Text = "Something went Wrong"; }
            } 

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("LoginMaster.aspx");
        }
    }
}