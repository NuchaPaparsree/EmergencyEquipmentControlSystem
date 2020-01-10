using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.Report
{
    public partial class WebForm_CommitteeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void ddlPlace_DataBound(object sender, EventArgs e)
        //{
        //    ddlPlace.Items.Insert(0, new ListItem("ALL", "%"));
        //}

        protected void lbtnReport_Click(object sender, EventArgs e)
        {
            var lbtn = (Control)sender;
            GridViewRow row = (GridViewRow)lbtn.NamingContainer;
            Session["U_ID"] = row.Cells[6].Text;
            Session["U_Name"] = row.Cells[7].Text;
            Session["Day"] = row.Cells[2].Text;

            //DataView dv = (DataView)SqlDataSourceCheckItemCheck.Select(DataSourceSelectArguments.Empty);
            //Int32 num1 = Convert.ToInt32(dv.Table.Rows[0][0]);
            //Int32 num2 = Convert.ToInt32(dv.Table.Rows[0][1]);

            //int i = 0;
            //Label CheckSheetID = (Label)GridView1.Rows[i].FindControl("Label1");
            Label CheckSheetID = row.FindControl("Label1") as Label;

            Response.Redirect("ReportCommittee.aspx?CheckSheetID=" + CheckSheetID.Text + "");

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Select_Click(object sender, EventArgs e)
        {
            var conn = new SqlConnection(Properties.Settings.Default.DBConnect);
            using (var cmd = conn.CreateCommand())
            {
                Label _id = new Label();
                _id.Text = null;

                for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    CheckBox ch = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                    Label ID = (Label)GridView1.Rows[i].FindControl("Label1");
                    if (ch.Checked == true)
                    {
                        if(_id.Text != "")
                        {
                            _id.Text = _id.Text + "," + ID.Text ;
                        }
                        else
                        {
                            _id.Text += ID.Text;
                        }
                    }

                }
                        cmd.CommandText = "UPDATE  CheckSheet SET CommitteeID=@CommitteeID, ApproveDate2= GETDATE() WHERE CheckSheet.ID in (" + _id.Text + ")";

                        cmd.Parameters.AddWithValue("@CommitteeID",Session["myLoginID"].ToString());

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                Response.Write("<script>alert('APPROVE SUCCESS');window.location = 'WebForm_ReportCommittee.aspx';</script>");
            }
        }
    }
}
