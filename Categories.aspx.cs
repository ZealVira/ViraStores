using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string categories = Request.QueryString["Category"];
            string selectQuery = "SELECT [ProductId], [Name], [Price], [Image1] FROM [prodInfo] WHERE [Category] = @category ";
            SqlDataSource1.SelectCommand = selectQuery;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("category", categories);
            Label2.Text = categories;
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