using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.Report
{
    public partial class ReportCheckSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            //string recip = "EXEC msdb.dbo.sp_send_dbmail @recipients = @Email,@profile_name = @name ,@subject =@sub ,@body = @mailbody";
            //using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.DBMail))
            //{
            //    SqlCommand command = conn.CreateCommand();
            //    command.CommandText = recip;
            //    command.Parameters.AddWithValue("@Email", "lsi_pe1system@rist.local");
            //    command.Parameters.AddWithValue("@name", "RIST");
            //    command.Parameters.AddWithValue("@sub", "ใบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง และความพร้อมก่อนการเกิดเหตุฉุกเฉิน");
            //    command.Parameters.AddWithValue("@mailbody", "http://10.29.1.86/FECS/Report/WebForm_ReportCheckSheet");
            //    conn.Open();
            //    command.ExecuteNonQuery();
            //    conn.Close();
            //}


            
               string mailbody = "TO: Fire Prevention Sub-committee \n You have fire controller report waiting for you approve. \n Please Check your remain data follow this \n Link: http://10.29.1.86/FECS/Report_Committee?CheckSheetID=" + Request.QueryString["CheckSheetID"].ToString()+ "\n Thank you";

            using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.DBConnect))
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

            Session["Day"] = DateTime.Now.ToString("yyyy-MM");

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

                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.DBConnect))
                {
                    DataTable checkmail = new DataTable();
                    conn.Open();

                    SqlCommand com = conn.CreateCommand();
                    com.CommandText = ("SELECT Controller.Name,Committee.Email,Committee.Name FROM Controller INNER JOIN Place ON Controller.ID = Place.ControllerID INNER JOIN Committee ON Committee.ID = Place.CommitteeID WHERE Controller.ID='" + Session["myLoginID"].ToString() + "'");
                    SqlDataAdapter check = new SqlDataAdapter(com);
                    check.Fill(checkmail);
                    

                    SqlCommand command = conn.CreateCommand();
                    command.CommandText = "EXEC msdb.dbo.sp_send_dbmail @recipients = @Email, @profile_name = @name , @subject =@sub , @body = @mailbody";
                    command.Parameters.AddWithValue("@Email", checkmail.Rows[0][1].ToString());
                    command.Parameters.AddWithValue("@name", "Safety");
                    command.Parameters.AddWithValue("@sub", "ใบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง และความพร้อมก่อนการเกิดเหตุฉุกเฉิน");
                    command.Parameters.AddWithValue("@mailbody", mailbody);

                    command.ExecuteNonQuery();

                    conn.Close();

                }

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Send E-Mail Success !!');", true);
            }

            //using (MailMessage mm = new MailMessage("scanprint1@gmail.com", "aun_lb@hotmail.com"))
            //{
            //    mm.Subject = "ใบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง และความพร้อมก่อนการเกิดเหตุฉุกเฉิน";
            //    mm.Body = "กรุณายืนยัน  ใบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง" +
            //              "\nรหัสพนักงาน  " + Session["U_ID"].ToString() + " :: "+ Session["U_Name"].ToString() + "\n"+ 
            //              "\nคลิกลิงค์ด้านล่าง>>>\n"+
            //              "http://10.29.1.86/FECS/Report/WebForm_ReportCheckSheet".Replace("\n",Environment.NewLine);

            //    mm.IsBodyHtml = false;
            //    SmtpClient smtp = new SmtpClient();
            //    smtp.Host = "smtp.gmail.com";
            //    smtp.EnableSsl = true;
            //    NetworkCredential NetworkCred = new NetworkCredential("scanprint1@gmail.com", "0891101026");
            //    smtp.UseDefaultCredentials = true;
            //    smtp.Credentials = NetworkCred;
            //    smtp.Port = 587;
            //    smtp.Send(mm);
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Success !!');", true);
            //}
        }

    }
}

    
