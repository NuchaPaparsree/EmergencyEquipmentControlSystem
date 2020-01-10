<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm_CheckSheetDataView.aspx.cs" Inherits="MyProject.WebForm_CheckSheetDataView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="~/MyBootStrap/bootstrap.min.css" rel="stylesheet" />
    <script src="~/MyBootStrap/jquery.min.js"></script>
    <script src="~/MyBootStrap/bootstrap.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:FormView ID="FormView1" CssClass="table table-hover table-striped" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource3" Font-Names="Yu Gothic UI Semibold" Font-Size="Large">
                <EditItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    Code:
                    <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    SubType:
                    <asp:TextBox ID="SubTypeTextBox" runat="server" Text='<%# Bind("SubType") %>' />
                    <br />
                    Size:
                    <asp:TextBox ID="SizeTextBox" runat="server" Text='<%# Bind("Size") %>' />
                    <br />
                    PurchasePrice:
                    <asp:TextBox ID="PurchasePriceTextBox" runat="server" Text='<%# Bind("PurchasePrice") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Code:
                    <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    SubType:
                    <asp:TextBox ID="SubTypeTextBox" runat="server" Text='<%# Bind("SubType") %>' />
                    <br />
                    Size:
                    <asp:TextBox ID="SizeTextBox" runat="server" Text='<%# Bind("Size") %>' />
                    <br />
                    PurchasePrice:
                    <asp:TextBox ID="PurchasePriceTextBox" runat="server" Text='<%# Bind("PurchasePrice") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    &nbsp;Code:
                    <asp:Label ID="CodeLabel" runat="server" Text='<%# Bind("Code") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    SubType:
                    <asp:Label ID="SubTypeLabel" runat="server" Text='<%# Bind("SubType") %>' />
                    <br />
                    Size:
                    <asp:Label ID="SizeLabel" runat="server" Text='<%# Bind("Size") %>' />
                    &nbsp;PurchasePrice:
                    <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%# Bind("PurchasePrice") %>' />
                    <br />
                    <br />
                </ItemTemplate>
                <RowStyle HorizontalAlign="Center" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT Item.ID, Item.Code, ItemType.Name, ItemSubType.SubType, ItemSubType.Size, ItemSubType.PurchasePrice, ItemType.Manual FROM ItemType INNER JOIN ItemSubType ON ItemType.ID = ItemSubType.ItemTypeID INNER JOIN Item ON ItemSubType.ID = Item.ItemSubTypeID WHERE (Item.ID = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ItemID" />
                </SelectParameters>
            </asp:SqlDataSource>

                <asp:GridView ID="GridView2" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="PHOTO">                     
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl =' <%# "~/" + Eval("PHOTO").ToString()%>' Width="300" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT PHOTO FROM ItemType INNER JOIN ItemSubType ON ItemType.ID = ItemSubType.ItemTypeID INNER JOIN Item ON ItemSubType.ID = Item.ItemSubTypeID WHERE (Item.ID = @ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ItemID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Manual" HeaderText="Manual" SortExpression="Manual" Visible="False" />
                        <asp:ImageField DataImageUrlField="Manual">
                            <ControlStyle Height="500px" Width="300px" />
                        </asp:ImageField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ItemType.Manual FROM ItemType INNER JOIN ItemSubType ON ItemType.ID = ItemSubType.ItemTypeID INNER JOIN Item ON ItemSubType.ID = Item.ItemSubTypeID WHERE (Item.ID = @ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ItemID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        <div align="center">
            <asp:Button ID="ButtonBack" class="btn btn-primary" runat="server" Text="Back" OnClick="ButtonBack_Click" /><br />
        </div>
        <div>&nbsp;</div>
    </form>
</body>
</html>
