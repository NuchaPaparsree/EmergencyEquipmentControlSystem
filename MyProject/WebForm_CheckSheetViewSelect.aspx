  <%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_CheckSheetViewSelect.aspx.cs" Inherits="MyProject.WebForm_CheckSheetViewSelect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .search
       {
           margin-left:1000px;
            width:350px;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br /><br />
    <div class="search">
        <asp:TextBox ID="TextBox2"  runat="server" Height="30px" Width="200px" placeholder="Code" ></asp:TextBox>&nbsp;
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-info" Text="Search" />
    </div>
    <div class="container">
        ItemID : <asp:TextBox ID="TextBox1"  runat="server" Height="30px" Width="300px" ></asp:TextBox>&nbsp;
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="View Data" OnClick="Button1_Click" />
        <br /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ID,Code FROM [Item] WHERE ID = @ID OR Code = @Code">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox2" DefaultValue="" Name="Code" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
