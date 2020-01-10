using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.PageUser
{
    public partial class WebForm_DashBoardMobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["myLoginID"] + " " + Session["myLoginUser"] + " " + Session["PlaceID"];
            string lineOfText = (string)Session["myLoginUser"];
            string[] wordArray = lineOfText.Split(' ');
            this.Label1.Text = wordArray[0];

            DataView dv;
            dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            Label8.Text = System.Convert.ToString(dv.Table.Rows[0][0]);

            dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            Label5.Text = System.Convert.ToString(dv.Table.Rows[0][0]);

            dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            Label4.Text = System.Convert.ToString(dv.Table.Rows[0][0]);

            dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            Label10.Text = System.Convert.ToString(dv.Table.Rows[0][0]);
        }
    }
}