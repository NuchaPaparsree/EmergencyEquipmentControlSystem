<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Manual.aspx.cs" Inherits="MyProject.WebForm_Manual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="align-center">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="Img/health-safety-hero.jpg" alt="Los Angeles" style="width: 100%;">
                </div>
                <div class="item">
                    <img src="Img/Document.png" style="width: 100%;">
                </div>
                <div class="item">
                    <img src="Img/PreventingSuicideBG.jpg" alt="New york" style="width: 100%;">
                </div>
            </div>
        </div>
    </div>
    <br />  

    <section class=" glyphicon-object-align-center">
        <div class="text-center">
            <h2>วิธีใช้อุปกรณ์ดับเพลิง  DIRECTION</h2>
        </div>
    </section>
    

    <div class="container">
        <div class="col-sm-6">
            <div class="thumbnail clearfix">
                <br />
                <img src="Img/FireExtinguisher.png">
                <div class="caption" align="center">
                    <h3>ถังดับเพลิง</h3>
                    <p>FIRE EXTINGUISHER</p>
                </div>
            </div>
      </div>


            <div class="col-sm-6">
        <div class="thumbnail clearfix">
            <img src="Img/FireHose.png"><div style="margin-left: 50px"></div>
            <div class="caption" align="center">
                <h3>สายฉีดน้ำดับเพลิง</h3>
                <p>FIRE HOUSE</p>
            </div>
        </div>
 
   </div>    

</asp:Content>
