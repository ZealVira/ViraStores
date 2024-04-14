using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace proj1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] != null)
            //{
                Session["user"] = "admin";
                string name = Session["user"].ToString();
            
            
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
                string a = "select * from userDetails where UserId = '" + name + "'";
                //Label7.Text = a;
                Response.Write(name);
                SqlCommand com = new SqlCommand(a, con);
                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    //decimal no = dr["phoneNumber"];
                    TextBox1.Text = (string)dr["name"];
                    Label2.Text = (string)dr["userId"];
                    Label4.Text = (string)dr["gender"];
                    Label3.Text = Convert.ToString((decimal)dr["phoneNumber"]);

                }
                dr.Close();
                con.Close();
            
                //Label2.Text = a;
            /*}
            else
            {
                Response.Redirect("~/Login1.aspx");
            }*/
            

        }
    }
}