using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;

namespace proj1
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }

        protected void Mail()
        {
            Session["user"] = "nileshvira75@gmail.com";
            //Session["user"] = TextBox2.Text;
            string username = Session["user"].ToString();
            string sender = "zeal.vira@gmail.com";
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(sender);
            //mailMessage.To.Add("nileshvira75@gmail.com");
            mailMessage.To.Add(username);
            mailMessage.To.Add(sender);
            mailMessage.Subject = "Contacting Admin";
            mailMessage.Body = "User:" +TextBox1.Text + "with email address" +TextBox2.Text + 
                " has following message for you. " +TextBox3.Text;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("zeal.vira@gmail.com", "wamdvnaeyrxluomm");
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

        int count = 0, i=0;

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = TextBox2.Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            string sel = "select * from userDetails where userId= '" + user + "'";
            SqlCommand com = new SqlCommand(sel, con);
            con.Open();
            count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                Mail();
                try
                {
                    ShowMessage("Mail sent successfully");
                }
                catch
                {
                    ShowMessage("Error sending your query. Please try again later or " +
                        "you can try contacting us on our phone number 0222654218");
                }
                
            }
            else
            {
                Response.Write("error");
            }
            con.Close();
        }
    }
}