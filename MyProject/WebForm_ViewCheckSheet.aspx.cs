using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class WebForm_ViewCheckSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
  
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    DataRowView dr = (DataRowView)e.Row.DataItem;
                    string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Picture"]);
                    (e.Row.FindControl("ImagePreview") as Image).ImageUrl = imageUrl;
                }
                catch (Exception ex)
                {
                }

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}