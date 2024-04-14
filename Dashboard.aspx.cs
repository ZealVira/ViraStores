using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["admin"]?.ToString()?.Equals("true", StringComparison.OrdinalIgnoreCase) == true)
            {
                Response.Write("");
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }*/
        }
    }
}