using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace proj1
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["admin"]?.ToString()?.Equals("true", StringComparison.OrdinalIgnoreCase) == true)
            {
                
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }*/

            if(!IsPostBack)
            {
                getChartType();
                GetChartData();
            }

        }

        private void getChartType()
        {
            foreach(int chartType in Enum.GetValues(typeof(SeriesChartType)))
            {
                ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), chartType), chartType.ToString());
                DropDownList1.Items.Add(li);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChartData();
            Chart1.Series["Series1"].ChartType = (SeriesChartType)(Enum.Parse(typeof(SeriesChartType), DropDownList1.SelectedValue));
        }

        private void GetChartData()
        {

            string selectQuery = "Select Name, Stock from prodInfo";
            
            SqlCommand cmd = new SqlCommand(selectQuery, con);
            con.Open();
            SqlDataReader dr =  cmd.ExecuteReader();
            Chart1.DataBindTable(dr, "Name");

            con.Close();
            /*Chart1.Series["Series1"].XValueMember = "Name";
            Chart1.Series["Series1"].YValueMembers = "Stock";
            Chart1.DataSource = dr;
            Chart1.DataBind();*/

            /*Series series = Chart1.Series["Series1"];
            while (dr.Read())
            {
                series.Points.AddXY(dr["Name"], dr["Stock"]);
            }*/




            /*series.Points.AddXY("Tom", 300);
            series.Points.AddXY("Tom", 300);
            series.Points.AddXY("Tom", 300);
            series.Points.AddXY("Tom", 300);*/
        }
    }
}















/*
 <Points>
                        <asp:DataPoint AxisLabel="MArk" YValues="200" />
                        <asp:DataPoint AxisLabel="John" YValues="300" />
                        <asp:DataPoint AxisLabel="jack" YValues="500" />
                    </Points>
 */