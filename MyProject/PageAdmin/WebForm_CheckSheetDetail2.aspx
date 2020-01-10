<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm_CheckSheetDetail2.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_CheckSheetDetail2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ControllerID : <asp:Label ID="lblControllerID" runat="server" Text=""></asp:Label><br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="SubType" HeaderText="SubType" SortExpression="SubType" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT Item.ID, Item.Code, ItemType.Name, ItemSubType.SubType FROM ItemType INNER JOIN ItemSubType ON ItemType.ID = ItemSubType.ItemTypeID INNER JOIN Item ON ItemSubType.ID = Item.ItemSubTypeID WHERE (Item.ID = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ItemID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CheckSheetDetailID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="CheckSheetDetailID" HeaderText="CheckSheetDetailID" ReadOnly="True" SortExpression="CheckSheetDetailID" />
                    <asp:BoundField DataField="CheckID" HeaderText="CheckID" SortExpression="CheckID" />
                    <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" />
                    <asp:CheckBoxField DataField="Checked" HeaderText="Checked" SortExpression="Checked" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                    <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button2" runat="server" Height="28px" Text="Button" OnClick="Button2_Click" />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT CheckSheetDetailID, CheckID, Detail, Checked, ItemID, YearMonth FROM ViewCheckSheet WHERE (ItemID = @ItemID) AND (YearMonth = @YearMonth)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ItemID" QueryStringField="ItemID" />
                    <asp:Parameter DefaultValue="(CONVERT (VARCHAR (7), getdate(), (120)))" Name="YearMonth" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
