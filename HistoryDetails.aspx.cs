using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using iTextSharp.text.pdf;
using iTextSharp.text;

namespace proj1
{
    public partial class HistoryDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            orderID = Request.QueryString["OrderId"];
            string SelectCommand = "SELECT [OrderId], [Name1], [Quantity1], [Name2], [Quantity2], [Name3], [Quantity3], [Name4], [Quantity4], [Name5], [Quantity5], [Name6], [Quantity6], [Name7], [Quantity7], [Name8], [Quantity8] FROM [OrderDetails] where OrderId= @orderID";
            SqlDataSource1.SelectCommand = SelectCommand;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("orderID", orderID);
            con.Close();

            string SelectCommand1 = "SELECT [ProductName], [Quantity] FROM [Order1] where OrderID= @orderID";
            SqlDataSource2.SelectCommand = SelectCommand1;
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("orderID", orderID);

            Label1.Text = "Items you order for order ID = " + orderID;
        }

        string orderID;

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/History.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            PdfPTable pdfTable = new PdfPTable(GridView2.HeaderRow.Cells.Count);

            foreach (TableCell tableHeaderCell in GridView2.HeaderRow.Cells)
            {
                PdfPCell pdfCell = new PdfPCell(new Phrase(tableHeaderCell.Text));
                pdfTable.AddCell(pdfCell);
            }

           // string imagePath = "icon.png"; // Specify the path to your image file
           // Image image = Image.GetInstance(imagePath); // Create an Image object from the image file
           // PdfPCell imageCell = new PdfPCell(image, true); // Create a PdfPCell with the Image object
           // pdfTable.AddCell(imageCell);

            foreach (GridViewRow gvr in GridView2.Rows)
            {
                foreach (TableCell tc in gvr.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tc.Text));
                    pdfTable.AddCell(pdfCell);
                }
            }

        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (string.IsNullOrEmpty(cell.Text))
                    {
                        cell.Visible = false;
                    }
                }
            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell headerCell in e.Row.Cells)
                {
                    bool hasNonNullValue = false;

                    foreach (GridViewRow row in GridView2.Rows)
                    {
                        if (!string.IsNullOrEmpty(row.Cells[e.Row.RowIndex].Text))
                        {
                            hasNonNullValue = true;
                            break;
                        }
                    }

                    // Hide the header cell if all corresponding data cells are null
                    headerCell.Visible = hasNonNullValue;
                }
            }
        }
    }
}