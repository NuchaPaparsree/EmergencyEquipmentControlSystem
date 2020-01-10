using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;
using ZXing.Common;

namespace MyProject.Report
{
    public partial class WebForm_PrintQR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            string path = Server.MapPath("../images/QRImage.jpg");
            if (System.IO.File.Exists(path))
            {
                System.IO.FileInfo fi = new System.IO.FileInfo(path);
                fi.Delete();
            }

            string id;
            id = "http://10.29.1.86/FECS/PageUser/WFCSD?ItemID=" + Request.QueryString["itemid"].ToString();

            GenerateCode(id);
            }
        }

        //// Generate QRCode
        private void GenerateCode(string name)
        {
            var barcodeWriter = new BarcodeWriter
            {
                Format = ZXing.BarcodeFormat.QR_CODE,
                Options = new EncodingOptions
                {
                    Height = 100,
                    Width = 100,
                    Margin = 1
                }
            };
            var result = barcodeWriter.Write(name);

            string path = Server.MapPath("../images/QRImage.jpg");

            var barcodeBitmap = new Bitmap(result);
            using (MemoryStream memory = new MemoryStream())
            {
                using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.ReadWrite))
                {
                    barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                    byte[] bytes = memory.ToArray();
                    fs.Write(bytes, 0, bytes.Length);
                }
            }

            DataTable dt = new DataTable();
            dt.TableName = "DataTable1";
            dt.WriteXmlSchema(Server.MapPath("../DataSet_PrintQR.xsd"));
            dt.Clear();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Equipment");
            dt.Columns.Add("Code");
            dt.Columns.Add("SubType");
            dt.Columns.Add("Image", typeof(byte[]));

            DataView dv;
            dv = (DataView)ItemDataSource.Select(DataSourceSelectArguments.Empty);

            object[] o = { dv.Table.Rows[0][0], dv.Table.Rows[0][1], dv.Table.Rows[0][2], dv.Table.Rows[0][3], dv.Table.Rows[0][4], GetByteArray(path) };
            dt.Rows.Add(o);


            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource _rsource = new ReportDataSource("DataSet1", dt);
            ReportViewer1.LocalReport.DataSources.Add(_rsource);
            ReportViewer1.LocalReport.Refresh();

        }

        private byte[] GetByteArray(String strFileName)
        {
            System.IO.FileStream fs = new System.IO.FileStream(strFileName, System.IO.FileMode.Open);
            // initialise the binary reader from file streamobject
            System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
            // define the byte array of filelength

            byte[] imgbyte = new byte[fs.Length + 1];
            // read the bytes from the binary reader

            imgbyte = br.ReadBytes(Convert.ToInt32((fs.Length)));
            // add the image in bytearray

            br.Close();
            // close the binary reader

            fs.Close();
            // close the file stream
            return imgbyte;
        }
    }

}