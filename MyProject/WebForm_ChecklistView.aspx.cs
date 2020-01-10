using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class WebForm_ChecklistView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblItemType.Text = Request.QueryString["ItemID"];

            DataView dv;
            dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count > 0)
            {
                lblControllerID.Text = System.Convert.ToString(dv.Table.Rows[0][1]);
                lblControllerName.Text = System.Convert.ToString(dv.Table.Rows[0][4]);
                lblYear.Text = System.Convert.ToString(dv.Table.Rows[0][0]);
                lblItemType.Text = System.Convert.ToString(dv.Table.Rows[0][2]);
                lblCode.Text = System.Convert.ToString(dv.Table.Rows[0][3]);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Item Is No Checked !!');window.location = 'WebForm_LoginMobile.aspx?ReturnUrl=" + Session["returnUrl"] + "?ItemID=" + Request.QueryString["ItemID"] + "';", true);
            }
        }

            protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"WebForm_LoginMobile.aspx" + "?ReturnUrl=" + Session["returnUrl"] + "?ItemID=" +Session["ItemIDLogin"]);
        }
    }
}