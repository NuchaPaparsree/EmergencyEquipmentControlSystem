<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_ReportCommittee.aspx.cs" Inherits="MyProject.Report.WebForm_CommitteeReport" %>
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
    <Body>
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
         
             <asp:Label ID="Label5" runat="server" Text="Status : "></asp:Label>
             <asp:DropDownList ID="DropDownList4" runat="server" Width="140px" AutoPostBack="True">
              <asp:ListItem Text ="All" Value ="%"></asp:ListItem>
              <asp:ListItem Text="APPROVE" Value="APPROVE"> </asp:ListItem>
              <asp:ListItem Text="NO APPROVE" Value="NO APPROVE" ></asp:ListItem>
            </asp:DropDownList>
  <br />
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
 
           
          
            <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" EmptyDataText="ไม่พบข้อมูล !!" AllowSorting="True"
					AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped" DataKeyNames="ID" DataSourceID="SqlDataSourceCheckSheet" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:TemplateField HeaderText="Check">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
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
                    <asp:BoundField DataField="ControllerID" HeaderText="ControllerID" SortExpression="ControllerID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Ch_Approve" HeaderText="Status" SortExpression="Ch_Approve" />
                    <asp:TemplateField  HeaderText="Report">
                        <ItemTemplate>
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
                SelectCommand="SELECT* FROM (SELECT ROW_NUMBER() OVER(ORDER BY CheckSheet.ID DESC) AS RowIndex 
,CheckSheet.ControllerID, Controller.Name , 
CheckSheet.ID, CheckSheet.YearMonth as YearMonth, Place.Building,Committee.id as CommitteeID,
(case when CheckSheet.CommitteeID is null then 'NO APPROVE' else 'APPROVE' end) as Ch_Approve,
Case When  Place.Floor &lt;&gt;' ' then Place.Floor else '-' end as Floor, Place.Area
FROM Committee INNER JOIN Place ON Committee.ID = Place.CommitteeID 
inner JOIN CheckSheet ON Place.ID = CheckSheet.PlaceID 
inner JOIN Controller on Controller.ID = CheckSheet.ControllerID
) as TB1
where (YearMonth =@YearMonth AND TB1.CommitteeID = @ID) and Ch_Approve LIKE  @D +'%'">
                <SelectParameters>
             
                    <asp:ControlParameter ControlID="ddlYearMonth" Name="YearMonth" PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="ID" SessionField="myLoginID" DefaultValue=""/>
                    <asp:ControlParameter ControlID="DropDownList4" Name="D" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

      

    <asp:sqldatasource id="SqlDataSourceCheckItemCheck" runat="server" connectionstring="<%$ ConnectionStrings:xPimConnectionString1 %>"
    selectcommand="SELECT COUNT(DISTINCT CheckSheetDetail.ItemID) AS Column1, (SELECT COUNT(Item.ID) AS Expr1 FROM Item INNER JOIN Place ON Place.ID = Item.PlaceID INNER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.ControllerID = @ControllerID)) AS Column2 FROM CheckSheetDetail INNER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN ItemType ON ItemType.ID = CheckItem.ItemTypeID WHERE (CheckSheet.ControllerID = @ControllerID) AND (ItemType.ID IN (1, 2, 5)) AND (CheckSheet.YearMonth = @YearMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="ControllerID" SessionField="U_ID" />
                <asp:SessionParameter Name="YearMonth" SessionField="Day" />
            </SelectParameters>
	    </asp:sqldatasource>
    <asp:Button ID="Select" runat="server" Text="APPROVE" CssClass=" btn btn-warning" Width="15%" Height="36px" OnClick="Select_Click"   />

</div>
        </Body>
</asp:Content>
