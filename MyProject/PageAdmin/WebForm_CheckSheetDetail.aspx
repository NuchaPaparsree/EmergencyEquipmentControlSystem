<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Check.Master" AutoEventWireup="true" CodeBehind="WebForm_CheckSheetDetail.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_CheckSheetDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    ID : <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
    Code : <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />
    ItemTypeName : <asp:Label ID="Label3" runat="server" Text=""></asp:Label><br />
    SubType : <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
    <br />
    ControllerID : <asp:Label ID="Label6" runat="server" Text=""></asp:Label><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT [Item].[ID],[CheckItem].[CheckID],[CheckItem].[Detail] FROM [ItemType] LEFT JOIN [ItemSubType] ON (ItemType.ID = ItemSubType.ItemTypeID ) LEFT JOIN [Item] ON (ItemSubType.ID = Item.ItemSubTypeID) LEFT JOIN [CheckItem] ON (ItemType.ID = CheckItem.ItemTypeID)">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CheckItemID,CheckSheetDetailID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="CheckSheetDetailID" HeaderText="CheckSheetDetailID" ReadOnly="True" SortExpression="CheckSheetDetailID" />
            <asp:BoundField DataField="CheckItemID" HeaderText="CheckItemID" ReadOnly="True" SortExpression="CheckItemID" Visible="False" />
            <asp:BoundField DataField="CheckID" HeaderText="CheckID" SortExpression="CheckID" />
            <asp:BoundField DataField="ItemTypeID" HeaderText="ItemTypeID" SortExpression="ItemTypeID" Visible="False" />
            <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="CheckItemID2" HeaderText="CheckItemID2" SortExpression="CheckItemID2" Visible="False" />
            <asp:BoundField DataField="CheckSheetID" HeaderText="CheckSheetID" SortExpression="CheckSheetID" Visible="False" />
            <asp:CheckBoxField DataField="Checked" HeaderText="Checked" SortExpression="Checked" Visible="False" />
            <asp:TemplateField HeaderText="Checked">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="Button1" runat="server" Height="28px" Text="Button" OnClick="Button1_Click" />
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ViewCheckSheet]">
    </asp:SqlDataSource>
    <br />
</asp:Content>
