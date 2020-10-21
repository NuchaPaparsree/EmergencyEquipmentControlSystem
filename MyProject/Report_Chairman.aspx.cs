using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class Report_Chairman : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void approve_Click(object sender, EventArgs e)
        {
            var conn = new SqlConnection(Properties.Settings.Default.DBConnect);
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = "UPDATE  CheckSheet SET ChairmanID=@ChairmanID, ApproveDate3= GETDATE() WHERE CheckSheet.ID = '" + Request.QueryString["CheckSheetID"].ToString() + "'";

                cmd.Parameters.AddWithValue("@ChairmanID", "007997");
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }

            Response.Redirect("~/Report_Chairman?CheckSheetID=" + Request.QueryString["CheckSheetID"].ToString() + "");

        }
    }
}