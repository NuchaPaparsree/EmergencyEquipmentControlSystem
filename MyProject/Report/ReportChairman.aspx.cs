using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.Report
{
    public partial class ReportChairman : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Approve_Click(object sender, EventArgs e)
        {


            var conn = new SqlConnection(Properties.Settings.Default.DBConnect);
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = "UPDATE  CheckSheet SET ChairmanID=@ChairmanID, ApproveDate3= GETDATE() WHERE CheckSheet.ID = '" + Request.QueryString["CheckSheetID"].ToString() + "'";

                cmd.Parameters.AddWithValue("@ChairmanID", Session["myLoginID"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('APPROVE SUCCESS');window.location = 'WebForm_ReportChairman.aspx';</script>");
            }
        }
    }
}