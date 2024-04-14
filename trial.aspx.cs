using System;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class trial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            prodID = Request.QueryString["prodID"];
            quantity = Request.QueryString["quantity"];
            Response.Write(prodID);
            Response.Write(quantity);
            //  Label1.Text = Label1.Text +"\n" + prodID;
            if (ViewState["name"] != null && ViewState["quantity"] != null)
            {
                ViewState["name"] = ViewState["name"] + prodID;
                ViewState["quantity"] = ViewState["quantity"] + quantity;
            }
            else
            {
                ViewState["name"] = prodID;
                ViewState["quantity"] = quantity;
            }
        }
        string prodID, quantity;
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Value of TextBox1 and TextBox2 is assigned to the ViewState
            /*ViewState["name"] = prodID;
            ViewState["quamtity"] = quantity;
            Label1.Text = ViewState["name"].ToString();
            Label2.Text = ViewState["quantity"].ToString();*/

            // After clicking on Button, TextBox value will be cleared
            //TextBox1.Text = TextBox2.Text = string.Empty;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            
            Label1.Text = ViewState["name"].ToString();
            Label2.Text = Convert.ToInt32(ViewState["quantity"]).ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // If ViewState values are not null, assign them to TextBoxes
            /*if (ViewState["name"] != null)
            {
                TextBox1.Text = ViewState["name"].ToString();
            }

            if (ViewState["password"] != null)
            {
                TextBox2.Text = ViewState["password"].ToString();
            }*/
        }
    }
}