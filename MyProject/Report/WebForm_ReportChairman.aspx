<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_ReportChairman.aspx.cs" Inherits="MyProject.Report.WebForm1" %>
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
            <asp:SqlDataSource ID="SDSYearMonth" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT YearMonth FROM CheckSheet ORDER BY YearMonth DESC"></asp:SqlDataSource>
               &nbsp;&nbsp;&nbsp;&nbsp; 
             <asp:Label ID="Label5" runat="server" Text="Status : "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" Width="140px" AutoPostBack="True">
                   <asp:ListItem Text="ALL" Value="%"> </asp:ListItem>
              <asp:ListItem Text="APPROVE" Value="APPROVE"> </asp:ListItem>
              <asp:ListItem Text="NO APPROVE" Value="NO APPROVE" ></asp:ListItem>
            </asp:DropDownList>
         

           <asp:Button ID="btnGraph" runat="server" class="btn btn-success" Text="Chart"  Style="margin-left: 15px; margin-bottom:11px; height: 30px;" />
<br />
 </div>            
          
            &nbsp;&nbsp;&nbsp;&nbsp;
          
           <%-- <asp:Label ID="lbPlace" runat="server" Text="Place : "></asp:Label>
            <asp:DropDownList ID="ddlPlace" runat="server" DataSourceID="SDSPlace"  DataValueField="ID" DataTextField="Location" AutoPostBack="True" OnDataBound="ddlPlace_DataBound" Width="400px">
            </asp:DropDownList>
            &nbsp;&nbsp;--%>
            <%--<asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" Height="35px" />
           <br />--%>
           
           <br />
            <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" EmptyDataText="ไม่พบข้อมูล !!" AllowSorting="True"
					AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped" DataKeyNames="ID" DataSourceID="SqlDataSourceCheckSheet" BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <Columns >
                  <%-- <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" SortExpression="CommitteeID" />--%>
                    <asp:TemplateField HeaderText="Check">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server"  />
                        </ItemTemplate>
                    </asp:TemplateField>

               <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    <asp:TemplateField HeaderText="CheckSheetID" InsertVisible="False" SortExpression="ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                    <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                    <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" ReadOnly="True" />
                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:TemplateField  HeaderText="Report">
                        <ItemTemplate >
                           <%-- <a  href="ReportCheckSheet.aspx?CheckSheetID=<%# Eval("ID") %>">Report</a>--%>
                            <asp:LinkButton ID="lbtnReport" runat="server" OnClick="lbtnReport_Click" >Report</asp:LinkButton>
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
     
            <asp:SqlDataSource ID="SqlDataSourceCheckSheet" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT* FROM (SELECT ROW_NUMBER() OVER(ORDER BY CheckSheet.ID DESC) AS RowIndex,Controller.ID as ControllerID,Controller.Name,
CheckSheet.ID, CheckSheet.YearMonth,ApproveDate2,ApproveDate3, Place.Building,.CheckSheet.CommitteeID,
(case when ChairmanID is null then 'NO APPROVE' else 'APPROVE'end) as Ch_Approve,
Case When  Place.Floor &lt;&gt;' ' then Place.Floor else '-' end as Floor, Place.Area
FROM CheckSheet INNER JOIN Controller ON Controller.ID=CheckSheet.ControllerID
INNER JOIN Place on Place.ID = CheckSheet.PlaceID
) as TB
where Ch_Approve LIKE  @Approve +'%' AND TB.CommitteeID is not null AND YearMonth =@YearMonth">
                <SelectParameters>
                  
               <%--     <asp:ControlParameter ControlID="ddlPlace" DefaultValue="%" Name="Location" PropertyName="SelectedValue" />--%>
                    
                    <asp:ControlParameter ControlID="DropDownList4" Name="Approve" PropertyName="SelectedValue" />
                    
                    <asp:ControlParameter ControlID="ddlYearMonth" Name="YearMonth" PropertyName="SelectedValue" />
                    
                </SelectParameters>
            </asp:SqlDataSource>

    <asp:sqldatasource id="SqlDataSourceCheckItemCheck" runat="server" connectionstring="<%$ ConnectionStrings:xPimConnectionString1 %>"
    selectcommand="SELECT COUNT(DISTINCT CheckSheetDetail.ItemID) AS Column1, (SELECT COUNT(Item.ID) AS Expr1 FROM Item INNER JOIN Place ON Place.ID = Item.PlaceID INNER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.ControllerID = @ControllerID)) AS Column2 FROM CheckSheetDetail INNER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN ItemType ON ItemType.ID = CheckItem.ItemTypeID WHERE (CheckSheet.ControllerID = @ControllerID) AND (ItemType.ID IN (1, 2, 5)) AND (CheckSheet.YearMonth = @YearMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="ControllerID" SessionField="U_ID" />
                <asp:SessionParameter Name="YearMonth" SessionField="Day" />
            </SelectParameters>
	   </asp:sqldatasource>

    <asp:Button ID="Select" runat="server" Text="APPROVE" CssClass=" btn btn-warning" Width="15%" Height="36px" OnClick="Select_Click"  />
 
              </div>
           </Body>
</asp:Content>


