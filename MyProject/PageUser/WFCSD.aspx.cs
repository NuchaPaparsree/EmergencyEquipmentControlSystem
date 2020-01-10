using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyProject.PageUser
{
    public partial class WFCSD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["myLoginID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("../PageUser/WFCSD.aspx", true);
            }

            if (Session["PlaceID"] != null)
            {
                lblPlaceID.Text = Session["PlaceID"].ToString();
                lblControllerID.Text = Session["myLoginID"].ToString();
                DataView dv;
                dv = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
                lblPlaceName.Text = System.Convert.ToString(dv.Table.Rows[0][0]);

            }

            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(contr);
                DataTable dt = new DataTable();

                //////////////Find CheckSheetID /////////////////////
                SqlCommand query = new SqlCommand("select distinct CheckSheet.ID " +
                "from CheckSheet " +
                "where CheckSheet.ControllerID = '" + lblControllerID.Text + "' " +
                "and CheckSheet.PlaceID = '" + lblPlaceID.Text + "' " +
                "and CheckSheet.YearMonth = '" + DateTime.Now.ToString("yyyy-MM") + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(query);
                da.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    try
                    {
                        Session["CheckSheetID"] = dt.Rows[0]["ID"];
                    }
                    catch { }
                }

                Session["ItemID"] = Request.QueryString["ItemID"];
                Session["YearMonth"] = DateTime.Now.ToString("yyyy-MM");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Request.QueryString["ItemID"]) is null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('กรุณาเเสกน QR Code สำหรับตรวจสอบอุปกรณ์ !!');", true);
            }
            else
            {
                string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
                SqlConnection con = new SqlConnection(contr);
                DataTable dt = new DataTable();

                //    //////////////Find CheckSheetID /////////////////////
                //    SqlCommand query = new SqlCommand("select distinct CheckSheet.ID " +
                //    ", CheckSheet.PlaceID, CheckSheet.YearMonth  from CheckSheet " +
                //    "where CheckSheet.ControllerID = '" + lblControllerID.Text + "' " +
                //    "and CheckSheet.PlaceID = '" + lblPlaceID.Text + "' " +
                //    "and CheckSheet.YearMonth = '" + DateTime.Now.ToString("yyyy-MM") + "'", con);

                //    SqlDataAdapter da = new SqlDataAdapter(query);
                //    da.Fill(dt);

                //    if (dt.Rows.Count > 0)
                //    {
                //        if (GridViewNoItem.Rows.Count == 0)
                //        {
                //            Session["CheckSheetID"] = dt.Rows[0]["ID"];
                //            //////////////////////Create Check Sheet  Old//////////////////////////////////////
                //            DataTable dtCI = new DataTable();
                //            //////////////Find CheckID Not In ItemType 1,2,5 /////////////////////
                //            SqlCommand queryCI = new SqlCommand("SELECT CheckItem.ID AS CheckID,CheckItem.ItemTypeID, Item.ID  " +
                //            "FROM [dbo].[CheckItem] " +
                //            "inner join ItemType on ItemType.ID = CheckItem.ItemTypeID " +
                //            "inner join ItemSubType on ItemSubType.ItemTypeID = ItemType.ID " +
                //            "inner join Item on Item.ItemSubTypeID = ItemSubType.ID " +
                //            "where [dbo].[CheckItem].ItemTypeID not in ('1', '2', '5') order by CheckItem.ItemTypeID", con);

                //            SqlDataAdapter daCI = new SqlDataAdapter(queryCI);
                //            daCI.Fill(dtCI);

                //            for (int i = 0; i < dtCI.Rows.Count; i++)
                //            {
                //                SqlCommand cmd = new SqlCommand("INSERT INTO CheckSheetDetail (ItemID,CheckItemID,CheckSheetID,Comment,Picture,OK,NG,Date) VALUES " +
                //                   "('" + dtCI.Rows[i]["ID"] + "','" + dtCI.Rows[i]["CheckID"] + "','" + dt.Rows[0]["ID"] + "',NULL,NULL,0,0,NULL) ", con);

                //                con.Open();
                //                cmd.ExecuteNonQuery();
                //                con.Close();
                //            }
                //        }
                //    }
                //    else
                //    {
                //        DataTable dtNS = new DataTable();
                //        //////////////Find ItemID Not In ItemType 1,2,5 /////////////////////
                //        SqlCommand queryNS = new SqlCommand(
                //        "SELECT distinct Item.ID " +
                //        "FROM [dbo].[CheckItem] " +
                //        "inner join ItemType on ItemType.ID = CheckItem.ItemTypeID " +
                //        "inner join ItemSubType on ItemSubType.ItemTypeID = ItemType.ID " +
                //        "inner join Item on Item.ItemSubTypeID = ItemSubType.ID " +
                //        "where [dbo].[CheckItem].ItemTypeID not in ('1', '2', '5') order by item.ID asc", con);

                //        SqlDataAdapter daNS = new SqlDataAdapter(queryNS);
                //        daNS.Fill(dtNS);

                //////////////////////Create Check Sheet New//////////////////////////////////////
                SqlCommand cmdNS = new SqlCommand("CheckSheet_Create", con);
                cmdNS.Parameters.Add("@ControllerID", SqlDbType.VarChar).Value = lblControllerID.Text;
                cmdNS.Parameters.Add("@PlaceID", SqlDbType.TinyInt).Value = lblPlaceID.Text;
                cmdNS.Parameters.Add("@ItemID", SqlDbType.SmallInt).Value = Request.QueryString["ItemID"];
                cmdNS.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmdNS.ExecuteNonQuery();
                con.Close();

                //////////////////////Create Check Sheet  Old//////////////////////////////////////
                DataTable dtID = new DataTable();
                //////////////Find CheckSheetID /////////////////////
                SqlCommand queryID = new SqlCommand("select distinct CheckSheet.ID " +
                ", CheckSheet.PlaceID, CheckSheet.YearMonth  from CheckSheet " +
                "where CheckSheet.ControllerID = '" + lblControllerID.Text + "' " +
                "and CheckSheet.PlaceID = '" + lblPlaceID.Text + "' " +
                "and CheckSheet.YearMonth = '" + DateTime.Now.ToString("yyyy-MM") + "'", con);

                SqlDataAdapter daID = new SqlDataAdapter(queryID);
                daID.Fill(dtID);


                DataTable dtnoqr = new DataTable();
                SqlCommand Querynoqr = new SqlCommand("SELECT COUNT(ID) as ID FROM CheckSheetDetail where CheckSheetDetail.CheckSheetID = '" + dtID.Rows[0]["ID"] + "' AND CheckSheetDetail.ItemID = 3 ", con);

                SqlDataAdapter danoqr = new SqlDataAdapter(Querynoqr);
                danoqr.Fill(dtnoqr);


                if (dtnoqr.Rows[0]["ID"].ToString() == "0")
                {


                    if (dtID.Rows.Count > 0)
                    {
                        Session["CheckSheetID"] = dtID.Rows[0]["ID"];
                        DataTable dtCI = new DataTable();
                        //////////////Find CheckID Not In ItemType 1,2,5 /////////////////////
                        SqlCommand queryCI = new SqlCommand("SELECT CheckItem.ID AS CheckID,CheckItem.ItemTypeID, Item.ID  " +
                        "FROM [dbo].[CheckItem] " +
                        "inner join ItemType on ItemType.ID = CheckItem.ItemTypeID " +
                        "inner join ItemSubType on ItemSubType.ItemTypeID = ItemType.ID " +
                        "inner join Item on Item.ItemSubTypeID = ItemSubType.ID " +
                        "where [dbo].[CheckItem].ItemTypeID not in ('1', '2', '5') order by CheckItem.ItemTypeID", con);

                        SqlDataAdapter daCI = new SqlDataAdapter(queryCI);
                        daCI.Fill(dtCI);

                        for (int i = 0; i < dtCI.Rows.Count; i++)
                        {
                            SqlCommand cmd = new SqlCommand("INSERT INTO CheckSheetDetail (ItemID,CheckItemID,CheckSheetID,Comment,Picture,OK,NG,Date) VALUES " +
                               "('" + dtCI.Rows[i]["ID"] + "','" + dtCI.Rows[i]["CheckID"] + "','" + dtID.Rows[0]["ID"] + "',NULL,NULL,0,0,NULL) ", con);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    //else
                    //{
                    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Check Sheet ยังไม่ถูกสร้าง กรุณากดปุ่ม Create !!');", true);
                    //}
                }

                //}
                //else
                //{
                //    string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
                //    SqlConnection con = new SqlConnection(contr);
                //    SqlCommand cmd = new SqlCommand("CheckSheet_Create", con);
                //    cmd.Parameters.Add("@ControllerID", SqlDbType.VarChar).Value = lblControllerID.Text;
                //    cmd.Parameters.Add("@PlaceID", SqlDbType.TinyInt).Value = lblPlaceID.Text;
                //    cmd.Parameters.Add("@ItemID", SqlDbType.SmallInt).Value = Request.QueryString["ItemID"];
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    con.Open();
                //    cmd.ExecuteNonQuery();
                //    con.Close();
                //}

                GridView1.DataBind();
                GridView2.DataBind();
                GridViewNoItem.DataBind();

                FormView4.DataBind();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

         
                if (GridViewNoItem.Rows.Count == 0)
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('อุปกรณ์นี้ยังไม่ถูกเช็ค !!');", true);
                }

                else
                {
                    foreach (GridViewRow row in GridViewNoItem.Rows)
                    {
                        RadioButton statusOK = (row.Cells[3].FindControl("RadioButton1") as RadioButton);
                        RadioButton statusNG = (row.Cells[4].FindControl("RadioButton2") as RadioButton);
                        FileUpload imageFile = (row.Cells[5].FindControl("FileUploadCamera") as FileUpload);
                        TextBox Comment = (row.Cells[7].FindControl("TextBoxComment") as TextBox);

                        int ID = Convert.ToInt32(GridViewNoItem.DataKeys[row.RowIndex].Value.ToString());
                    //Convert.ToInt32(row.Cells[0].Text);

                    int checkOK = 0;
                        if (statusOK.Checked)
                        {
                            checkOK = 1;
                        }

                        int checkNG = 0;
                        if (statusNG.Checked)
                        {
                            checkNG = 1;
                        }
                        updaterow(ID, checkOK, checkNG, imageFile, Comment);
                    }

                    GridViewNoItem.DataBind();
                }
           
                if (GridView1.Rows.Count == 0)
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('อุปกรณ์นี้ยังไม่ถูกเช็ค !!');", true);
                }

                else
                {
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                    
                        RadioButton statusOK = (row.Cells[2].FindControl("RadioButton1") as RadioButton);
                        RadioButton statusNG = (row.Cells[3].FindControl("RadioButton2") as RadioButton);
                        FileUpload imageFile = (row.Cells[4].FindControl("FileUploadCamera") as FileUpload);
                        TextBox Comment = (row.Cells[6].FindControl("TextBoxComment") as TextBox);
                    int ID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value.ToString());
                        //Convert.ToInt32(row.Cells[0].Text);
                        int checkOK = 0;


                        if (statusOK.Checked)
                        {
                            checkOK = 1;
                        }

                        int checkNG = 0;
                        if (statusNG.Checked)
                        {
                            checkNG = 1;
                        }
                        updaterow(ID, checkOK, checkNG, imageFile, Comment);
                    }

                    GridView1.DataBind();
                }
            

            FormView3.DataBind();

        }

        private void updaterow(int ID, int markstatusOK, int markstatusNG, FileUpload imageFile,TextBox Comment)
        {
            string filename = Path.GetFileName(imageFile.PostedFile.FileName);
            string contentType = imageFile.PostedFile.ContentType;
            Stream fs = imageFile.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            byte[] bytes = br.ReadBytes((Int32)fs.Length);

            string contr = System.Configuration.ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(contr);
            String query = "Update CheckSheetDetail set OK = @markstatusOK, NG = @markstatusNG, Date = @Date, Comment = @Comment ";

            if (imageFile.HasFile)
                { query = query + ",Picture = @Picture where ID = @ID";}
            else
                { query = query + "where ID = @ID";}

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add("@markstatusOK", SqlDbType.Bit).Value = markstatusOK;
            cmd.Parameters.Add("@markstatusNG", SqlDbType.Bit).Value = markstatusNG;
            cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = DateTime.Now.ToString();
            if (imageFile.HasFile){cmd.Parameters.Add("@Picture", SqlDbType.Image).Value = bytes;}
            cmd.Parameters.Add("@Comment", SqlDbType.VarChar).Value = Comment.Text;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            con.Open();
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('บันทึกข้อมูลเรียบร้อย !!');", true);
            con.Close();
        }


        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
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

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("myLoginID");
            Session.Remove("myLoginUser");

            Session["ItemID"] = null;
            Session["CheckSheetID"] = null;

            GridView1.DataBind();
            GridView2.DataBind();
            GridViewNoItem.DataBind();

            FormsAuthentication.SignOut();
            Response.Redirect("../PageUser/WFCSD.aspx",true);
        }

    }
}