using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MyProject
{
    public partial class DashBoardMain : System.Web.UI.Page
    {
        String c_query = "";
        String constr = "";
        SqlCommand c_cmd;
        SqlConnection c_con;

        public double c_avgPeople = 0;
        public double c_avgArea = 0;
        public double c_avgItem = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDataCount("");
        }

        public void connectionXPrim()
        {
                constr = ConfigurationManager.ConnectionStrings["xPimConnectionString1"].ToString();
                //'constr = "Data Source = 10.28.33.11;Initial Catalog=TestGod;User ID=sa;Password=p@$$w0rd"
                c_con = new SqlConnection(constr);
                c_con.Open();
        }

        public void LoadDataCount(String DateSelect)
        {
            if (DateSelect == "")
            {
                DateSelect = DateTime.Now.ToString("yyyy/MM");
            }
            String DateStart = DateSelect;
            String DateEnd = "";
            String[] StrDate = DateStart.Split('/');
            int EndDateOfMount = DateTime.DaysInMonth(Int32.Parse(StrDate[0]), Int32.Parse(StrDate[1]));

            DateStart = DateSelect + "/01";
            DateEnd = DateSelect + "/" + EndDateOfMount.ToString();

            connectionXPrim();
            SqlDataReader dr;
            String Query;
            //---------------------------------------------------------------------------------
            Query = "SELECT (SELECT COUNT(DISTINCT Building) AS Expr1 FROM Place) AS BuildingAll, (SELECT COUNT(DISTINCT Area) AS Expr1 FROM Place AS Place_1) AS AreaAll, (SELECT COUNT(ID) AS Expr1 FROM Controller) AS ControllerAll, (SELECT COUNT(Item.ID) AS Expr1 FROM Item LEFT OUTER JOIN ItemSubType ON ItemSubType.ID = Item.ItemSubTypeID LEFT OUTER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID) AS AllEquipment, (SELECT COUNT(Item_3.ID) AS Expr1 FROM Item AS Item_3 LEFT OUTER JOIN ItemSubType AS ItemSubType_3 ON ItemSubType_3.ID = Item_3.ItemSubTypeID LEFT OUTER JOIN ItemType AS ItemType_3 ON ItemType_3.ID = ItemSubType_3.ItemTypeID WHERE (ItemType_3.Name = 'ถังดับเพลิง')) AS fireEx, (SELECT COUNT(Item_2.ID) AS Expr1 FROM Item AS Item_2 LEFT OUTER JOIN ItemSubType AS ItemSubType_2 ON ItemSubType_2.ID = Item_2.ItemSubTypeID LEFT OUTER JOIN ItemType AS ItemType_2 ON ItemType_2.ID = ItemSubType_2.ItemTypeID WHERE (ItemType_2.Name = 'กริ่งฉุกเฉิน')) AS Bell, (SELECT COUNT(Item_1.ID) AS Expr1 FROM Item AS Item_1 LEFT OUTER JOIN ItemSubType AS ItemSubType_1 ON ItemSubType_1.ID = Item_1.ItemSubTypeID LEFT OUTER JOIN ItemType AS ItemType_1 ON ItemType_1.ID = ItemSubType_1.ItemTypeID WHERE (ItemType_1.Name = 'ตู้เก็บสายฉีดน้ำดับเพลิง')) AS FireHose, (SELECT COUNT(DISTINCT P.Area) AS Expr1 FROM Place AS P INNER JOIN Item AS I ON P.ID = I.PlaceID INNER JOIN CheckSheetDetail AS CSD ON I.ID = CSD.ItemID) AS Area, (SELECT COUNT(DISTINCT I.ID) AS Expr1 FROM Item AS I INNER JOIN CheckSheetDetail AS CSD ON I.ID = CSD.ItemID) AS item, (SELECT COUNT(DISTINCT CT.ID) AS Expr1 FROM Controller AS CT INNER JOIN CheckSheet AS CS ON CT.ID = CS.ControllerID INNER JOIN CheckSheetDetail AS CSD ON CS.ID = CSD.CheckSheetID) AS Controller";
            c_cmd = new SqlCommand(Query, c_con);
            dr = c_cmd.ExecuteReader();




            while (dr.Read())
            {
                lblCountBuilding.Text = dr["BuildingAll"].ToString() + " ";
                lblCountPeople.Text = dr["ControllerAll"].ToString() + " ";
                lblCountArea.Text = dr["AreaAll"].ToString() + " "; 
                lblCountEQP.Text = dr["AllEquipment"].ToString() + " ";
                FireEx.Text = dr["fireEx"].ToString() + " ";
                Bell.Text = dr["Bell"].ToString() + " ";
                firehose.Text = dr["FireHose"].ToString() + " ";

                lblAVGpeople.Text = dr["Controller"].ToString() + "/" + dr["ControllerAll"].ToString();
                c_avgPeople = double.Parse(((double.Parse(dr["Controller"].ToString()) * 100) / double.Parse(dr["ControllerAll"].ToString())).ToString("000.0"));

                lblAVGarea.Text = dr["Area"].ToString() + "/" + dr["AreaAll"].ToString();
                c_avgArea = double.Parse(((double.Parse(dr["Area"].ToString()) * 100) / double.Parse(dr["AreaAll"].ToString())).ToString("000.0"));

                lblAVGitem.Text = dr["item"].ToString() + "/" + dr["AllEquipment"].ToString();
                c_avgItem = double.Parse(((float.Parse(dr["item"].ToString()) * 100) / double.Parse(dr["AllEquipment"].ToString())).ToString("000.0"));
                //c_avgItem = 91.2;
            }
            dr.Close();
            //---------------------------------------------------------------------------------

            //Query = "SELECT CT.[Name] FROM [FECS].[dbo].[Controller] AS CT INNER JOIN[FECS].[dbo].[CheckSheet] AS CS ON CT.id = cs.ControllerID INNER JOIN[FECS].[dbo].[CheckSheetDetail] AS CSD ON CS.ID = CSD.CheckSheetID "+
            //        "group by ct.Name";
            //c_cmd = new SqlCommand(Query, c_con);
            //dr = c_cmd.ExecuteReader();
            //while (dr.Read())
            //{
            //    lblCountPeople.Text = dr["People"].ToString();
            //}
            //dr.Close();
            //---------------------------------------------------------------------------------

            c_con.Close();
        }

    }
}