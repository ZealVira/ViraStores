using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;

namespace proj1
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }
        int i = 0;
        protected string Random()
        {
            Random res = new Random();
            // String that contain both alphabets and numbers 
            string str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@0123456789";
            int size = 6;
            // Initializing the empty string 
            string randomstring = "";
            for (i = 0; i < size; i++)
            {
                int x = res.Next(str.Length);
                randomstring = randomstring + str[x];
            }
            Session["otp"] = randomstring;
            return randomstring;
        }

        protected void Mail(string randomstring)
        {
            Session["userID"] = "nileshvira75@gmail.com";
            //Session["user"] = TextBox2.Text;
            string username = Session["userID"].ToString();
            string otp = randomstring;
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("zeal.vira@gmail.com");
            //mailMessage.To.Add("nileshvira75@gmail.com");
            mailMessage.To.Add(username);
            mailMessage.Subject = "Account verification";
            mailMessage.Body = "It seems that u have forgotten your password of Vira Stores websites account." +
            "We are providing you the OTP(one time password) to change your password. Please try " +
            "changing your password for it. Your OTP is: " + otp;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("zeal.vira@gmail.com", "wamdvnaeyrxluomm");
            //smtpClient.Credentials = new NetworkCredential("viraStores379@gmail.com", "@viraStores");
            smtpClient.EnableSsl = true;
            try
            {
                smtpClient.Send(mailMessage);
                Label1.Text = "Email Sent Successfully.";
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                Label1.Text = "Error : " + ex.ToString();
            }
        }

        int count = 0;
        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = TextBox2.Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            string sel = "select Count(*) from userDetails where userId= '" + user + "'";
            SqlCommand com = new SqlCommand(sel, con);
            con.Open();
            count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string randomstring = Random();
                Mail(randomstring);
                ShowMessage("Mail sent successfully");
                i = 1;
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string OTP = TextBox1.Text.Trim();
            if(OTP == null)
            {
                Label3.Text = "Enter OTP";
            }
            else if (OTP.Equals(Session["otp"].ToString()))
            {
                Label3.Text = "Verified";
                Response.Redirect("RecreatePasswordaspx.aspx");
            }
            else
            {
                Label3.Text = "OTP does not match. ";
                TextBox1.Text = "";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (count == 0)
            {
                Label1.Text = "You haven't sent a OTP yet";
            }
            else
            {
                string randomstring = Random();
                Mail(randomstring);
                ShowMessage("Mail sent successfully");
            }
        }
    }
}