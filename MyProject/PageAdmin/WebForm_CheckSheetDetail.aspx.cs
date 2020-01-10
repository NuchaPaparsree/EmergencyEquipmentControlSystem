using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MyProject.PageAdmin
{
    public partial class WebForm_CheckSheetDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["ID"] = Request.QueryString["ID"];

            //string data = (("SELECT [Item].[ID],[Item].[Code],[ItemType].[Name],[ItemSubType].[SubType] FROM [ItemType] LEFT JOIN [ItemSubType] ON (ItemType.ID = ItemSubType.ItemTypeID ) LEFT JOIN [Item] ON (ItemSubType.ID = Item.ItemSubTypeID) WHERE ([Item].[ID] = '" + Session["ID"] + "')")).ToString();

            //string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;

            //using (SqlConnection con = new SqlConnection(contr))
            //{
            //    con.Open();
            //    using (SqlCommand Cmd = new SqlCommand(data, con))
            //    {
            //        SqlDataReader sba;

            //        sba = Cmd.ExecuteReader();
            //        sba.Read();
            //        Label1.Text = sba["ItemID"].ToString();
            //        Label2.Text = sba["Code"].ToString();
            //        Label3.Text = sba["Name"].ToString();
            //        Label4.Text = sba["SubType"].ToString();
            //    }
            //}

        }

        protected void Button1_Click(object sender, EventArgs e)
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
            SqlCommand cmd = new SqlCommand("Update CheckSheetDetail set Checked=" + markstatus + " where ID = " + ID  , con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            Label5.Text = "Data Has Been Saved Successfully";
            con.Close();
        }

    }
}