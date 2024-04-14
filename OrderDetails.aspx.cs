using Stripe.Climate;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text;

namespace proj1
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            orderID = Request.QueryString["OrderId"];
            string SelectCommand = "SELECT [OrderId],  [Name1], [Quantity1], [Name2], [Quantity2], [Name3], [Quantity3], [Name4], [Quantity4], [Name5], [Quantity5], [Name6], [Quantity6], [Name7], [Quantity7], [Name8], [Quantity8] FROM [OrderDetails] where OrderId= @orderID";
            SqlDataSource1.SelectCommand = SelectCommand;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("orderID", orderID);
            con.Close();

            string SelectCommand1 = "SELECT [ProductName], [Quantity] FROM [Order1] where OrderID= @orderID";
            SqlDataSource2.SelectCommand = SelectCommand1;
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("orderID", orderID);


            string sel = "SELECT * from orderDetails where OrderId=@orderID";
            SqlCommand com1 = new SqlCommand(sel, con);
            com1.Parameters.AddWithValue("@orderID", orderID);
            con.Open();
            SqlDataReader dr = com1.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    string status = dr["Status"].ToString();
                    userID1 = dr["UserId"].ToString();
                    if (status.ToLower() == "completed")
                    {
                        Button1.Enabled = false;
                        Button1.Visible = false;
                        Label1.Text = "This order has already been completed";
                    }
                }
            }
            catch (Exception)
            {
                Response.Write(e);
            }
            con.Close();
        }

        string orderID, userID1;
        protected void Button1_Click(object sender, EventArgs e)
        {

            con.Open();
            string update = "update orderDetails set Status = @status where OrderId=@orderID";
            SqlCommand updateCmd = new SqlCommand(update, con);
            updateCmd.Parameters.AddWithValue("@status", "READY");
            updateCmd.Parameters.AddWithValue("@orderID", orderID);

            int updatedRows = updateCmd.ExecuteNonQuery();
            if (updatedRows > 0)
            {
                Response.Write("Status updated");
                Mail();
            }
            con.Close();
        }

        protected void Mail()
        {
            //Session["userID"] = "nileshvira75@gmail.com";
            //Session["user"] = TextBox2.Text;
            userID1 = "nileshvira75@gmail.com";
            string username = userID1;

            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("zeal.vira@gmail.com");
            //mailMessage.To.Add("nileshvira75@gmail.com");
            mailMessage.To.Add(username);
            mailMessage.Subject = "Order Status";
            mailMessage.Body = "Your order is ready for pickup .\n" +
                "Please visit the store to pickit up before 8 clock. \n" +
                "Address: hop No.379/380, Inside Crawford Market, Lokmanya Tilak Rd, Chhatrapati Shivaji Terminus Area, Fort, Mumbai, Maharashtra 400001";

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("zeal.vira@gmail.com", "wamdvnaeyrxluomm");
            smtpClient.EnableSsl = true;
            try
            {
                smtpClient.Send(mailMessage);
                ShowMessage("Email Sent Successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                ShowMessage("Error : " + ex.ToString());
            }
        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }

    }   
}