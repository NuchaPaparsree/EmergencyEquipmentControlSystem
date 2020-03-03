using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject
{
    public partial class WebForm_LoginCommon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] strs = Request["ReturnUrl"].Split('/');

            string returnUrl = Request.QueryString["ReturnUrl"];
            Session["returnUrl"] = returnUrl;

            if (strs[1] == "PageAdmin")
            { 
                Response.Redirect(@"WebForm_Login.aspx" + "?ReturnUrl=" + Server.UrlEncode(returnUrl));
            }
            else if (strs[1] == "PageUser")
            {
                Response.Redirect(@"WebForm_LoginMobile.aspx" + "?ReturnUrl=" + Server.UrlEncode(returnUrl));
            }

            else if (strs[1] == "Report")
            {
                Response.Redirect(@"WebForm_Login.aspx" + "?ReturnUrl=" + Server.UrlEncode(returnUrl));
            }

        }
    }
}