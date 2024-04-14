using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Diagnostics;
using System.Drawing.Drawing2D;
using System.Xml.Linq;
using System.Drawing;

namespace proj1
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userID"] != null)
            {
                username.Text = Session["userID"].ToString();
                userIDValue = Session["userID"].ToString();
            }
            else
            {
                username.Text = "dummy@gmail.com";
                userIDValue = username.Text;
            }
            //username.Text = Session["userID"].ToString();


            //userIDValue = Session["userID"].ToString();
            string countProduct = "SELECT COUNT(*) FROM Cart WHERE UserId = @Username";
            SqlCommand checkCommand = new SqlCommand(countProduct, con);
            checkCommand.Parameters.AddWithValue("@Username", userIDValue); // Assuming usernameValue is the value you want to use for the parameter
            con.Open();

            productCount = (int)checkCommand.ExecuteScalar();
            if (productCount == 0)
            {
                Label1.Text = "Your cart is currently empty.<br /><br />Please add items to your cart.";
                Button2.Visible = false;
                Button1.Text = "Go to Home Page";
            }

            string selectQuery = "SELECT [ID], [Name], [Price], [prodId], [Quantity], [Image], [GST] FROM [Cart] WHERE [UserId] = @Username";
            SqlDataSource2.SelectCommand = selectQuery;
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("Username", userIDValue);
            con.Close();

        }

        string userIDValue;
        double total = 0.0, sum = 0.0;
        int productCount;

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                double quantity = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Quantity"));
                double price = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Price"));
                double gst = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GST")); // Assuming GST is stored in a column named "GST"

                double total = quantity * price;
                double gstAmount = total * gst / 100;
                double totalPriceWithGST = total + gstAmount;

                sum += totalPriceWithGST;
            }
            lblTotalValue.Text = sum.ToString("0.00");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            Label lblQuantity = (Label)row.FindControl("lblQuantity");
            lblQuantity.Text = ddl.SelectedValue;
        }

        string dateString;
        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();


            string selectQuery = "SELECT Name, Quantity FROM Cart WHERE UserId = @user";
            SqlCommand selectCmd = new SqlCommand(selectQuery, con);
            selectCmd.Parameters.AddWithValue("@user", userIDValue);

            SqlDataReader dr = selectCmd.ExecuteReader();

            List<string> productNames = new List<string>();
            List<int> quantities = new List<int>();

            while (dr.Read())
            {
                string prodName = dr["Name"].ToString();
                int quantity = Convert.ToInt32(dr["Quantity"]);
                productNames.Add(prodName);
                quantities.Add(quantity);
            }
            dr.Close();
            con.Close();
            DateTime today = DateTime.Today;
            dateString = today.ToString("yyyy-MM-dd");
            con.Open();
            int orderId;
            string selectOrderIdQuery = "SELECT MAX(OrderID) FROM Order1";
            SqlCommand selectOrderIdCmd = new SqlCommand(selectOrderIdQuery, con);
            //selectOrderIdCmd.Parameters.AddWithValue("@user", userIDValue);
            object result = selectOrderIdCmd.ExecuteScalar();
            if (result != DBNull.Value)
            {

                orderId = Convert.ToInt32(result) + 1;
            }
            else
            {
                orderId = 167; // if no previous orders, start with order ID 0
            }
            selectOrderIdCmd.Dispose();

            // Begin the transaction
            //con.Open();
            SqlTransaction transaction = con.BeginTransaction();

            try
            {
                for (int j = 0; j < productNames.Count; j++)
                {
                    string prodName = productNames[j];
                    int quantity = quantities[j];

                    // Insert product into order table
                    string insertQuery1 = "INSERT INTO Order1 (UserId, ProductName, Quantity, OrderID) VALUES (@user, @prodName, @quantity, @orderId)";
                    SqlCommand insertCmd1 = new SqlCommand(insertQuery1, con, transaction);
                    insertCmd1.Parameters.AddWithValue("@user", userIDValue);
                    insertCmd1.Parameters.AddWithValue("@prodName", prodName);
                    insertCmd1.Parameters.AddWithValue("@quantity", quantity);
                    insertCmd1.Parameters.AddWithValue("@orderId", orderId);
                    int co2 = insertCmd1.ExecuteNonQuery();
                    if (co2 > 0)
                    {
                        ShowMessage("Done1");
                    }
                    if (co2 <= 0)
                    {
                        ShowMessage("Failed to insert product into Order1");
                        // Rollback the transaction and exit the loop
                        transaction.Rollback();
                        return;
                    }
                }

                    //insertCmd1.Dispose();
                    string insertQuery2 = "INSERT INTO Order2 (OrderID, userID, Total, Date) VALUES (@orderId, @user, @total, @date)";
                    SqlCommand insertCmd2 = new SqlCommand(insertQuery2, con, transaction);
                    insertCmd2.Parameters.AddWithValue("@orderId", orderId);
                    insertCmd2.Parameters.AddWithValue("@total", lblTotalValue.Text);
                    insertCmd2.Parameters.AddWithValue("@user", userIDValue);
                    insertCmd2.Parameters.AddWithValue("@date", dateString);
                    int co = insertCmd2.ExecuteNonQuery();
                    if (co > 0)
                    {
                        ShowMessage("Done2");
                    }
                

                // Commit the transaction
                transaction.Commit();
                Response.Write("Products Added");
            }
            catch (Exception ex)
            {
                // Rollback the transaction if an error occurs
                transaction.Rollback();
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                // Close the connection
                con.Close();
            }



            /*try
            {
                con.Open();
                
                Response.Write(dateString);

                string insertQuery = "INSERT INTO OrderDetails (UserId, Date, Name1, Quantity1, Name2, Quantity2, Name3, Quantity3, Name4, Quantity4, Name5, Quantity5, Name6, Quantity6, Name7, Quantity7, Name8, Quantity8, PhoneNumber, UserName, Total, Status) VALUES (@user, @date, @prodName1, @quantity1, @prodName2, @quantity2, @prodName3, @quantity3, @prodName4, @quantity4, @prodName5, @quantity5, @prodName6, @quantity6, @prodName7, @quantity7, @prodName8, @quantity8, (SELECT PhoneNumber FROM userDetails WHERE userId=@user), (SELECT Name FROM userDetails WHERE userId=@user), @Total, @status)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@user", userIDValue);
                insertCmd.Parameters.AddWithValue("@date", dateString);
                for (int j = 0; j < 8; j++)
                {
                    if (j < productNames.Count)
                    {
                        insertCmd.Parameters.AddWithValue($"@prodName{j + 1}", productNames[j]);
                        insertCmd.Parameters.AddWithValue($"@quantity{j + 1}", quantities[j]);
                    }
                    else
                    {
                        insertCmd.Parameters.AddWithValue($"@prodName{j + 1}", DBNull.Value);
                        insertCmd.Parameters.AddWithValue($"@quantity{j + 1}", DBNull.Value);
                    }
                }
                insertCmd.Parameters.AddWithValue("@Total", lblTotalValue.Text);
                insertCmd.Parameters.AddWithValue("@status", "pending");
                int count = insertCmd.ExecuteNonQuery();
                if (count > 0)
                {
                    Response.Write("Products Added");
                }
            */
            con.Open();
            string selectStockQuery = "SELECT Stock FROM prodInfo WHERE Name = @prodName";

            // Define the SQL query to update the stock in the prodInfo table
            string updateStockQuery = "UPDATE prodInfo SET Stock = @newStock WHERE Name = @prodName";

            for (int i = 0; i < productNames.Count; i++)
            {
                // Fetch the current stock for the product
                SqlCommand selectStockCmd = new SqlCommand(selectStockQuery, con);
                selectStockCmd.Parameters.AddWithValue("@prodName", productNames[i]);
                int currentStock = (int)selectStockCmd.ExecuteScalar();

                int newStock = currentStock - quantities[i];

                // Update the stock value in the prodInfo table
                SqlCommand updateStockCmd = new SqlCommand(updateStockQuery, con);
                updateStockCmd.Parameters.AddWithValue("@newStock", newStock);
                updateStockCmd.Parameters.AddWithValue("@prodName", productNames[i]);
                int count12 = updateStockCmd.ExecuteNonQuery();
                if (count12 > 0)
                {
                    Response.Write("updated");
                }
            }

            string deleteCartItemsQuery = "DELETE FROM Cart WHERE UserId = @UserId";
            SqlCommand deleteCommand = new SqlCommand(deleteCartItemsQuery, con);
            deleteCommand.Parameters.AddWithValue("@UserId", userIDValue);
            deleteCommand.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/OrderConfirmaion.aspx");

        }


        /*Application["id"] = Convert.ToInt32(Application["id"]) + 1;
        int id = Convert.ToInt32(Application["id"]);
        string insertQuery1 = "INSERT INTO Order1 (userId,  ProductName, Quantity, OrderID) VALUES (@user,@prodName, @quantity, @id)";
        SqlCommand insertCmd1 = new SqlCommand(insertQuery1, con);
        insertCmd1.Parameters.AddWithValue("@user", userIDValue);
        insertCmd1.Parameters.AddWithValue("@id", id);
        for (int j = 0; j < 8; j++)
        {
            if (j < productNames.Count)
            {
                insertCmd1.Parameters.AddWithValue($"@prodName", productNames[j]);
                insertCmd1.Parameters.AddWithValue($"@quantity", quantities[j]);
            }
        }
        int count1 = insertCmd1.ExecuteNonQuery();
        if (count1 > 0)
        {
            Response.Write("Products Added");
        }*/
        // Increment the order ID within the loop

    
        

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            ImageButton imageButton = (ImageButton)sender;
            string prodId = imageButton.CommandArgument;
            Response.Redirect("~/Product.aspx?id=" + prodId);
        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }
    }
}

    
