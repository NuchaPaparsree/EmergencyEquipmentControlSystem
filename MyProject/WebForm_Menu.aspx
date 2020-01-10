<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Menu.aspx.cs" Inherits="MyProject.WebForm_Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <br /><br /><br /><br />
   <nav class="col-sm-12" id="myScrollspy">
        <ul class="nav" align="center">
        <li><a href="WebForm_Bell" style="font-family: 'Franklin Gothic Medium Cond'; font-size: x-large; color: #336699;">Bell</a><br /></li>
        <li><a href="WebForm_FireHose" style="font-family: 'Franklin Gothic Medium Cond'; font-size: x-large; color: #336699;">Fire Hose</a><br /></li>
        <li><a href="WebForm_FireExtinguisher" style="font-family: 'Franklin Gothic Medium Cond'; font-size: x-large; color: #336699;">Fire Extinguisher</a><br /></li>
        </ul>
    </nav>--%>

    <style>
        body, html {
            height: 100%
        }

        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Amatic SC", sans-serif
        }

        .menu {
            display: none
        }

        .bgimg {
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url("/Img/high.jpg");
            min-height: 100%;
        }

        div.img-resize img {
            width: auto;
            height: auto;
        }

        div.img-resize {
            width: 260px;
            height: 260px;
            overflow: hidden;
            text-align: center;
        }
    </style>
    <header class="bgimg w3-display-container w3-grayscale-min" id="home">
        <div class="w3-display-bottomleft w3-padding">

            <div class="w3-display-middle w3-center">
                <div style="padding-top: 80px;">
                    <div class="w3-container w3-black w3-padding-64 w3-xxlarge">
                        <div class="w3-content"></div>
                        <div class="container">
                            <div class="col-sm-4">
                                <div class="img-resize">
                                    <a target="_blank" href="WebForm_Bell" />
                                    <img src="Img/lo.jpg">
                                </div>
                                <div class='text-center'>
                                    <br />
                                    <br />
                                    <p>Bell</p>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="img-resize">
                                    <a target="_blank" href="WebForm_FireExtinguisher" />
                                    <img src="Img/Amerex_Group_ABE_2.jpg" />
                                </div>
                                <div class='text-center'>
                                    <br />
                                    <br />
                                    <p>FireExtinguisher</p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="img-resize">
                                    <a target="_blank" href="WebForm_FireHose" />
                                    <img src="Img/fire-hose.jpg" />
                                </div>
                                <div class='text-center'>
                                    <br />
                                    <br />
                                    <p>FireHose</p></div>
                                  <div style="padding-bottom: 80px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
</asp:Content>
