using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iText.Html2pdf.Attach.Impl.Tags;
using iText.Kernel.Geom;
//using iText.Kernel.Pdf;


using System.Runtime.InteropServices;

namespace proj1
{
    public partial class CheckOut : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Zeal Vira\source\repos\Proj1\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            orderID = Request.QueryString["OrderId"];
            if (orderID == "")
            {
                orderID = "132684";
            }
            string SelectCommand = "SELECT [OrderId], [Name1], [Quantity1], [Name2], [Quantity2], [Name3], [Quantity3], [Name4], [Quantity4], [Name5], [Quantity5], [Name6], [Quantity6], [Name7], [Quantity7], [Name8], [Quantity8] FROM [OrderDetails] where OrderId= @orderID";
            SqlDataSource1.SelectCommand = SelectCommand;
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("orderID", orderID);


            string SelectCommand1 = "SELECT [ProductName], [Quantity] FROM [Order1] where OrderID= @orderID";
            SqlDataSource2.SelectCommand = SelectCommand1;
            SqlDataSource2.SelectParameters.Clear();
            SqlDataSource2.SelectParameters.Add("orderID", orderID);

            con.Close();
            string sel = "SELECT * from orderDetails where OrderId=@orderID";
            SqlCommand com1 = new SqlCommand(sel, con);
            com1.Parameters.AddWithValue("@orderID", orderID);
            con.Open();
            SqlDataReader dr = com1.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    string status = dr["Status"].ToString();
                    if (status.ToLower() == "completed")
                    {
                        Button1.Enabled = false;
                        Button1.Visible = false;
                        Label1.Text = "This order has already been completed";
                    }
                }
            }
            catch (Exception)
            {
                Response.Write(e);
            }
        }

        string orderID;

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/History.aspx");
        }

        /*private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Order Invoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            divToPrint.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(iTextSharp.text.PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            iTextSharp.text.pdf.PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            Font font = FontFactory.GetFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }*/

        protected void Button2_Click(object sender, EventArgs e)
        {
            ///exportpdf();
            ///
            Document document = new Document();

            try
            {
                // Create a PdfWriter to write content to the document
                string outputPath = @"C:\Users\Zeal Vira\source\repos\proj1\image\HomePage.Output.pdf";
                PdfWriter.GetInstance(document, new FileStream(outputPath, FileMode.Create));

                // Open the document
                document.Open();

                // Create a Paragraph with the label's text
                string labelText = "This is a label text";
                Paragraph labelParagraph = new Paragraph(labelText);
                document.Add(labelParagraph); // Add the label text to the document

                // Create a PdfPTable
                PdfPTable pdfTable1 = new PdfPTable(GridView2.HeaderRow.Cells.Count);

                foreach (TableCell tableHeaderCell in GridView2.HeaderRow.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableHeaderCell.Text));
                    pdfTable1.AddCell(pdfCell);
                }

                foreach (GridViewRow gvr in GridView2.Rows)
                {
                    foreach (TableCell tc in gvr.Cells)
                    {
                        PdfPCell pdfCell = new PdfPCell(new Phrase(tc.Text));
                        pdfTable1.AddCell(pdfCell);
                    }
                }

                // Add the PdfPTable to the document
                document.Add(pdfTable1);
            }
            catch (DocumentException de)
            {
                // Handle DocumentException
                Console.Error.WriteLine(de.Message);
            }
            catch (IOException ioe)
            {
                // Handle IOException
                Console.Error.WriteLine(ioe.Message);
            }
            finally
            {
                // Close the document
                document.Close();
            }
        


        PdfPTable pdfTable = new PdfPTable(GridView2.HeaderRow.Cells.Count);

            foreach (TableCell tableHeaderCell in GridView2.HeaderRow.Cells)
            {
                PdfPCell pdfCell = new PdfPCell(new Phrase(tableHeaderCell.Text));
                pdfTable.AddCell(pdfCell);
            }


            foreach (GridViewRow gvr in GridView2.Rows)
            {
                foreach (TableCell tc in gvr.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tc.Text));
                    pdfTable.AddCell(pdfCell);
                }
            }

            // Add a header row to the DataList control
            /*PdfPTable pdfTable = new PdfPTable(DataList1.Controls[0].Controls.Count);

            // Add header row
            foreach (Control control in DataList1.Controls[0].Controls)
            {
                if (control is DataListItem)
                {
                    DataListItem item = (DataListItem)control;
                    foreach (Control itemControl in item.Controls)
                    {
                        if (itemControl is Label) // Assuming your data is displayed in labels
                        {
                            Label label = (Label)itemControl;
                            PdfPCell pdfCell = new PdfPCell(new Phrase(label.Text));
                            pdfTable.AddCell(pdfCell);
                        }
                    }
                }
            }

            // Add data rows
            foreach (DataListItem item in DataList1.Items)
            {
                foreach (Control control in item.Controls)
                {
                    if (control is Label) // Assuming your data is displayed in labels
                    {
                        Label label = (Label)control;
                        PdfPCell pdfCell = new PdfPCell(new Phrase(label.Text));
                        pdfTable.AddCell(pdfCell);
                    }
                }
            }

            // Now you can use pdfTable to generate your PDF document
            */

            /*Document pdfDoc = new Document(iTextSharp.text.PageSize.A4_LANDSCAPE, 10f, 10f, 10f, 10f);
            iTextSharp.text.pdf.PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
           // pdfDoc.Open();
            pdfDoc.Add(pdfTable);
            pdfDoc.Close();
            string fileName = "Orders" + orderID;
            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=" + fileName + ".pdf");
            Response.Write(pdfDoc);
            Response.Flush();
            Response.Close();*/


        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Loop through each cell in the row
                foreach (TableCell cell in e.Row.Cells)
                {
                    // Check if the cell's text is null or empty
                    if (string.IsNullOrEmpty(cell.Text))
                    {
                        // If the cell's text is null or empty, hide the cell
                        cell.Visible = false;
                    }
                }
            }

            // Create a Document
             


            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Loop through each cell in the header row
                foreach (TableCell headerCell in e.Row.Cells)
                {
                    bool hasNonNullValue = false;

                    // Loop through each data row and check if the corresponding cell has a non-null value
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