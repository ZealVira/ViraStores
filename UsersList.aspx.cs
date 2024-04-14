using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace proj1
{
    public partial class Profile2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]?.ToString()?.Equals("true", StringComparison.OrdinalIgnoreCase) == true)
            {
                Response.Write("error");
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void ddl4_Sel(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            //string a = "select * from userDetail";
            //string gen = DropDownList4.SelectedValue;
            string sel = "UPDATE [userDetails] SET [Gender] = @Gender WHERE [UserId] = @UserId";
            SqlCommand com = new SqlCommand(sel, con);
            con.Open();
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                Response.Redirect("User already exists");
            }
            else if (count == 0)
            {
                Response.Redirect("changes");
                con.Close();
            }
            else
            {
                Response.Redirect("error");
            }
        }
    }
}