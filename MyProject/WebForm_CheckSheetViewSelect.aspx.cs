using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class WebForm_CheckSheetViewSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["ItemID"] = TextBox1.Text;
            Response.Redirect(@"WebForm_CheckSheetDataView.aspx?ItemID=" + Session["ItemID"]);
        }
    }
}