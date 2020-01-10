<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Report.aspx.cs" Inherits="MyProject.Report.WebForm_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            background-image: url("/Img/BG.jpg");
            min-height: 100%;
        }
    </style>
    <Body class="bgimg w3-display-container w3-grayscale-min" id="home">
        <div class="w3-display-bottomleft w3-padding">

            <div class="w3-display-middle w3-center">
                <div style="padding-top: 14px;">
                    
                </div>
            </div>
        </div>
        <div style="margin-top: 60px;"></div>
        <div style="width: auto; margin-right: 3%; margin-left: 3%; text-align: center">
            <div class="w3-container w3-black w3-padding-64 w3-xxlarge">
                <div class="w3-content">
                </div>
                <div class="text-center">

            <asp:Label ID="lbYearMonth" runat="server" Text="YearMonth : "></asp:Label>
            <asp:DropDownList ID="ddlYearMonth" runat="server" DataSourceID="SDSYearMonth" DataTextField="YearMonth" DataValueField="YearMonth" AutoPostBack="True" Width="90px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SDSYearMonth" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT DISTINCT YearMonth FROM CheckSheet ORDER BY YearMonth DESC">
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;&nbsp;
          <%--<asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label>
            <asp:TextBox ID="txtName" runat="server" Height="20px" AutoPostBack="true"></asp:TextBox>--%>


          <asp:Label ID="Label1" runat="server" Text="Building : "></asp:Label>
          <asp:DropDownList ID="DropDownList2" runat="server" Width="140px"  DataSourceID="DataBuildingPlace" DataTextField="Building" DataValueField="Building" AutoPostBack="True" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
            <asp:SqlDataSource ID="DataBuildingPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Building FROM Place ORDER BY Building"></asp:SqlDataSource>

           <asp:Label ID="Label2" runat="server" Text="Floor : "></asp:Label>
          <asp:DropDownList ID="DropDownList1" runat="server" Width="140px"  DataSourceID="DataFloorPlace" DataTextField="Floor" DataValueField="Floor" AutoPostBack="True" OnDataBound="DropDownList1_DataBound1"></asp:DropDownList>
            <asp:SqlDataSource ID="DataFloorPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Floor FROM Place WHERE Building LIKE '%'+ @Build +'%'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="Build" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

          <asp:Label ID="Label3" runat="server" Text="Area : "></asp:Label>
          <asp:DropDownList ID="DropDownList3" runat="server"  Width="140px" DataSourceID="DataAreaPlace" DataTextField="Area" DataValueField="Area" AutoPostBack="True" OnDataBound="DropDownList3_DataBound"></asp:DropDownList>
            <asp:SqlDataSource ID="DataAreaPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT Area FROM Place  WHERE Building LIKE '%' + @Build +'%' AND Floor LIKE '%' +@Floor + '%'  GROUP BY Area ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="Build" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="Floor" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
           <asp:Label ID="Label5" runat="server" Text="Status : "></asp:Label>

          <asp:DropDownList ID="DropDownList4" runat="server" Width="140px"   AutoPostBack="True">
              <asp:ListItem Text ="All" Value ="%"></asp:ListItem>
              <asp:ListItem Text="CHECK" Value="CHECK"> </asp:ListItem>
              <asp:ListItem Text="NO CHECK" Value="NO CHECK" ></asp:ListItem>
            </asp:DropDownList>
          <br /><br />
                </div>
            </div>

            <%--<asp:Label ID="lbName" runat="server"  Text="Name: "></asp:Label>
            <asp:TextBox ID="txtName" runat="server" Height="30px" AutoPostBack="true"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbPlace" runat="server" Text="Place : "></asp:Label>
            <asp:DropDownList ID="ddlPlace" runat="server" DataSourceID="SDSPlace"  DataValueField="ID" DataTextField="Location" AutoPostBack="True" OnDataBound="ddlPlace_DataBound" Width="400px">
            </asp:DropDownList>
            &nbsp;&nbsp; 
            <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" Height="35px" />
            <br /><br />
            <asp:SqlDataSource ID="SDSPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
              SelectCommand="SELECT Place.ID, 'Building : ' + Place.Building + CASE WHEN Floor &lt;&gt; '' THEN ', Floor : ' + Floor ELSE ' ' END + ', ' + 'Area : ' + Place.Area AS Location, Place.Building, Place.Floor, Place.Area, Controller.Name 
                FROM Place INNER JOIN Controller ON Place.ControllerID = Controller.ID
                WHERE Controller.Name LIKE '%'+@Name+'%'">
              <SelectParameters>
                  <asp:ControlParameter ControlID="txtName" DefaultValue="" Name="Name" PropertyName="Text" />
              </SelectParameters>
            </asp:SqlDataSource>--%>
     

            <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" EmptyDataText="ไม่พบข้อมูล !!" AllowSorting="True"
					AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped" DataKeyNames="ID" DataSourceID="SqlDataSourceCheckSheet" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CheckSheetID" HeaderText="CheckSheetID" InsertVisible="False" ReadOnly="True" HeaderStyle-Width="40px" SortExpression="CheckSheetID">
                        <HeaderStyle Width="40px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Width="320px" SortExpression="Name">
                        <HeaderStyle Width="320px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" HeaderStyle-Width="80px" SortExpression="YearMonth">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Building" HeaderText="Building" HeaderStyle-Width="100px" SortExpression="Building">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Floor" HeaderText="Floor" HeaderStyle-Width="100px" SortExpression="Floor" ReadOnly="True">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Area" HeaderText="Area" HeaderStyle-Width="380px" SortExpression="Area">

                        <HeaderStyle Width="250px"></HeaderStyle>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Report">
                        <ItemTemplate>
                            <%--<a  href="ReportCheckSheet.aspx?CheckSheetID=<%# Eval("ID") %>">Report</a>--%>
                            <asp:LinkButton ID="lbtnReport" runat="server" Width="90px" PostBackUrl='<%#"~/Report/ReportCheckSheet.aspx?CheckSheetID=" + Eval("CheckSheetID")%>'
                                OnClick="lbtnReport_Click" Text='<%# ((Eval("YearMonth").ToString() == "" ? "" :"Report"))%>'>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="#3366FF" />
                    <PagerStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="White" Font-Bold="False"  />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />

            </asp:GridView>
          <br /><br />
       
                   </div>
           </Body>


            <asp:SqlDataSource ID="SqlDataSourceCheckSheet" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT* FROM (SELECT DISTINCT TB1.ID AS CheckSheetID, TB.Name, TB.ID ,TB1.YearMonth,TB.Building,TB.Floor,TB.Area,
(case when TB1.YearMonth is null then 'NO CHECK' else 'CHECK' end) as status
FROM CheckSheet,(SELECT Controller.ID, Controller.Name, Place.ID AS PlaceID, Place.Building, Place.Floor, Place.Area 
FROM Controller LEFT OUTER JOIN Place ON Place.ControllerID = Controller.ID ) AS TB 
LEFT OUTER JOIN (SELECT CheckSheet.ID, CheckSheet.PlaceID, CheckSheet.YearMonth FROM CheckSheet 
INNER JOIN Place AS Place_1 ON CheckSheet.PlaceID = Place_1.ID
WHERE (CheckSheet.YearMonth LIKE '%' +@YearMonth + '%')) AS TB1 ON TB.PlaceID = TB1.PlaceID ) as TB2
WHERE (TB2.Building LIKE '%' +@Building + '%' AND TB2.Floor LIKE '%' + @Floor + '%' 
AND TB2.Area LIKE '%' + @Area + '%' AND TB2.Building IS NOT NULL) AND status LIKE  @Check +'%'">
             

                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlYearMonth" DefaultValue="" Name="YearMonth" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="%" Name="Building" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="Floor" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList3" DefaultValue="%" Name="Area" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList4" Name="Check" PropertyName="SelectedValue" DefaultValue=""  />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    <asp:sqldatasource id="SqlDataSourceCheckItemCheck" runat="server" connectionstring="<%$ ConnectionStrings:xPimConnectionString1 %>"
    selectcommand="SELECT COUNT(DISTINCT CheckSheetDetail.ItemID) AS Column1, (SELECT COUNT(Item.ID) AS Expr1 FROM Item INNER JOIN Place ON Place.ID = Item.PlaceID INNER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.ControllerID = @ControllerID)) AS Column2 FROM CheckSheetDetail INNER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN ItemType ON ItemType.ID = CheckItem.ItemTypeID WHERE (CheckSheet.ControllerID = @ControllerID) AND (ItemType.ID IN (1, 2, 5)) AND (CheckSheet.YearMonth = @YearMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="ControllerID" SessionField="U_ID" />
                <asp:SessionParameter Name="YearMonth" SessionField="Day" />
            </SelectParameters>
	    </asp:sqldatasource>

</asp:Content>

