using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.Report
{
    public partial class WebForm_Report : System.Web.UI.Page
    {
        public string YearMonth { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    switch (Session["LevelUser"])
            //    {
            //        case 1:
            //            txtName.Text = "";
            //            txtName.Enabled = true;
            //            break;
            //        case 0:
            //            txtName.Text = Session["myLoginUser"].ToString();
            //            txtName.Enabled = false;
            //            break;
            //    }
            //}
        }

        //protected void ddlPlace_DataBound(object sender, EventArgs e)
        //{
        //    DropDownList1.Items.Insert(0, new ListItem("ALL", "%"));
        //}

        protected void lbtnReport_Click(object sender, EventArgs e)
        {
            var lbtn = (Control)sender;
            GridViewRow row = (GridViewRow)lbtn.NamingContainer;
            Session["U_ID"] = row.Cells[6].Text;
            Session["U_Name"] = row.Cells[7].Text;
            Session["Day"] = row.Cells[2].Text;

            DataView dv = (DataView)SqlDataSourceCheckItemCheck.Select(DataSourceSelectArguments.Empty);
            Int32 num1 = Convert.ToInt32(dv.Table.Rows[0][0]);
            Int32 num2 = Convert.ToInt32(dv.Table.Rows[0][1]);


            string CheckSheetID = row.Cells[1].Text;

            if (num1 < num2)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('คุณยังตรวจเช็คอุปกรณ์ไม่ครบ !! (สามารถตรวจสอบอุปกรณ์ที่ยังไม่ตรวจได้ที่ เมนู CHECKDATA)');window.location = 'ReportCheckSheet.aspx?CheckSheetID=" + CheckSheetID + "';", true);
            }
            else
            {
                Response.Redirect("ReportCheckSheet.aspx?CheckSheetID=" + CheckSheetID + "");
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }


        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {
            DropDownList2.Items.Insert(0, new ListItem("ALL", "%"));
        }

        protected void DropDownList1_DataBound1(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("ALL", "%"));
        }

        protected void DropDownList3_DataBound(object sender, EventArgs e)
        {
            DropDownList3.Items.Insert(0, new ListItem("ALL", "%"));
        }



        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell = e.Row.Cells[3];
                TableCell cell1 = e.Row.Cells[7];

                if ((DataBinder.Eval(e.Row.DataItem, "YearMonth","")).ToString() == "" )
                {
                    cell.BackColor = Color.LightSkyBlue;
                    cell1.Text = ("NO CHECK").ToString();
                }

            }

        }
    }
}
        

    
    
