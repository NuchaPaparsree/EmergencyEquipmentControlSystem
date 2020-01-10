using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace MyProject.PageAdmin
{
    public partial class WebFormTest : System.Web.UI.Page
    {
        //StringBuilder str = new StringBuilder();
        //SqlConnection conn = new SqlConnection(Properties.Settings.Default.DBConnect);


        int total, total_1, total_2, total_3, total_4, total_5, total_6, total_7, total_8, total_9, total_10, total_11, total_12 = 0;
        int actual, actual_1, actual_2, actual_3, actual_4, actual_5, actual_6, actual_7, actual_8, actual_9, actual_10, actual_11, actual_12 = 0;



        protected void Button1_Click(object sender, EventArgs e)
        {
            //--------------Create PDF -----------------

            Response.Clear();
            Response.Buffer = true;
            Response.AppendHeader("content-disposition", "attachment; filename=Progress.xls");
            Response.ContentType = "application/vnd.ms-excel";
            GridView1.AllowPaging = false;
            GridView1.DataBind();
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                GridView1.AllowPaging = false;
                GridView1.RenderControl(hw);
                string Style1 = @"<stype> การส่งรายงานใบแบบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง </style>";
                Response.Write(Style1);
                Response.Output.Write(sw);
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)

        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Plann"));

                total_1 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "April"));
                actual_1 = (total_1 * 100) / total;

                total_2 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "May"));
                actual_2 = (total_2 * 100) / total;

                total_3 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "June"));
                actual_3 = (total_3 * 100) / total;

                total_4 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "July"));
                actual_4 = (total_4 * 100) / total;

                total_5 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Aug"));
                actual_5 = (total_5 * 100) / total;

                total_6 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Sep"));
                actual_6 = (total_6 * 100) / total;

                total_7 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Oct"));
                actual_7 = (total_7 * 100) / total;

                total_8 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Nov"));
                actual_8 = (total_8 * 100) / total;

                total_9 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Dec"));
                actual_9 = (total_9 * 100) / total;

                total_10 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Jan"));
                actual_10 = (total_10 * 100) / total;

                total_11 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Feb"));
                actual_11 = (total_11 * 100) / total;

                total_12 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Mar"));
                actual_12 = (total_12 * 100) / total;
            }

            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                int intNoOfMergeCol = e.Row.Cells.Count - 1; /*except last column */

                GridViewRow footerRow = new GridViewRow(0, 0, DataControlRowType.Footer, DataControlRowState.Insert);
                footerRow.BackColor = System.Drawing.Color.CornflowerBlue;
                footerRow.Font.Bold = true;

                TableCell cell1 = new TableCell();
                cell1.Text = "Actual : ";
                
                cell1.HorizontalAlign = HorizontalAlign.Left;
                cell1.ColumnSpan = 4;
                
                TableCell cell4= new TableCell();
                cell4.Text = actual_1.ToString("####") + "%";

                TableCell cell5 = new TableCell();
                cell5.Text= actual_2.ToString("####") + "%";

                TableCell cell6= new TableCell();
                cell6.Text = actual_3.ToString("####") + "%";
    
                TableCell cell7 = new TableCell();
                cell7.Text =actual_4.ToString("####") + "%";
       
                TableCell cell8= new TableCell();
                cell8.Text = actual_5.ToString("####") + "%";

                TableCell cell9 = new TableCell();
                cell9.Text = actual_6.ToString("####") + "%";

                TableCell cell10= new TableCell();
                cell10.Text = actual_7.ToString("####") + "%";
  
                TableCell cell11 = new TableCell();
                cell11.Text = actual_8.ToString("####") + "%";
       
                TableCell cell12 = new TableCell();
                cell12.Text = actual_9.ToString("####") + "%";
        
                TableCell cell13= new TableCell();
                cell13.Text = actual_10.ToString("####") + "%";
  
                TableCell cell14= new TableCell();
                cell14.Text = actual_11.ToString("####") + "%";
            
                TableCell cell15 = new TableCell();
                cell15.Text = actual_12.ToString("####") + "%";
              
                footerRow.Cells.Add(cell1);
                footerRow.Cells.Add(cell4);
                footerRow.Cells.Add(cell5);
                footerRow.Cells.Add(cell6);
                footerRow.Cells.Add(cell7);
                footerRow.Cells.Add(cell8);
                footerRow.Cells.Add(cell9);
                footerRow.Cells.Add(cell10);
                footerRow.Cells.Add(cell11);
                footerRow.Cells.Add(cell12);
                footerRow.Cells.Add(cell13);
                footerRow.Cells.Add(cell14);
                footerRow.Cells.Add(cell15);
                GridView1.Controls[0].Controls.Add(footerRow);

                // e.Row.Font.Bold = true;
                e.Row.Cells[1].ColumnSpan = 1;
                e.Row.Cells[1].Text = "Total";
                e.Row.Cells[3].Text = total.ToString("####");
                e.Row.Cells[4].Text = total_1.ToString("####");
                e.Row.Cells[5].Text = total_2.ToString("####");
                e.Row.Cells[6].Text = total_3.ToString("####");
                e.Row.Cells[7].Text = total_4.ToString("####");
                e.Row.Cells[8].Text = total_5.ToString("####");
                e.Row.Cells[9].Text = total_6.ToString("####");
                e.Row.Cells[10].Text = total_7.ToString("####");
                e.Row.Cells[11].Text = total_8.ToString("####");
                e.Row.Cells[12].Text = total_9.ToString("####");
                e.Row.Cells[13].Text = total_10.ToString("####");
                e.Row.Cells[14].Text = total_11.ToString("####");
                e.Row.Cells[15].Text = total_12.ToString("####");

            }
        }
    }
}


      