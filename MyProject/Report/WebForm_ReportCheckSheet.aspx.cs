using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.Report
{
    public partial class WebForm_ReportCheckSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                {
                switch (Session["LevelUser"])
                {
                    case 1:
                        txtName.Text = "";
                        txtName.Enabled = true;
                        break;
                    case 0:
                        txtName.Text = Session["myLoginUser"].ToString();
                        txtName.Enabled = false;
                        break;
                }
            }
        }

        protected void ddlPlace_DataBound(object sender, EventArgs e) 
        {
            ddlPlace.Items.Insert(0, new ListItem("ALL", "%"));
        }

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


    }
}