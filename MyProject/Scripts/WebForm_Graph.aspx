<%@ Page  Language="C#" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="WebForm_Graph.aspx.cs" Inherits="MyProject.PageAdmin.WebFormTest" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>



<html>
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
            background-color:#ccd5d5;
            min-height: 100%;
        }
         .navbar {
             padding: 25px 20px;
             background: #fff;
             border: none;
             border-radius: 0;
             box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
         }
         .btn-style {
             background: #1651cb;
             color: #f8f9fa;
             border-color: #ffffff;
         }

    </style>
    <Body class="bgimg w3-display-container w3-grayscale-min" id="home">
 
        <div style="width: auto; margin-right: 3%; margin-left: 3%; text-align: center">
<%--<body>--%>
    <form id="form1" runat="server">
 <center>
   
   <div  class="navbar navbar-default mb-xl-5 mb-4">
        Year :  <asp:DropDownList ID="DropDownList1" runat="server" Height="28px"  AutoPostBack="True" DataSourceID="SqlDataSource1" Width="200px" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="select Distinct Substring(YearMonth,1,4)  from CheckSheet"></asp:SqlDataSource>
  

    </div>
        <div style="margin-top:40px "></div>



        <asp:Chart ID="Chart2" runat="server" DataSourceID="DataChart" Height="450px" Width="1007px" BackImageAlignment="Center" DataMember="DefaultView" Enabled="False" EnableTheming="False" ImageLocation="~/Chart/column.jpg" ImageStorageMode="UseImageLocation" ImageType="Jpeg" Palette="Pastel" >
            <Series>
                <asp:Series ChartArea="ChartArea1" ChartType="Point"  Label="#VAL" Name="SUM" ToolTip="TOTAL : #VAL" XValueMember="YearMonth" YValueMembers="SUM" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1" LabelBackColor="128, 255, 255" MarkerColor="Black" MarkerSize="1">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="I Building" XValueMember="YearMonth" YValueMembers="I" Color="255, 192, 128" ToolTip="#SERIESNAME\n        #VAL" Label="#VAL" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="H Building" XValueMember="YearMonth" YValueMembers="H" Color="LightSkyBlue" ToolTip="#SERIESNAME \n        #VAL" Label="#VAL" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="G Building" XValueMember="YearMonth" YValueMembers="G" Color="#F9A484"   ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="F Building" XValueMember="YearMonth" YValueMembers="F" Color="#E1FD8E" ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="E Building" XValueMember="YearMonth" YValueMembers="E" Color="#D0B3E1 " ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="D Building" XValueMember="YearMonth" YValueMembers="D" Color="128, 255, 128" ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="C Building" XValueMember="YearMonth" YValueMembers="C" Color="#FFFF88 " ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1" >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="B Building" XValueMember="YearMonth" YValueMembers="B" Color="InactiveCaption" ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" Legend="Legend1"  >
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" ChartType="StackedColumn" Name="A Building" XValueMember="YearMonth" YValueMembers="A" Color="Salmon" ToolTip="#SERIESNAME" BackImageAlignment="Center" BackImageTransparentColor="White" BackImageWrapMode="TileFlipY" IsXValueIndexed="True" Legend="Legend1" >
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
                <asp:Title BackImageAlignment="Center" Font="Microsoft Sans Serif, 11pt, style=Bold" Name="Year-Month" Text="Year-Month">
                    <Position X="94" Y="86" />
                </asp:Title>
                <asp:Title BackImageWrapMode="TileFlipX" Font="Microsoft Sans Serif, 11pt, style=Bold" Name="Person" Text="Person">
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

    <div id="chart_div"></div>   


     <div style="margin-top:40px"></div>

        <%--<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>--%>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" FooterStyle-BackColor="SlateGray" DataSourceID="DataPlan" Height="379px" Width="1222px" AllowSorting="True" CellPadding="4" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                
                    <asp:TemplateField HeaderText="No." >
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                     <%--    <FooterTemplate>
                         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </FooterTemplate>--%>
                        
                        <HeaderStyle Width="30px" />
                    </asp:TemplateField>
                <asp:BoundField DataField="Building" HeaderText="Building" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                 <asp:BoundField DataField="Plann" HeaderText="Plann" ReadOnly="True" />
                <asp:BoundField DataField="April" HeaderText="April" ReadOnly="True" />
                <asp:BoundField DataField="May" HeaderText="May" ReadOnly="True" />
                <asp:BoundField DataField="June" HeaderText="June" ReadOnly="True"  />
                <asp:BoundField DataField="July" HeaderText="July" ReadOnly="True" />
                <asp:BoundField DataField="Aug" HeaderText="Mar" ReadOnly="True" />
                <asp:BoundField DataField="Sep" HeaderText="Sep" ReadOnly="True" />
                <asp:BoundField DataField="Oct" HeaderText="Oct" ReadOnly="True" />
                <asp:BoundField DataField="Nov" HeaderText="Nov" ReadOnly="True" />
                <asp:BoundField DataField="Dec" HeaderText="Dec" ReadOnly="True" />
                <asp:BoundField DataField="Jan" HeaderText="Jan" ReadOnly="True" />
                <asp:BoundField DataField="Feb" HeaderText="Feb" ReadOnly="True" />
                <asp:BoundField DataField="Mar" HeaderText="Mar" ReadOnly="True" />
         
            </Columns>
           
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
           
        </asp:GridView>
  
        <br />
  
        <asp:Button ID="Button1" runat="server"  class="btn btn-style my-2 my-sm-0" Text="Export to Excel" Height="35px" Width="130px" OnClick="Button1_Click" />
        <br />
        <br />
      
        <asp:SqlDataSource ID="DataPlan" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT tb1.Building,Count(tb1.ControllerID) as Plann
,STUFF((SELECT distinct ', ' +  Committee.Name 
			From Committee join Place on Place.CommitteeID=Committee.ID 
			WHERE tb1.Building = Place.Building 		
			FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, ''
			) as Name
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-04'
			) as April
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-05'
			) as May
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-06'
			) as June
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-07'
			) as July
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-08'
			) as Aug
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-09'
			) as Sep
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-10'
			) as Oct
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-11'
			) as Nov
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date)+'-12'
			) as Dec
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date+1)+'-01'
			) as Jan
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date+1)+'-02'
			) as Feb
,(select Count(YearMonth) as YearMonthh
			From CheckSheet 
			INNER JOIN Place on Place.ID = CheckSheet.PlaceID
			WHERE Place.Building = tb1.Building 
			and YearMonth like convert(varchar(4),@date+1)+'-03' 
			) as Mar
From Place as tb1
GROUP by Building">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="date" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

   </div> 
</center>
    </form>
</body>
</html>







