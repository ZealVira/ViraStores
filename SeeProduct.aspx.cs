using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class SeeProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]?.ToString()?.Equals("true", StringComparison.OrdinalIgnoreCase) == true)
            {
                
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string stock = DataBinder.Eval(e.Row.DataItem, "Stock").ToString();
                if (int.TryParse(stock,out int stockValue) && stockValue < 25)
                {
                    e.Row.CssClass = "lessProd";
                }

            }
        }
    }
}