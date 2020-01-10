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
    public partial class WebForm_CheckSheetDetail2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblControllerID.Text = "000020";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            SqlCommand cmd = new SqlCommand("CheckSheet_Create", con);
            cmd.Parameters.Add("@ControllerID", SqlDbType.VarChar).Value = lblControllerID.Text;
            cmd.Parameters.Add("@ItemID", SqlDbType.SmallInt).Value = 33;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox status = (row.Cells[3].FindControl("CheckBox1") as CheckBox);
                int ID = Convert.ToInt32(row.Cells[0].Text);
                if (status.Checked)
                {
                    updaterow(ID, 1);
                }
                else
                {
                    updaterow(ID, 0);

                }
            }


        }

        private void updaterow(int ID, int markstatus)
        {
            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            //SqlCommand cmd = new SqlCommand("Update CheckSheetDetail set Checked=0", con);
            SqlCommand cmd = new SqlCommand("Update CheckSheetDetail set Checked=" + markstatus + " where ID = " + ID, con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            Label5.Text = "Data Has Been Saved Successfully";
            con.Close();
        }

    }
}