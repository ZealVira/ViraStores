using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class Orders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string select = "SELECT [OrderId], [UserName], [Date], [Total], [Status], [Payment] FROM [OrderDetails] ORDER BY [Status] DESC , [Date] DESC";
            SqlDataSource2.SelectCommand = select;
            SqlDataSource2.SelectParameters.Clear();
            con.Close();

            string selectQuery = "SELECT * FROM [Order2] ORDER BY [OrderID] DESC, [Date]";
            SqlDataSource1.SelectCommand = selectQuery;
            SqlDataSource1.SelectParameters.Clear();
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList DropDownList1 = (DropDownList)sender;
            GridViewRow row = (GridViewRow)DropDownList1.NamingContainer;

            if (row.RowType == DataControlRowType.DataRow)
            {
                Label lblstatus = (Label)row.FindControl("Label1");
                if (lblstatus != null)
                {
                    lblstatus.Text = DropDownList1.SelectedValue;
                }

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewOrder")
            {
                string orderId = e.CommandArgument.ToString();
                Response.Redirect($"OrderDetails.aspx?OrderId={orderId}");
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();
                if (status.Equals("pending", StringComparison.OrdinalIgnoreCase))
                {
                    e.Row.CssClass = "pending-row";
                }
                if (status.Equals("completed", StringComparison.OrdinalIgnoreCase))
                {
                    e.Row.CssClass = "completed-rows";
                }

            }
        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewOrder")
            {
                string orderId = e.CommandArgument.ToString();
                Response.Redirect($"H1.aspx?OrderId={orderId}");
            }

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            //TextBox1.Visible = true;
            if (!String.IsNullOrEmpty(TextBox1.Text))
            {
                int orderID = Convert.ToInt32(TextBox1.Text + "%"); // Append '%' to the search term
                using (SqlCommand cmd = new SqlCommand("OrderSearch", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlParameter nameParameter = new SqlParameter("@orderID", orderID);
                    cmd.Parameters.Add(nameParameter);

                    using (SqlDataAdapter sd = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sd.Fill(dtBrands);

                        DataTable dtDisplay = new DataTable();
                        dtDisplay.Columns.Add("OrderID", typeof(int));
                        dtDisplay.Columns.Add("userID", typeof(string));
                        dtDisplay.Columns.Add("Total", typeof(float));
                        dtDisplay.Columns.Add("Status", typeof(string));

                        foreach (DataRow row in dtBrands.Rows)
                        {
                            DataRow newRow = dtDisplay.NewRow();
                            newRow["OrderID"] = row["OrderID"];
                            newRow["uerID"] = row["uerID"];
                            newRow["Total"] = row["Total"];
                            newRow["Status"] = row["Status"];
                            dtDisplay.Rows.Add(newRow);
                        }

                        GridView1.DataSource = dtDisplay;
                        GridView1.DataBind();
                    }
                }
            }
            else
            {
                BindEmptySearch();
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
                //ImageButton imgButton = (ImageButton)e.Row.FindControl("imgProduct");
                DataRowView rowView = e.Row.DataItem as DataRowView;

                // Check if the data item is not null and contains the "ProductId" column
                if (rowView != null && rowView.Row.Table.Columns.Contains("ProductId"))
                {
                    // Set the CommandArgument to the ProductId
                    string productId = rowView["ProductId"].ToString();
                    //imgButton.CommandArgument = productId;
                }
            }

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
            }
        }

        private void BindEmptySearch()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");
            using (SqlCommand cmd = new SqlCommand("Select Name, Category from prodInfo", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    GridView3.DataSource = dtBrands;
                    GridView3.DataBind();
                }
            }
        }
        protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Find the second column which should be the Image1 column
                int columnIndex = 2;

                // Set the header text to an empty string
                e.Row.Cells[columnIndex].Text = string.Empty;

                // Optionally, you can change the color of the header if you want
                e.Row.Cells[columnIndex].BackColor = System.Drawing.Color.LightGray;
            }


        }
    }
}