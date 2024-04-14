using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            prodID = Request.QueryString["id"];
            string sel = "select * from prodInfo where ProductId= '" + prodID + "'";
            SqlCommand com = new SqlCommand(sel, con);
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    Image1.ImageUrl = dr["Image1"].ToString();
                    Name.Text = dr["Name"].ToString();
                    brand.Text = dr["Brand"].ToString();
                    price.Text = dr["price"].ToString();
                    MRP.Text = dr["MRP"].ToString();
                    descriptionLabel.Text = dr["Description"].ToString();
                    category = dr["Category"].ToString().Trim();
                    diff = Convert.ToInt32(MRP.Text) - Convert.ToInt32(price.Text);
                    decimal disc = ((decimal)diff / Convert.ToInt32(MRP.Text)) * 100;
                    discount.Text = disc.ToString("0.00");
                    size.Text = dr["Size"].ToString();
                    stock1 = Convert.ToInt32(dr["Stock"]);
                    if (stock1 < 20)
                    {
                        stock.ForeColor = System.Drawing.Color.Red;
                        stock.Text = "only " + stock1 + " are left!";
                        if (stock1 < 10)
                        {
                            stock.Text = "OUT OF STOCK";
                            stock.ForeColor = System.Drawing.Color.Red;
                            addToCart.Enabled = false;
                            addToCart.Visible = false;
                        }
                    }
                    else
                    {
                        stock.ForeColor = System.Drawing.Color.Black;
                        stock.Text = stock1 + " available";
                    }
                }
            }
            catch
            {
                // Label1.Text = "err";
            }
            con.Close();
            
            string sel1 = "select * from productInfo where ProductId= '" + prodID + "'";
            SqlCommand com1 = new SqlCommand(sel1, con);
            con.Open();
            SqlDataReader dr1 = com1.ExecuteReader();
            try
            {
                while (dr1.Read())
                {
                    IngredientsLabel.Text = dr1["Ingredients"].ToString();
                    Vegan.Text = dr1["Vegan"].ToString();
                    DisclaimerLabel.Text = dr1["Disclaimer"].ToString();
                }
            }
            catch
            {
                //Label1.Text = "err";
            }
            con.Close();

            string brand1 = brand.Text;
            if (Session["userID"] != null) 
            {
                user = Session["userID"].ToString(); 
            }
            else
            {
                user = "dummy@gmail.com";
            }
            string selectQuery1 = "SELECT TOP 7 [ProductId], [Name], [Price], [Image1] FROM [prodInfo] WHERE [Brand] = @Brand ORDER BY NEWID() ";
            SqlDataSource1.SelectCommand = selectQuery1;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("Brand", brand1);

            string selectQuery2 = "SELECT TOP 7 [ProductId], [Name], [Price], [Image1] FROM [prodInfo] WHERE [Category] = @Category ORDER BY NEWID() ";
            SqlDataSource2.SelectCommand = selectQuery2;
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("Category", category);

            string selectQuery3 = "SELECT [UserName], [Review], [Date] FROM [Review] WHERE [ProductId] = @ProductId ORDER BY NEWID() ";
            SqlDataSource3.SelectCommand = selectQuery3;
            SqlDataSource3.SelectParameters.Clear();
            SqlDataSource3.SelectParameters.Add("ProductId", prodID);
        }

        string prodID, category, user;
        int quantity, diff, disc;



        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    quantity = Convert.ToInt32(ddl1.SelectedValue);
        //    Response.Write(quantity);
        //}

        int stock1;

        protected void addToCart_Click(object sender, EventArgs e)
        {
            //quantity = 1;
            quantity = Convert.ToInt32(ddl1.SelectedValue);
            if (Session["userID"] == null)
            {
                Session["RedirectUrl"] = HttpContext.Current.Request.Url.PathAndQuery;
                Response.Redirect("~/LoginMaster.aspx");
            }


            //Response.Write(quantity);
            string checkCartCount = "SELECT COUNT(*) FROM Cart WHERE UserId = @user";
            SqlCommand CartCountCommand = new SqlCommand(checkCartCount, con);
            //CartCountCommand.Parameters.Clear();
            CartCountCommand.Parameters.AddWithValue("@user", user);
            con.Open();
            int CartCount = (int)CartCountCommand.ExecuteScalar();
            con.Close();
            if (CartCount == 8)
            {
                ShowMessage("Maximum limit of adding products to cart is reached");
            }
            else
            {
                string checkProductQuery = "SELECT COUNT(*) FROM Cart WHERE ProdId = @prodID";
                SqlCommand checkCommand = new SqlCommand(checkProductQuery, con);
                checkCommand.Parameters.AddWithValue("@prodID", prodID);
                con.Open();
                int productCount = (int)checkCommand.ExecuteScalar();
                if (productCount > 0)
                {
                    // Product already exists in cart, update quantity
                    string updateCart = "UPDATE Cart SET Quantity =  @quantity WHERE ProdId = @prodID";
                    SqlCommand updateCmd = new SqlCommand(updateCart, con);
                    updateCmd.Parameters.AddWithValue("@prodID", prodID);
                    updateCmd.Parameters.AddWithValue("@quantity", quantity);

                    int updatedRows = updateCmd.ExecuteNonQuery();
                    if (updatedRows > 0)
                    {
                        ShowMessage("Quantity updated");
                    }
                }
                else
                {
                    // Product does not exist in cart, insert new entry
                    string insertCart = "INSERT INTO Cart (UserId, ProdId, Quantity, Name, Price, Image, GST) " +
                                         "VALUES (@userId, @prodID, @quantity, (SELECT Name FROM prodInfo WHERE ProductId = @prodID), (SELECT Price FROM prodInfo WHERE ProductId = @prodID)," +
                                         "(SELECT Image1 FROM prodInfo WHERE ProductId = @prodID), (SELECT GST FROM prodInfo WHERE ProductId = @prodID) )";
                    SqlCommand insertCmd = new SqlCommand(insertCart, con);
                    insertCmd.Parameters.AddWithValue("@prodID", prodID);
                    insertCmd.Parameters.AddWithValue("@userId", user);
                    insertCmd.Parameters.AddWithValue("@quantity", quantity);

                    int insertedRows = insertCmd.ExecuteNonQuery();
                    if (insertedRows > 0)
                    {
                        ShowMessage("Product added to cart");
                    }
                }

                //productCount = +1;
                //Session["CartCount"] = productCount; // Implement GetCartCount() to fetch the count from the database or session
                //Label2.Text = Session["CartCount"].ToString();
                con.Close();
            }
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            ImageButton imageButton = (ImageButton)sender;
            string prodId = imageButton.CommandArgument;
            Response.Redirect("~/Product.aspx?id=" + prodId);
        }

        protected void reviewBtn_Click(object sender, EventArgs e)
        {
            if (user == "dummy@gmail.com")
            {
                ShowMessage("You can't review before logging in");
            }
            else
            {
                string reviewtxt = review.Text.Trim();
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                string checkReview = "SELECT COUNT(*) FROM Review WHERE ProductId = @prodID AND UserId = @UserId";
                SqlCommand checkCommand = new SqlCommand(checkReview, con);
                checkCommand.Parameters.AddWithValue("@prodID", prodID);
                checkCommand.Parameters.AddWithValue("@userId", user);
                con.Open();
                int reviewCount = (int)checkCommand.ExecuteScalar();
                if (reviewCount > 0)
                {
                    string update = "UPDATE Review SET Review =  @review, Date = @date WHERE ProductId = @prodID AND UserId = @userID";
                    SqlCommand updateReview = new SqlCommand(update, con);
                    updateReview.Parameters.AddWithValue("@review", reviewtxt);
                    updateReview.Parameters.AddWithValue("@prodID", prodID);
                    updateReview.Parameters.AddWithValue("@userId", user);
                    updateReview.Parameters.AddWithValue("@date", date);

                    int updatedRows = updateReview.ExecuteNonQuery();
                    if (updatedRows > 0)
                    {
                        ShowMessage("Review updated");
                    }
                }
                else
                {
                    string insert = "Insert into Review (UserId, ProductId, Review, Date, UserName) values " +
                    "(@userId, @prodId, @review, @date, (SELECT Name FROM userDetails WHERE UserId = @userID))";
                    SqlCommand insertReview = new SqlCommand(insert, con);
                    insertReview.Parameters.AddWithValue("@prodID", prodID);
                    insertReview.Parameters.AddWithValue("@userId", user);
                    insertReview.Parameters.AddWithValue("@review", reviewtxt);
                    insertReview.Parameters.AddWithValue("@date", date);

                    int insertedRow = insertReview.ExecuteNonQuery();
                    if (insertedRow > 0)
                    {
                        ShowMessage("Review added successfully");
                    }
                }

                con.Close();

                con.Open();
            }
        }

        protected void ShowMessage(string s)
        {

            Response.Write("<script>alert('" + s + "')</script>");
        }

    }
}