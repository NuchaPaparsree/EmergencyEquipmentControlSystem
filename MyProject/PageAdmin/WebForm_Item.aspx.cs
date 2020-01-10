using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.DataControlField;
namespace MyProject.PageAdmin
{
    public partial class WebForm_Item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#detailModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = 0;
            GridView1.DataBind();
        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {
            DropDownList2.Items.Insert(0, new ListItem("ALL", "%"));
        }

        protected void DropDownList3_DataBound(object sender, EventArgs e)
        {
            DropDownList3.Items.Insert(0, new ListItem("ALL", "%"));
        }

        protected void DropDownList4_DataBound(object sender, EventArgs e)
        {
            DropDownList4.Items.Insert(0, new ListItem("ALL", "%"));
        }

        protected void DropDownList5_DataBound(object sender, EventArgs e)
        {
            DropDownList5.Items.Insert(0, new ListItem("ALL", "%"));
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "printqr")
            {
                string item_id;
                item_id = e.CommandArgument.ToString();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Redirect", "window.open('../Report/WebForm_PrintQR.aspx?itemid=" + item_id + "','_blank')", true);
               //ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "alertMessage", "alert('Test')", true);
                //Response.Write("window.open('WebForm_PrintQR.aspx?itemid=" + item_id + "','_blank')");
            }
        }
    }
}