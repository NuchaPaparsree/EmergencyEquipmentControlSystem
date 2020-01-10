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
    public partial class SiteMySystem : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            DataTable dt = new DataTable();

            //////////////Find UserCommittee /////////////////////
            SqlCommand query = new SqlCommand("SELECT * FROM [Controller] WHERE ID = '"+Session["myLoginID"] +"' ", con);
            SqlDataAdapter da = new SqlDataAdapter(query);
            da.Fill(dt);

            if (Session["myLoginID"] == null)
            {
                Response.Redirect("~/WebForm_Login.aspx");
            }
            else if (dt.Rows.Count != 0 && Session["myLoginID"].ToString() != "008452")
            {
                MVCheckUser.SetActiveView(Vuser);

                // Alway Update Logon State... (Every time navigate Page Refresh)
                if (Session["myLoginUser"] != null)
                {
                    MultiViewLogState.SetActiveView(ViewLoggedIn);
                    string lineOfText = (string)Session["myLoginUser"];
                    string[] wordArray = lineOfText.Split(' ');
                    this.lblUserName.Text = wordArray[0];
                }
                else
                {
                    this.lblUserName.Text = "";
                    this.MultiViewLogState.SetActiveView(ViewAnonymous);
                }
            }
            else
            {
                MVCheckUser.SetActiveView(Vadmin);
                // Alway Update Logon State... (Every time navigate Page Refresh)
                if (Session["myLoginUser"] != null)
                {
                    MultiViewLogState.SetActiveView(ViewLoggedIn);
                    string lineOfText = (string)Session["myLoginUser"];
                    string[] wordArray = lineOfText.Split(' ');
                    this.lblUserName.Text = wordArray[0];
                }
                else
                {
                    this.lblUserName.Text = "";
                    this.MultiViewLogState.SetActiveView(ViewAnonymous);
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm_Login.aspx");
            //Response.Redirect("Default.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("myLoginID");
            Session.Remove("myLoginUser");

            this.lblUserName.Text = "";
            this.MultiViewLogState.SetActiveView(ViewAnonymous);

            FormsAuthentication.SignOut();

            Response.Redirect("~/WebForm_Login.aspx", true);
        }
    }
}