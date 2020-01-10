using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.PageAdmin
{
    public partial class WebForm_CheckSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            SqlCommand cmd = new SqlCommand("CheckSheet_Create", con);
            cmd.Parameters.Add("@ControllerID", SqlDbType.VarChar).Value = TextBox1.Text;
            cmd.Parameters.Add("@ItemID", SqlDbType.Int).Value = TextBox2.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/PageAdmin/WebForm_CheckSheetDetail.aspx?ID=" + TextBox1.Text + TextBox2.Text + "");
        }
    }
}