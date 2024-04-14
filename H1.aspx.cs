using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class H1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //Application["id"] = 13459;
            string orderID = Request.QueryString["OrderId"].ToString();
            string SelectCommand = "SELECT [ProductName], [Quantity] FROM[Order1] where orderID=@order";
            SqlDataSource1.SelectCommand = SelectCommand;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("order", orderID);
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Application["id"] = Convert.ToInt32(Application["id"]) + 1;
            Label1.Text = Application["id"].ToString();
        }
    }
}