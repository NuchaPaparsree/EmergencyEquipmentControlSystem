<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteMySystem.Master" CodeBehind="WebForm_ReportCheckSheet.aspx.cs" Inherits="MyProject.Report.WebForm_ReportCheckSheet" %>

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
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbName" runat="server"  Text="Name: "></asp:Label>
            <asp:TextBox ID="txtName" runat="server" Height="30px" AutoPostBack="true"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbPlace" runat="server" Text="Place : "></asp:Label>
            <asp:DropDownList ID="ddlPlace" runat="server" DataSourceID="SDSPlace"  DataValueField="ID" DataTextField="Location" AutoPostBack="True" OnDataBound="ddlPlace_DataBound" Width="400px">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" Height="35px" />
            <br /><br />
            <asp:SqlDataSource ID="SDSYearMonth" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT YearMonth FROM CheckSheet ORDER BY YearMonth DESC"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SDSPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT Place.ID, 'Building : ' + Place.Building + CASE WHEN Floor &lt;&gt; '' THEN ', Floor : ' + Floor ELSE ' ' END + ', ' + 'Area : ' + Place.Area AS Location, Place.Building, Place.Floor, Place.Area, Controller.Name 
FROM Place INNER JOIN Controller ON Place.ControllerID = Controller.ID
 WHERE Controller.Name LIKE '%'+@Name+'%'">

                <SelectParameters>
                    <asp:ControlParameter ControlID="txtName" DefaultValue="%" Name="Name" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" EmptyDataText="ไม่พบข้อมูล !!" AllowSorting="True"
					AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped" DataKeyNames="ID" DataSourceID="SqlDataSourceCheckSheet">
                <Columns >
                    
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"  Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField >
                    <asp:BoundField DataField="ID" HeaderText="CheckSheetID" InsertVisible="False" ReadOnly="True"  SortExpression="ID" />
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                    <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" ReadOnly="True" />
                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                    <asp:BoundField DataField="ControllerID" HeaderText="ControllerID" SortExpression="ControllerID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"   />

                    <asp:TemplateField HeaderText="Report">
                        <ItemTemplate >
                            <%--<a  href="ReportCheckSheet.aspx?CheckSheetID=<%# Eval("ID") %>">Report</a>--%>
                            <asp:LinkButton ID="lbtnReport" runat="server" OnClick="lbtnReport_Click" >Report</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

                        </div>
           </Body> 


            <asp:SqlDataSource ID="SqlDataSourceCheckSheet" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY CheckSheet.ID DESC) AS RowIndex, CheckSheet.ID, CheckSheet.YearMonth, Place.Building,
                Case When  Place.Floor &lt;&gt;' ' then Place.Floor else '-' end as Floor
                , Place.Area, CheckSheet.ControllerID, Controller.Name FROM CheckSheet INNER JOIN Place ON CheckSheet.PlaceID = Place.ID LEFT OUTER JOIN Controller ON CheckSheet.ControllerID = Controller.ID AND Place.ControllerID = Controller.ID

             where CheckSheet.YearMonth like '%'+@YearMonth+ '%' and Controller.Name like '%' +@Name+ '%' and CheckSheet.PlaceID like '%'+ @Location+ '%'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlYearMonth" DefaultValue="%" Name="YearMonth" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtName" DefaultValue="%" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddlPlace" DefaultValue="%" Name="Location" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

    <asp:sqldatasource id="SqlDataSourceCheckItemCheck" runat="server" connectionstring="<%$ ConnectionStrings:xPimConnectionString1 %>"
    selectcommand="SELECT COUNT(DISTINCT CheckSheetDetail.ItemID) AS Column1, (SELECT COUNT(Item.ID) AS Expr1 FROM Item INNER JOIN Place ON Place.ID = Item.PlaceID INNER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.ControllerID = @ControllerID)) AS Column2 
        FROM CheckSheetDetail INNER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN ItemType ON ItemType.ID = CheckItem.ItemTypeID WHERE (CheckSheet.ControllerID = @ControllerID) AND (ItemType.ID IN (1, 2, 5)) AND (CheckSheet.YearMonth = @YearMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="ControllerID" SessionField="U_ID" />
                <asp:SessionParameter Name="YearMonth" SessionField="Day" />
            </SelectParameters>
	    </asp:sqldatasource>
</asp:Content>
