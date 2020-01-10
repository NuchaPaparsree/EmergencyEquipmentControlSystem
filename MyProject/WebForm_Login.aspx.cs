using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class WebFormLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCondUserName.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (this.txtCondUserName.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรุณากรอก UserID !!');", true);
            }

            else if (this.txtCondPassword.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรุณากรอก Password !!');", true);
            }

            else
            {
                DataView dv;
                dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                DataView dvControler;
                dvControler = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

                DataView dvManager;
                dvManager = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

                if (dv.Count != 0)
                {
                    Session["myLoginID"] = System.Convert.ToString(dv.Table.Rows[0][0]);
                    Session["myLoginUser"] = System.Convert.ToString(dv.Table.Rows[0][1]);
                    Session["LevelUser"] = 1;
                    Session.Timeout = 20;

                    // Web System Allow
                    FormsAuthentication.SetAuthCookie("MyProjectSystemAdmin", false);

                    // Redirect to Wish Page Before Login
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (returnUrl != null)
                        Response.Redirect(returnUrl);
                    else
                        // no return URL specified so lets kick him to home page
                        Response.Redirect("~/WebForm_HomePage.aspx");
                }

                else if (dvControler.Count != 0)
                {
                    Session["myLoginID"] = System.Convert.ToString(dvControler.Table.Rows[0][0]);
                    Session["myLoginUser"] = System.Convert.ToString(dvControler.Table.Rows[0][1]);
                    Session["LevelUser"] = 0;
                    Session.Timeout = 20;

                    // Web System Allow
                    FormsAuthentication.SetAuthCookie("MyProjectSystemAdmin", false);

                    // Redirect to Wish Page Before Login
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (returnUrl != null)
                        Response.Redirect(returnUrl);
                    else
                        // no return URL specified so lets kick him to home page
                        Response.Redirect("~/WebForm_HomePage.aspx");
                }

                else if (dvManager.Count != 0)
                {
                    Session["myLoginID"] = System.Convert.ToString(dvManager.Table.Rows[0][0]);
                    Session["myLoginUser"] = System.Convert.ToString(dvManager.Table.Rows[0][1]);
                    Session["LevelUser"] = 1;
                    Session.Timeout = 20;

                    // Web System Allow
                    FormsAuthentication.SetAuthCookie("MyProjectSystemAdmin", false);

                    // Redirect to Wish Page Before Login
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (returnUrl != null)
                        Response.Redirect(returnUrl);
                    else
                        // no return URL specified so lets kick him to home page
                        Response.Redirect("~/WebForm_HomePage.aspx");
                }

                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Password ไม่ถูกต้อง !!');", true);
                }
            }
        }

        protected void txtCondUserName_TextChanged(object sender, EventArgs e)
        {
            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            DataTable dt = new DataTable();

            SqlCommand query = new SqlCommand("select 1 from Controller where ID = '" + txtCondUserName.Text + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(query);
            da.Fill(dt);

            DataTable dt1 = new DataTable();
            SqlCommand query1 = new SqlCommand("select 1 from Committee where ID = '" + txtCondUserName.Text + "'", con);

            SqlDataAdapter da1 = new SqlDataAdapter(query1);
            da1.Fill(dt1);

            DataTable dt2 = new DataTable();
            SqlCommand query2 = new SqlCommand("select 1 from Manager where ID = '" + txtCondUserName.Text + "'", con);

            SqlDataAdapter da2 = new SqlDataAdapter(query2);
            da2.Fill(dt2);

            if (dt.Rows.Count > 0)
            {
                txtCondPassword.Focus();
            }

            else if (dt1.Rows.Count > 0)
            {
                txtCondPassword.Focus();
            }

            else if (dt2.Rows.Count > 0)
            {
                txtCondPassword.Focus();
            }

            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('UserID ไม่ถูกต้อง !!');", true);
            }
        }
    }
}