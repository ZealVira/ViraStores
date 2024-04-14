using Org.BouncyCastle.Utilities.Collections;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class AddBrands : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if(Session["admin"]?.ToString()?.Equals("true", StringComparison.OrdinalIgnoreCase) == true)
            {

            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string brand = TextBox1.Text;
            string checkBrand = "Select COUNT(*) from Brands WHERE Name = @name";
            con.Open();
            SqlCommand brandCmd = new SqlCommand(checkBrand, con);
            brandCmd.Parameters.AddWithValue("@name", brand);
            int brandCount = (int)brandCmd.ExecuteScalar();
            con.Close();
            if (brandCount == 0)
            {
                string insBrand = "INSERT INTO Brands [Name] Values (@name)";
                SqlCommand insBrandCmd = new SqlCommand(insBrand, con);
                insBrandCmd.Parameters.AddWithValue("@name", brand);
                ShowMessage("brand added succesfully");
            }
            else
            {
                ShowMessage("Brand exists");
            }
        }


        protected void ShowMessage(string s)
        {
            Response.Write("<script>alert('" + s + "')</script>");
        }
    }
}