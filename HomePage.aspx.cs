using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Label1.Text != "Quantity")
            {
                string a = Label1.Text;
                // Response.Write(a);
                //int quan = Convert.ToInt32(a);
                //Response.Write(quan + 1);
            }

            //string categories = Request.QueryString["Category"];
            /*string selectQuery = "SELECT TOP 1 [ProductId], [Name], [Price], [Image1] FROM [prodInfo] ORDER BY NEWID() ";
            SqlDataSource1.SelectCommand = selectQuery;
            SqlDataSource1.SelectParameters.Clear();*/
            //SqlDataSource1.SelectParameters.Add("category", categories);
        }
        //int quant = 0;



        protected void add_Click(object sender, EventArgs e)
        {
            //    quant = quant + 1;
            //   Label1.Text = quant.ToString();
            //int quant = 0;
            /*if (Application["user"] != null)
            {
                
                quant = Int32.Parse(Application["user"].ToString());
            }
            quant = quant + 1;
            Label1.Text = quant.ToString();
            Application.Lock();
            Application["user"] = quant.ToString();
            Application.UnLock();*/
        }

        public static void ProcessIncrementedValue(int value)
        {
            Console.WriteLine("Received value from JavaScript: " + value);
        }
        /*protected void minus_Click(object sender, EventArgs e)
        {
            if (Application["user"] != null)
            {
                quant = Int32.Parse(Application["user"].ToString());
            }
            else
            {
                quant = 0;
            }
            quant = quant - 1;
            Label1.Text = quant.ToString();
            Application["user"] = quant.ToString();
        }*/

        protected void Button6_Click(object sender, EventArgs e)
        {
            //Session["cart"] = Session["cart"].ToString() + "\n" + "ATaaza1 ";
            //Response.Write(Session["cart"]);
        }
        string s1;
        protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
        {
            s1 = "VTM500";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }

        protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
        {
           // Label2.Text = "WBreadM";
            s1= "WBreadM";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }

        protected void ImageButton13_Click(object sender, ImageClickEventArgs e)
        {
            string s1 = "ATaaza1";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }

        protected void GCSImageButton_Click(object sender, ImageClickEventArgs e)
        {
            string s1 = "GCS500";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }

        protected void MordeImageButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void VEgglessImageButton_Click(object sender, ImageClickEventArgs e)
        {
            
            string s1 = "VM500";
            Response.Redirect("~/Product.aspx?id=" + s1);   
        }

        protected void AFCImageButton_Click(object sender, ImageClickEventArgs e)
        {
            string s1 = "AFC500";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }
        
        protected void MilkmaidImageButton_Click(object sender, ImageClickEventArgs e)
        {
            string s1 = "MM500";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            string s1 = "AB250";
            Response.Redirect("~/Product.aspx?id=" + s1);
        }
        string Brand, category;
        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            Brand = "Amul";
            Response.Redirect("~/Brands.aspx?brand=" + Brand);
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            Brand = "Gowardhan";
            Response.Redirect("~/Brands.aspx?brand=" + Brand);
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            Brand = "Britannia";
            Response.Redirect("~/Brands.aspx?brand=" + Brand);
        }

        protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
        {
            Brand = "Veeba";
            Response.Redirect("~/Brands.aspx?brand=" + Brand);
        }

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            Brand = "Mapro";
            Response.Redirect("~/Brands.aspx?brand=" + Brand);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            category = "Bread";
            Response.Redirect("~/Categories.aspx?Category=" + category);

        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            category = "Dairy";
            Response.Redirect("~/Categories.aspx?Category=" + category);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            category = "Canned";
            Response.Redirect("~/Categories.aspx?Category=" + category);
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            category = "Frozen";
            Response.Redirect("~/Categories.aspx?Category=" + category);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            category = "Packed";
            Response.Redirect("~/Categories.aspx?Category=" + category);
        }

    }
}