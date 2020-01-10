 <%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_HomePage.aspx.cs" Inherits="MyProject.WebForm_HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/gallery-grid.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">






<img class="img-full" src="Img/PreventingSuicideBG.jpg" style="width: 100%;">


   
 <div class="text-center">  <br />
<h1>อุปกรณ์ดับเพลิง FIRE EQUIPMENT</h1>
    

 <%--<div class="row" style="border:solid 1px black" align="center"  >
    <div class="col-md-3" align="center" style="border:solid 1px black">
      <div class="">--%>

    <div class="tz-gallery container-fliid"  >
     <%-- <div class="row text-center" style="border:solid 1px black" >--%>
        <div class="col-sm-4">
            <a class="lightbox">
            <img src="Img/1 ชนิดผงเคมีแห้ง ถังสีเเดง.png"  /></a>
            <div class='text-center'>
                <small class='text-muted'>Dry Chemical Extinguishers
        <p>CLASS A-B-C </p>
                </small>
            </div>
        </div>

        <div class="col-sm-4">
            <a class="lightbox">
                <img src="Img/2 คาร์บอนไดออกไซด์.png" /></a>
                <div class='text-center'>
                    <small class='text-muted'>Carbon Dioxide Extinguishers
                        <p>CLASS B-C</p>
                    </small>
                </div>
        </div>

        <div class="col-sm-4">
            <a class="lightbox">
                <img src="Img/3 สูตรนำ.jpg"  /></a>
            <div class='text-center'>
                <small class='text-muted'>
                    <p>Water Extinguishers</p>
                    <p>CLASS A</p>
                </small>
            </div>
        </div>
    
    <div class="row text-center"  >
            <div class="col-sm-4">
                <a class="lightbox">
                    <img src="Img/halotron-1-2.jpg" width="200" height="400"></a>
                <div class='text-center'>
                    <small class='text-muted'>
                        <p>Halotron Extinguishers</p>
                        <p>CLASS A-B-C-K</p>
                    </small>
                </div>
            </div>

            <div class="col-sm-4">
                <a class="lightbox">
                    <img src="Img/BF2000.jpg" width="200" height="400">
                </a>
                <div class='text-center'>
                    <small class='text-muted'>
                        <p>BF2000</p>
                        <p>CLASS A-B-C-D</p>
                    </small>
                </div>
            </div>
            <div class="col-sm-4">
                <a class="lightbox">
                    <img src="Img/6 โฟม.png" width="200" height="400"></a>
                <div class='text-center'>
                    <p>
                        <small class='text-muted'>
                            <p>Foam Extinguishers<p/>
                            <p>CLASS A-B</p>
                        </small>
                </div>
            </div>
        </div>
  </div>
 </div>
       
    <script>
        baguetteBox.run('.tz-gallery');
    </script>



    <section class="home-about-area ">
        <div class=" align-center"  >
            <div class="col-md-7 home-about-center ">
                <img class="sm-auto d-block img-fluid" src="Img/a1.png">
            </div>
            <div class="col-sm-5 home-about-right no-padding">
                <br/><br/>
                    <h1>ประเภทของเพลิงไหม้ <br/>
                    </h1>
                <h5>ประเภท A  เพลิงที่ไหม้ที่เกิดจากเชื้อเพลิงของแข็ง เช่น ไม้ ผ้า กระดาษ ปอ นุ่น ยาง พลาสติก<br/>
ประเภท B  เพลิงที่ไหม้ในของเหลวติดไฟและก๊าซติดไฟ เช่น น้ำมัน ก๊าซหุงต้ม จาระบี<br/>
ประเภท C  เพลิงที่ไหม้จากอุปกร์ไฟฟ้า ที่มีกระแสไฟฟ้าไหลอยู่ เช่น ไฟฟ้าลัดวงจร<br/>
ประเภท D  เพลิงไหม้ที่เกิดจากการทำปฏิกิริยาของโลหะ<br/>
ประเภท K   เพลิงไหม้ที่เกิดจากน้ำมันที่ใช้ประกอบอาหาร ไขมันสัตว์<br/>
                </h5>
            </div>
        </div>
    </section>
</asp:Content> 
