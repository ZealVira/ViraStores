using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class Brands : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string brandName = Request.QueryString["brand"];
            string selectQuery = "SELECT [ProductId], [Name], [Price], [Image1] FROM [prodInfo] WHERE [Brand] = @Brand ";
            SqlDataSource1.SelectCommand = selectQuery;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("Brand", brandName);
            Label2.Text = brandName;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ImageButton button = (ImageButton)sender;
            string prodId = button.CommandArgument;
            Response.Write(prodId);
            Response.Redirect("~/Product.aspx?id=" + prodId);
        }
    }
}