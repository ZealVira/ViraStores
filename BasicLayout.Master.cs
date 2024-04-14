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
    public partial class BasicLayout : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //username.Text = "abcd1@gmail.com";
            if (Session["userID"] != null)
            {
               username.Text = Session["userID"].ToString();
            }
            /*else
            {
                username.Text =  "dummy@gmail.com";
            }*/
            //username.Text = Session["userID"].ToString();
            userIDValue = username.Text;
            string countProduct = "SELECT COUNT(*) FROM Cart WHERE UserId = @Username";
            SqlCommand checkCommand = new SqlCommand(countProduct, con);
            checkCommand.Parameters.AddWithValue("@Username", userIDValue); // Assuming usernameValue is the value you want to use for the parameter
            con.Open();

            int productCount = (int)checkCommand.ExecuteScalar();
            Label1.Text = productCount.ToString();
        }


        string userIDValue;
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            //TextBox1.Visible = true;
            if (!String.IsNullOrEmpty(TextBox1.Text))
            {
                string searchTerm = TextBox1.Text + "%"; // Append '%' to the search term
                using (SqlCommand cmd = new SqlCommand("NameSearch", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlParameter nameParameter = new SqlParameter("@Name", searchTerm);
                    cmd.Parameters.Add(nameParameter);

                    using (SqlDataAdapter sd = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sd.Fill(dtBrands);

                        DataTable dtDisplay = new DataTable();
                        dtDisplay.Columns.Add("Name", typeof(string));
                        dtDisplay.Columns.Add("Image1", typeof(string));
                        dtDisplay.Columns.Add("ProductId", typeof(string));
                        
                        foreach (DataRow row in dtBrands.Rows)
                        {
                            DataRow newRow = dtDisplay.NewRow();
                            newRow["Name"] = row["Name"]; 
                            newRow["Image1"] = row["Image1"]; 
                            newRow["ProductId"] = row["ProductId"];
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
                ImageButton imgButton = (ImageButton)e.Row.FindControl("imgProduct");
                DataRowView rowView = e.Row.DataItem as DataRowView;

                // Check if the data item is not null and contains the "ProductId" column
                if (rowView != null && rowView.Row.Table.Columns.Contains("ProductId"))
                {
                    // Set the CommandArgument to the ProductId
                    string productId = rowView["ProductId"].ToString();
                    imgButton.CommandArgument = productId;
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
                    GridView1.DataSource = dtBrands;
                    GridView1.DataBind();
                }
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
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

        protected void imgProduct_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton button = (ImageButton)sender;
            string prodId = button.CommandArgument;
            Response.Write(prodId);
            Response.Redirect("~/Product.aspx?id=" + prodId);
        }

        /*protected void imgProduct_Command(object sender, CommandEventArgs e)
        {
            string productID = e.CommandArgument as string;

            // Redirect to the product page with the productID as a parameter
            Response.Redirect("~/Product.aspx?id=" + productID);
        }*/
    }
}