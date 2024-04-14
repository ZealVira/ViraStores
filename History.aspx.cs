using Stripe.Climate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace proj1
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string username = "tom1@gmail.com";
                string username = Session["userID"].ToString();
                string selectQuery = "SELECT [OrderID], [Date], [Total], [Status] FROM [Order2] WHERE [UserId] = @user1 ORDER BY [Date] DESC";
                SqlDataSource1.SelectCommand = selectQuery;
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("user1", username);
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string orderId = button.CommandArgument;
            Response.Redirect($"HistoryDetails.aspx?OrderId={orderId}");
            
        }
    }
}

//SelectCommand="SELECT * FROM [OrderDetails]"