using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class Inventory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            /*con.Open();
            string select = "SELECT prodInfo.*, prodInformation.* " +
                   "FROM prodInfo " +
                   "INNER JOIN prodInformation ON prodInfo.ProductID = prodInformation.ProductID";
            SqlDataSource1.SelectCommand = select;
            SqlDataSource1.SelectParameters.Clear();
            con.Close();*/
        }
    }
}