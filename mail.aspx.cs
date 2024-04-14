using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace proj1
{
    public partial class mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("zeal.vira@gmail.com");
            mailMessage.To.Add("nileshvira75@gmail.com");
            mailMessage.Subject = "Subject";
            mailMessage.Body = "This is test email";

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            //smtpClient.Host = "smtp.gmail.com";
            //smtpClient.Port = 587;
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
                Label1.Text = "Error: " + ex.ToString();
            }
        }
    }
}