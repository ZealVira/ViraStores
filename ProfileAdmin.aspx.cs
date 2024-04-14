using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class ProfileAdmin : System.Web.UI.Page
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            Label lblEnabled = (Label)row.FindControl("lblEnable");
            lblEnabled.Text = ddl.SelectedValue;
        }
    }
}