
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
    public partial class WebForm_Committee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Approve_Click(object sender, EventArgs e)
        {
            var conn = new SqlConnection(Properties.Settings.Default.DBConnect);
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = "UPDATE  CheckSheet SET CommitteeID=@CommitteeID, ApproveDate2= GETDATE() WHERE CheckSheet.ID = '" + Request.QueryString["CheckSheetID"].ToString() + "'";

                cmd.Parameters.AddWithValue("@CommitteeID", Session["myLoginID"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


                string mailbody = "TO: Fire Prevention Sub-committee \n You have fire controller report waiting for you approve. \n Please Check your remain data follow this \n Link: http://10.29.1.86/FECS/Report_Chairman?CheckSheetID=" + Request.QueryString["CheckSheetID"].ToString() + "\n Thank you";


                {
                    DataTable IDCon = new DataTable();
                    conn.Open();
                    SqlCommand com = conn.CreateCommand();
                    com.CommandText = ("select Controller.ID from CheckSheet join Controller on Controller.ID = CheckSheet.ControllerID  WHERE CheckSheet.ID='" + Request.QueryString["CheckSheetID"].ToString() + "'");
                    SqlDataAdapter check = new SqlDataAdapter(com);
                    check.Fill(IDCon);
                    conn.Close();


                    Session["U_ID"] = IDCon.Rows[0][0].ToString();
                }

                using (SqlConnection con = new SqlConnection(Properties.Settings.Default.DBConnect))
                {
                    DataTable date = new DataTable();
                    con.Open();
                    SqlCommand com = con.CreateCommand();
                    com.CommandText = ("select cast(datepart(year, getdate()) as varchar(4))+'-'+cast(datepart(MONTH, getdate()) as varchar(2))");
                    SqlDataAdapter check = new SqlDataAdapter(com);
                    check.Fill(date);
                    con.Close();

                    Session["Day"] = date.Rows[0][0].ToString();

                }

                DataView dv = (DataView)SqlDataSourceCheckItemCheck.Select(DataSourceSelectArguments.Empty);
                Int32 num1 = Convert.ToInt32(dv.Table.Rows[0][0]);
                Int32 num2 = Convert.ToInt32(dv.Table.Rows[0][1]);

                //string CheckSheetID = row.Cells[1].Text;

                if (num1 < num2)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('อุปกรณ์ยังตรวจสอบไม่ครบไม่สามารถส่ง E-mail ได้ !! (สามารถตรวจสอบอุปกรณ์ที่ยังไม่ตรวจได้ที่ เมนู CHECKDATA)');", true);
                }
                else
                {


                    {
                        DataTable checkmail = new DataTable();
                        conn.Open();


                        SqlCommand command = conn.CreateCommand();
                        command.CommandText = "EXEC msdb.dbo.sp_send_dbmail @recipients = @Email, @profile_name = @name , @subject =@sub , @body = @mailbody";
                        command.Parameters.AddWithValue("@Email", "Sratdha.Pee@rist.local");
                        command.Parameters.AddWithValue("@name", "Safety");
                        command.Parameters.AddWithValue("@sub", "ใบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง และความพร้อมก่อนการเกิดเหตุฉุกเฉิน");
                        command.Parameters.AddWithValue("@mailbody", mailbody);

                        command.ExecuteNonQuery();
                        conn.Close();
                    }

                }
                Response.Write("<script>alert('APPROVE SUCCESS');window.location = 'WebForm_ReportCommittee.aspx';</script>");

            }
        }
    }
}