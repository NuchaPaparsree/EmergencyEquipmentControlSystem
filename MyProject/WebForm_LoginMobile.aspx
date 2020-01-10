<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm_LoginMobile.aspx.cs" Inherits="MyProject.WebForm_LoginMobile" %>

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
        <form id="form2" runat="server">
            <div class="container">
                <h1 class="form-heading">login</h1>
                <div class="form-group" style="width:100%">
                    <label for="usr">UserID : </label>
                    <asp:TextBox ID="TextBoxUserID" runat="server" Height="35px" Width="100%" placeholder="UserID" AutoPostBack="True" OnTextChanged="TextBoxUserID_TextChanged"  ></asp:TextBox>
                    <br /><br />
                    <asp:DropDownList ID="DropDownList1" class="btn btn-info btn-lg btn-block" runat="server" DataSourceID="SqlDataSource1" DataTextField="MyColumn" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT *,( Building + ', ' + Floor + ', ' + Area) AS MyColumn FROM [Place] WHERE ControllerID = @ControllerID 
order by Floor ASC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxUserID" Name="ControllerID" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <label for="pwd">Password : </label>
                    <asp:TextBox ID="TextBoxPassword" runat="server" Height="35px" Width="100%" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <br /><br />

                    <asp:Button ID="Button1" class="btn btn-primary btn-lg btn-block" runat="server" Text="Login" OnClick="Button1_Click" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Controller] WHERE (([ID] = @ID) AND ([Password] = @Password))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxUserID" Name="ID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TextBoxPassword" Name="Password" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" Text="Go to DashBoard" OnClick="Button2_Click" />
                    <br />
                    <div align="center">
                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Large" OnClick="LinkButton1_Click" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True">ViewData</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Large" OnClick="LinkButton2_Click" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True">Checklist Table</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Large" OnClick="LinkButton3_Click" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True" visible="False" ForeColor="Red">Go To CheckSheet !!</asp:LinkButton>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

