using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class WebForm_LoginMobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxUserID.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataView dv;
                dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

                string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(contr);
                DataTable dt = new DataTable();

                int str = Request["ReturnUrl"].Split('=').Count();

                if (str >= 2)
                {
                    string[] ID = Request["ReturnUrl"].Split('=');
                    ////////////// Check Item in Place /////////////////////
                    SqlCommand query = new SqlCommand("select 1 from Item where ID = '" + ID[1] + "' " +
                    "and PlaceID = '" + DropDownList1.Text + "'", con);

                    SqlDataAdapter da = new SqlDataAdapter(query);
                    da.Fill(dt);


                    if (dt.Rows.Count > 0)
                    {
                        //if (dv.Count != 0)
                        try
                        {
                            Session["PlaceID"] = DropDownList1.Text;
                            Session["myLoginID"] = System.Convert.ToString(dv.Table.Rows[0][0]);
                            Session["myLoginUser"] = System.Convert.ToString(dv.Table.Rows[0][1]);
                            Session.Timeout = 60;

                            // Web System Allow
                            FormsAuthentication.SetAuthCookie("MyProjectSystemAdmin", false);

                            // Redirect to Wish Page Before Login
                            string returnUrl = Request.QueryString["ReturnUrl"];
                            if (returnUrl != null)
                                Response.Redirect(returnUrl);
                            else
                                Response.Redirect("~/WebForm_HomePage.aspx");
                        }
                        catch
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Password ไม่ถูกต้อง!!');", true);
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('เลือกสถานที่ไม่ตรงกับอุปกรณ์ กรุณาเลือกสถานที่ใหม่อีกครั้ง !!');", true);
                    }
                }

                else
                {
                    //if (dv.Count != 0)
                    try
                    {
                        Session["PlaceID"] = DropDownList1.Text;
                        Session["myLoginID"] = System.Convert.ToString(dv.Table.Rows[0][0]);
                        Session["myLoginUser"] = System.Convert.ToString(dv.Table.Rows[0][1]);
                        Session.Timeout = 10;

                        // Web System Allow
                        FormsAuthentication.SetAuthCookie("MyProjectSystemAdmin", false);

                        // Redirect to Wish Page Before Login
                        string returnUrl = Request.QueryString["ReturnUrl"];

                        //if (Convert.ToString(Request.QueryString["ItemID"]) is null)
                        //{
                        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรุณาแสกน QR Code สำหรับตรวจสอบอุปกรณ์ !!');", true);

                        //}
                        //else
                        //{
                            if (returnUrl != null)
                            {
                                Response.Redirect(returnUrl);
                            }
                            else
                            {
                                Response.Redirect("~/WebForm_HomePage.aspx");
                            }
                        }

                    //}

                    catch
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Password ไม่ถูกต้อง!!');", true);
                    }
                }
            }
            catch { }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string[] num = Request["ReturnUrl"].Split('?');
            if (num.Count() <= 1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรุณา Scan QR-Code ใหม่อีกครั้ง !!');", true);
            }
            else
            {
                string returnUrl = Request.QueryString["ReturnUrl"];
                string[] strs = Request["ReturnUrl"].Split('=');
                Session["ItemIDLogin"] = strs[1];
                Response.Redirect(@"WebForm_CheckSheetDataView.aspx?ItemID=" + strs[1]);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoardMain.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string[] num = Request["ReturnUrl"].Split('?');
            if (num.Count() <= 1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรุณา Scan QR-Code ใหม่อีกครั้ง !!');", true);
            }
            else { 
            string returnUrl = Request.QueryString["ReturnsUrl"];
            string[] strs = Request["ReturnUrl"].Split('=');
            Session["ItemIDLogin"] = strs[1];
            Response.Redirect(@"WebForm_ChecklistView.aspx?ItemID=" + strs[1]);
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('โปรดล็อกอิน !!');window.location = 'PageUser/WFCSD.aspx';", true);
            TextBoxUserID.Focus();
            //Response.Redirect("/FECS/PageUser/WFCSD.aspx");
        }

        protected void TextBoxUserID_TextChanged(object sender, EventArgs e)
        {
            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            DataTable dt = new DataTable();

            SqlCommand query = new SqlCommand("select 1 from Controller where ID = '" + TextBoxUserID.Text + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(query);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                TextBoxPassword.Focus();
                DropDownList1.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('UserID ไม่ถูกต้อง !!');", true);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรอกพาสเวิด !!');", true);
            TextBoxPassword.Focus();
        }
    }
}