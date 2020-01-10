<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm_DashBoardMobile.aspx.cs" Inherits="MyProject.PageUser.WebForm_DashBoardMobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="~/MyStyles/bootstrap.css" rel="stylesheet" />
    <link href="~/MyBootStrap/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <style>
    .BackgroundLayout {
        position:relative;
        height: 600px;
        width: 1000px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        text-align:center;
        /*border-color:blue;
        border-width:5px;
        border-style:solid;*/
    }

    .GridBox{
        /*border: 1px solid black;*/
        /*background-color: lightblue;*/
        padding-right: 12.5px;
        padding-left: 12.5px;
        margin-bottom:25px;
    }

    .GridBoxBody{
        /*border: 1px solid black;*/
        /*background-color: lightblue;*/
        padding: 15px;
        border-radius: 3px;
        background-color:#FFFFFF;
        width:100%
        /*box-shadow: 0px 0px 5px #c3c3c3;*/
    }

    .row {
        margin-left:12.5px;
        margin-right:12.5px;
    }

    .panel-default {
        margin-left:0px;
        margin-right:0px;
        margin-bottom:0px;
        margin-top:0px;
    }

    .DashboardBox {
        border-radius: 3px;
        height:120px;
        width:100%;
        padding-left:20px;
        padding-right:20px;
        padding-bottom:10px;
        padding-top:10px;
        /*box-shadow: 0px 0px 5px #c3c3c3;*/
    }

    /*.transparent {
      background:#7f7f7f;
      background:rgba(0,0,0,0.9);
    }*/
    .transparent {
      background:#7f7f7f;
      background:rgba(255,255,255,0.5);
    }

    body { 
                background-position: center;
                background-repeat: no-repeat;
                background-attachment:fixed;
                background-size: cover;
                background-image:url('../Img/Background5.jpg');
    }

    .blurred-bg {
                    /*background-position: center;
      background-image: url("Image/RohmBackground-blur2-2.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      background-attachment: fixed;*/
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div id="demo"></div>--%>
        <div id="MainDiv" style="padding-top:20px;">
            <div class="row">
        <%--    col-xl-3 col-lg-3 col-md-6 col-sm-12--%>
            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg">
                    <table style="width:100%;height:100%;">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-users" aria-hidden="true" style="font-size:80px;color:#0d86d5"></i>
                            </td>
                            <td class="text-right">
                                <asp:Label ID="Label1" runat="server" Font-Size="25px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                <asp:Label ID="Label7" runat="server" Text="Controller" Font-Size="20px" ForeColor="#808080"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg" <%--style="background-color:#FFFFFF"--%>>
                    <table style="width:100%;height:100%;">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-file" aria-hidden="true" style="font-size:80px;color:#66cb49"></i>
                            </td>
                            <td class="text-right">
                                <asp:Label ID="Label10" runat="server" Font-Size="25px"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text="/" Font-Size="25px"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Font-Size="25px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                <asp:Label ID="Label2" runat="server" Text="Report" Font-Size="20px" ForeColor="#808080"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT COUNT (DISTINCT  ID) FROM  [CheckSheet] WHERE ControllerID = @ControllerID AND PlaceID = @PlaceID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
                                        <asp:SessionParameter Name="PlaceID" SessionField="PlaceID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT COUNT(ID) FROM  [Place] WHERE ControllerID = @ControllerID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg">
                    <table style="width:100%;height:100%;">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-fire-extinguisher" aria-hidden="true" style="font-size:80px;color:#ff6a00"></i>
                            </td>
                            <td class="text-right">
                                <asp:Label ID="Label8" runat="server" Font-Size="25px"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="/" Font-Size="25px"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Font-Size="25px"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT COUNT (DISTINCT  CheckSheetID) FROM  [ViewCheckSheetThisMonth] WHERE ControllerID = @ControllerID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT COUNT(ID) FROM  [Item] WHERE PlaceID = @PlaceID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="PlaceID" SessionField="PlaceID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                <asp:Label ID="Label9" runat="server" Text="Equipment" Font-Size="20px" ForeColor="#808080"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
 
        <%--<div class="row">
          <div class="col-lg-9 col-md-12 col-sm-12 GridBox" >
            <div class="GridBoxBody transparent blurred-bg" style="height:760px">  
               <div class="panel-body">
               </div>
           </div>
          </div>
          <div class="col-lg-3 col-md-12 col-sm-12 GridBox" style="height:100%">
            <div class="GridBoxBody transparent blurred-bg" style="min-height:300px;height:435px">
              <div style="overflow-y : auto;height:100%;">

              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-12 col-sm-12 GridBox" style="height:100%">
            <div class="GridBoxBody transparent blurred-bg" style="min-height:300px;height:300px">

            </div>
          </div>
          </div>--%>
            </div>
        </div>
        <script>
        x = 0;
        $(document).ready(function(){
            $(window).resize(function(){
                var txt = "";
                txt += " Width: " + window.innerWidth;
                txt += " Height: " + window.innerHeight;
                txt += " outerWidth: " + window.outerWidth;
                txt += " outerHeight: " + window.outerHeight;
                document.getElementById("demo").innerText = txt;

                if (window.innerHeight < 900) {
                    var meta = document.createElement('meta');
                    meta.name = 'viewport';
                    meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0');
                    document.getElementsByTagName('head')[0].appendChild(meta);
                }
                else {
                    var meta = document.createElement('meta');
                    meta.name = 'viewport';
                    meta.setAttribute('content', 'width=1500');
                    document.getElementsByTagName('head')[0].appendChild(meta);
                }
            }).resize();   
        });
</script>
    </form>
</body>
</html>
