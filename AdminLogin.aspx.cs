using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (mstTextBox1.Text.Trim() == "admin@123" && password.Text.Trim() == "admin")
            {
                
                Session["admin"] = true;
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                Response.Write("error");
            }
        }
    }
}