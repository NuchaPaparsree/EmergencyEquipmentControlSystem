<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Admin.Master" AutoEventWireup="true" CodeBehind="WebForm_CheckSheet.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_CheckSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    ControllerID:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    ItemID:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
           <%--<asp:DropDownList ID="DropDown1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Code" DataValueField="ID"></asp:DropDownList>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>--%>
<%--                    <asp:DropDownList ID="DropDown2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Controller]"></asp:SqlDataSource>--%>
    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Confirm" OnClick="Button1_Click" />
</asp:Content>

