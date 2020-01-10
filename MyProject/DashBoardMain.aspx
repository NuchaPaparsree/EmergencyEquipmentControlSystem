<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoardMain.aspx.cs" Inherits="MyProject.DashBoardMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--    <link href="~/MyStyles/bootstrap.css" rel="stylesheet" />
    <link href="~/MyBootStrap/bootstrap.min.css" rel="stylesheet" />--%><%--<script src="~/Scripts/jquery-1.10.2.min.js"></script>--%>
    <link href="Scripts/DateTimePicker1/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/DateTimePicker1/jquery-2.1.1.min.js"></script>
    <script src="Scripts/DateTimePicker1/moment.min.js"></script>   
    <script src="Scripts/DateTimePicker1/bootstrap-datetimepicker.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" /> 

    <style>
    .BackgroundLayout {
        position:relative;
        height: 600px;
        width: 900px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        text-align:center;

    }

    .GridBox{
        /*border: 1px solid black;*/
        /*background-color: lightblue;*/
        padding-right: 7.5px;
        padding-left: 7.5px;
        margin-bottom:15px;
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
        margin-left:7.5px;
        margin-right:7.5px;
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

    .transparentBlack {
      background:rgba(0,0,0,0.7);
    }
    .transparent {
      background:#7f7f7f;
      background:rgba(255,255,255,0.5);
    }

    .TransparentContent {
      background:#7f7f7f;
      background:rgba(255,255,255,0.7);
    }

    body { 
                background-position: center;
                background-repeat: no-repeat;
                background-attachment:fixed;
                background-size: cover;
                background-image:url('Img/Background11.jpg');
    }

    .blurred-bg {
                    /*background-position: center;
      background-image: url("Image/RohmBackground-blur2-2.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      background-attachment: fixed;*/
    }
        .auto-style1 {
            width: 100%;
        }
        

        .auto-style4 {
            width: 100%;
            height: 100%;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar <%--navbar-inverse--%> navbar-fixed-top">
        <div id="HeaderDiv" class="transparentBlack" style="height:60px;width:100%;padding:7px;">
            <table class="nav-justified">
                <tr>
                   <td  style="font-size:30px;color:rgba(255,255,255,0.7); width:500px;">
                        <div class="row">
                            <div style="margin-left:20px;"></div>
                            <asp:Label ID="Label10" runat="server" Text=" Emergency Equipment Control" Font-Size="20"></asp:Label>                     
                            <%--<asp:Label ID="Label11" runat="server" Text="ControlSystem" Font-Size="20"></asp:Label>--%>   
                        </div>
                    </td>
                    <td style="width:500px;">
                        <table class="auto-style1" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <%-- DatePicker--%>
                                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" style="width:150px;" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="Expr1">
                                        <asp:ListItem>-- Year --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT SUBSTRING(YearMonth, 1, 4) AS Expr1 FROM CheckSheet"></asp:SqlDataSource>
                                   

                            <%--    <div class='input-group date' id='datetimepicker1'  style="width:180px;">
                                            <input type='text' class="form-control" id="txtDatepicker1" runat="server" placeholder="YYYY/MM"/> <%--เพิ่ม id="myTextBox" runat="server" เพื่อให้ Code Behind มองเห็น
                                            <span class="input-group-addon" style="border-bottom-right-radius:5px;border-top-right-radius:5px"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $('#datetimepicker1').datetimepicker({
                                                        //format: 'YYYY/MM/DD HH:mm'
                                                       format: 'YYYY/MM'
                                                    });
                                                });
                                            </script>
                                   </div>--%>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownBuilding" runat="server" class="form-control" style="width:150px;" DataSourceID="SqlDataSourceDPBuilding" DataTextField="Column1" DataValueField="Value">
                                        <asp:ListItem>-- Building --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceDPBuilding" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT '-- Building --','%' as 'Value' UNION SELECT Distinct [Building],[Building] as 'Value' FROM [FECS].[dbo].[Place]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownFloor" runat="server" class="form-control" style="width:150px;">
                                        <asp:ListItem>-- Floor --</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceDPFloor" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT '-- Floor --','%' as 'Value' UNION SELECT Distinct [Floor],[Floor] as 'Value' FROM [FECS].[dbo].[Place]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownArea" runat="server" class="form-control" style="width:150px;">
                                        <asp:ListItem>-- Area --</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-default">
                                      <span class="glyphicon glyphicon-search"></span> Search</button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        </nav>
        <div id="MainDiv" style="padding-top:30px;">
            <div class="row">
             <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg">
                    <table style="width:100%;height:100%;">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-building" aria-hidden="true" style="font-size:80px;color:#0d86d5"></i>
                            </td>
                            <td class="text-right">
                                <div class="row">
                                    <asp:Label ID="lblCountBuilding" runat="server" Text="30" Font-Size="45px"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Text=" / 9" Font-Size="30px"></asp:Label>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                 <a href="#" onClick="MyWindow=window.open('http://10.29.1.86/FECS/PageAdmin/WebForm_Place','MyWindow','width=600,height=300'); return false;"><h5>Building</h5></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg">
                    <table style="width:100%;height:100%;">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-map" aria-hidden="true" style="font-size:80px;color:#e18f1c"></i>
                            </td>
                            <td class="text-right">
                                <div class="row">
                                <asp:Label ID="lblCountArea" runat="server" Text="9999" Font-Size="45px"></asp:Label>
                                 <asp:Label ID="Label3" runat="server" Text=" / 93" Font-Size="30px"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                <a href="#" onClick="MyWindow=window.open('http://10.29.1.86/FECS/PageAdmin/WebForm_Place','MyWindow','width=600,height=300'); return false;"><h5>Area</h5></a>
                                
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg">
                    <table style="width:100%;height:100%;">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-users" aria-hidden="true" style="font-size:80px;color:#66cb49"></i>
                            </td>
                            <td class="text-right">
                                <div class="row">
                                <asp:Label ID="lblCountPeople" runat="server" Font-Size="45px" Text="9999"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text=" / 91" Font-Size="30px"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                <a href="#" onClick="MyWindow=window.open('http://10.29.1.86/FECS/PageAdmin/WebForm_Controller','MyWindow','width=600,height=300'); return false;"><h5>Controller</h5></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 GridBox">
                <div  class="DashboardBox transparent blurred-bg">
                    <table class="auto-style4">
                        <tr>
                            <td class="text-left" rowspan="2">
                                <i class="fa fa-fire-extinguisher" aria-hidden="true" style="font-size:80px;color:#ff0000"></i>
                            </td>
                            <td class="text-right">
                                <div class="row">
                                <asp:Label ID="lblCountEQP" runat="server" Text="9999" Font-Size="45px"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text=" / 1653" Font-Size="30px"></asp:Label>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                 <a href="#" onClick="MyWindow=window.open('http://10.29.1.86/FECS/PageAdmin/WebForm_Item','MyWindow','width=600,height=300'); return false;"><h5>Equipment</h5></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
 
            </div>
            <%-------------------------------------------------------------------------------------------%>
             <div class="row">
              <table style=" width:100%;height:100%; ">
                        <tr>
                            <td style="border-style: solid; border-color: inherit; border-width: 0px;" class="w-25" >
            <%-- <div class="col-lg-3 col-md-6 GridBox" style="border:1px solid">--%>
                                <div class="DashboardBox transparent blurred-bg">
                                    <table style="width: 100%; height: 100%;">
                                        <tr>
                                            <td class="text-center" rowspan="2" style="width: 45%">
                                                <i class="fa fa-fire-extinguisher" aria-hidden="true" style="font-size: 80px; color: #ff0000"></i>
                                            </td>
                                            <td class="text-center">
                                                <asp:Label ID="FireEx" runat="server" Text="" Font-Size="45px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <asp:Label ID="Label13" runat="server" Text="Fire extinguisher" Font-Size="20px" ForeColor="#808080"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="DashboardBox transparent blurred-bg">
                                    <table style="width: 100%; height: 100%;">
                                        <tr>
                                            <td class="text-center" rowspan="2" style="width: 45%">
                                                <i class="fa fa-bell" aria-hidden="true" style="font-size: 60px; color: #7f7f7f"></i>
                                            </td>
                                            <td class="text-center">
                                                <asp:Label ID="Bell" runat="server" Font-Size="45px" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <asp:Label ID="Label17" runat="server" Text="Bell" Font-Size="20px" ForeColor="#808080"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="DashboardBox transparent blurred-bg">
                                    <table style="width: 100%; height: 100%;">
                                        <tr>
                                            <td class="text-center" rowspan="2" style="width: 45%">

                                                <i class="fa fa-fire-extinguisher" aria-hidden="true" style="font-size: 80px; color: #161414"></i>
                                            </td>
                                            <td class="text-center">
                                                <asp:Label ID="firehose" runat="server" Text="" Font-Size="45px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <asp:Label ID="Label20" runat="server" Text="Fire Hose" Font-Size="20px" ForeColor="#808080"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
            </td> 
     
           <%-- </div>--%>
            

            <%--------------------------------------------------------GRAPH-----------------------------------------------------------%>
         
            <td style="width:30px;vertical-align:top; margin-right:20px;"> </td>
            <td style="width:500px;vertical-align:top; margin-right:20px;"> 
                     

                <asp:Chart ID="Chart2" runat="server" DataSourceID="DataChart" Height="367px" Width="954px"  DataMember="DefaultView" ImageLocation=""  >
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Point"  Label="#VAL" Name="SUM" ToolTip="TOTAL : #VAL" XValueMember="YearMonth" YValueMembers="SUM" LabelBackColor="128, 255, 255" MarkerColor="Black" MarkerSize="1">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="I Building" XValueMember="YearMonth" YValueMembers="I" Color="255, 192, 128" ToolTip="#SERIESNAME\nTotal:  #VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="H Building" XValueMember="YearMonth" YValueMembers="H" Color="LightSkyBlue" ToolTip="#SERIESNAME \nTotal:  #VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="G Building" XValueMember="YearMonth" YValueMembers="G" Color="#F9A484"   ToolTip="#SERIESNAME\nTotal:  #VAL"  >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="F Building" XValueMember="YearMonth" YValueMembers="F" Color="#E1FD8E" ToolTip="#SERIESNAME\nTotal:  #VAL" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="E Building" XValueMember="YearMonth" YValueMembers="E" Color="#D0B3E1 " ToolTip="#SERIESNAME\nTotal:  #VAL" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="D Building" XValueMember="YearMonth" YValueMembers="D" Color="128, 255, 128" ToolTip="#SERIESNAME\nTotal:  #VAL" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="C Building" XValueMember="YearMonth" YValueMembers="C" Color="#FFFF88 " ToolTip="#SERIESNAME\nTotal:  #VAL" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="B Building" XValueMember="YearMonth" YValueMembers="B" Color="InactiveCaption" ToolTip="#SERIESNAME\nTotal:  #VAL" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="A Building" XValueMember="YearMonth" YValueMembers="A" Color="Salmon" ToolTip="#SERIESNAME\nTotal:  #VAL"  IsXValueIndexed="True"  >
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
          <Legends>
                <asp:Legend Docking="Bottom" Name="Legend1">
                </asp:Legend>
            </Legends>
            <Titles>
                <asp:Title Font="Microsoft Sans Serif, 15.75pt" Name="Title1" Text="การส่งรายงานใบตรวจสอบการป้องกันอัคคีภัยของผู้รับผิดชอบต้นเพลิง">
                </asp:Title>
                <asp:Title  Font="Microsoft Sans Serif, 11pt, style=Bold" Name="Year-Month" Text="Year-Month">
                    <Position X="94" Y="86" />
                </asp:Title>
                <asp:Title  Font="Microsoft Sans Serif, 11pt, style=Bold" Name="Person" Text="Person">
                    <Position Height="2.98580146" Width="10" X="2" Y="6" />
                </asp:Title>
            </Titles>
        </asp:Chart>

                <asp:SqlDataSource ID="DataChart" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT tb1.YearMonth
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'A%'
			) as A
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'B%'
			) as B
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'C%'
			) as C
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'D%'
			) as D
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'E%'
			) as E
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'F%'
			) as F
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'G%'
			) as G
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'H%'
			) as H
,(select Count(YearMonth) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth and Place.Building like 'I%'
			) as I
,(select (Count(YearMonth)) as Countt
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID 
			WHERE CheckSheet.YearMonth = tb1.YearMonth 
			) as SUM
From CheckSheet as tb1
where YearMonth between convert(varchar(4),@date)+'-04' AND convert(varchar(4),@date+1)+ '-03'
GROUP by YearMonth">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="date" PropertyName="SelectedValue" />
                    </SelectParameters>

                </asp:SqlDataSource>

                  </td>
                          </tr>
           
                  </table>
            </div>

        <%-------------------------------------------------------------------------------------------------------------------%>
       <br />

            <div class="row">
            <div class="col-sm-12 GridBox">

               <div  class="DashboardBox transparent blurred-bg" style="height:510px;padding:10px">

                <table class="nav-justified" style="height:15%">
                   <tr >
                      <%--   <td class="auto-style2"style="border:1px solid pink">--%>
                          <%-- <div class="panel panel-default TransparentContent" style="width:100%;height:100%;padding:5px;">--%>
                            <%--<embed src="Img/H%20Building,%201st%20floor.pdf#view=Fit" width="100%" height="100%" type='application/pdf'>--%>
 <%-- </div>
</td>--%>
                       <br />
                        <td style="width:700px;vertical-align:top;padding-left:10px"> 
                       
                             <asp:GridView ID="GridViewLastData" runat="server" CssClass="table" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLastData" Font-Size="8pt" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                         <Columns>
                                             <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                             <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                                             <asp:BoundField DataField="SubType" HeaderText="Type" SortExpression="SubType" />
                                             <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                         </Columns>
                                         <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                         <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                         <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                         <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                         <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                         <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                         <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                         <SortedDescendingHeaderStyle BackColor="#242121" />
                                     </asp:GridView>
                               
                            <asp:SqlDataSource ID="SqlDataSourceLastData" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT Distinct top 10 CT.[Name],P.Area,IST.SubType,CSD.Date FROM [FECS].[dbo].[Controller] AS CT
INNER JOIN [FECS].[dbo].Place AS P
ON CT.ID = P.ControllerID
INNER JOIN [FECS].[dbo].Item AS I
ON P.ID = I.PlaceID
INNER JOIN [FECS].[dbo].ItemSubType AS IST
ON I.ItemSubTypeID = IST.ID
INNER JOIN [FECS].[dbo].CheckSheetDetail AS CSD
ON I.ID = CSD.ItemID order by CSD.Date desc"></asp:SqlDataSource>
                      

                            </td>

                            <td style="width:600px;vertical-align:top;padding-left:10px" style="border:1px solid"> 
                                       <div class="panel panel-default TransparentContent" style="height:100px;position: relative;padding:10px;">
                                    <asp:Label ID="lblAVG" runat="server" Text="Area" Font-Size="15pt"></asp:Label><br/>
                                    <asp:Label ID="lblAVGarea" runat="server" Text="50/30" Font-Size="10pt" ForeColor="#333333"></asp:Label>
                                    <div class="progress" style="height:25px;">
                                      <div class="progress-bar progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <%=c_avgArea%>%;background-color:#e18f1c;">
                                          <%if (c_avgArea > 90)
                                             { %>
                                            <span style="font-size:18px"><%=c_avgArea%>%</span>
                                            <%} %>
                                      </div>
                                        <%if (c_avgArea < 90)
                                             { %>
                                            <span style="font-size:18px"><%=c_avgArea%>%</span>
                                            <%} %>
                                    </div>
                               </div>
                               <div class="panel panel-default TransparentContent" style="height:100px;position: relative;padding:10px;">
                                    <asp:Label ID="Label4" runat="server" Text="Controller" Font-Size="15"></asp:Label><br/>
                                    <asp:Label ID="lblAVGpeople" runat="server" Text="50/30" Font-Size="10pt" ForeColor="#333333"></asp:Label>
                                    <div class="progress" style="height:25px;">
                                      <div class="progress-bar progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=c_avgPeople%>%;background-color:#66cb49;">
                                          <%if (c_avgPeople > 90)
                                             { %>
                                            <span style="font-size:18px"><%=c_avgPeople%>%</span>
                                            <%} %>
                                      </div>
                                        <%if (c_avgPeople < 90)
                                             { %>
                                            <span style="font-size:18px"><%=c_avgPeople%>%</span>
                                            <%} %>
                                    </div>
                                </div>
                                <div class="panel panel-default TransparentContent" style="height:100px;position: relative;padding:10px;">
                                    <asp:Label ID="Label8" runat="server" Text="Equipment" Font-Size="15"></asp:Label><br/>
                                    <asp:Label ID="lblAVGitem" runat="server" Text="50/30" Font-Size="10pt" ForeColor="#333333"></asp:Label>
                                    <div class="progress" style="height:25px;">
                                      <div class="progress-bar progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=c_avgItem%>%;background-color:red;">
                                             <%if (c_avgItem > 90)
                                             { %>
                                            <span style="font-size:18px"><%=c_avgItem%>%</span>
                                             <%} %>
                                      </div>
                                        <%if (c_avgItem < 90)
                                             { %>
                                            <span style="font-size:18px"><%=c_avgItem%>%</span>                                            <%} %>
                                    </div>
                                </div>

                                <div style="margin-top:20%; margin-left:85%">
       <a href="http://10.29.1.86/FECS/WebForm_HomePage" onClick="history.go(-1); return false;"><h4>Go back</h4></a> </div>
                            </td>
                    </tr>
                </table>
              </div>
            </div>
                <%------------------------------------------------------%>
            </div>
<div style="margin-left:90%">
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


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"/>
    <meta name="theme-color" content="#000000"/>
    <link rel="manifest" href="./manifest.json"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <link rel="shortcut icon" href="./favicon.ico"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="e086e469df798b0241553aca-text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="e086e469df798b0241553aca-text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="e086e469df798b0241553aca-text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js" type="e086e469df798b0241553aca-text/javascript"></script>
    <link href="./static/css/main.72e3962d.css" rel="stylesheet"/>
</head>
<body>
    <div id="root"></div>
    <script type="e086e469df798b0241553aca-text/javascript" src="./static/js/main.58114fb1.js"></script>
    <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/95c75768/cloudflare-static/rocket-loader.min.js" data-cf-settings="e086e469df798b0241553aca-|49" defer=""></script>
</body>
</html>
