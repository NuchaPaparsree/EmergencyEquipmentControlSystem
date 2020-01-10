<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="WebForm_Login.aspx.cs" Inherits="MyProject.WebFormLogin" %>
<!DOCTYPE html>

<html>
 <head runat="server">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <%--<link rel="stylesheet" href="css/three.css">--%>
   <%--   <script src="MyScripts/one.js"></script> --%>

    <link href="~/MyStyles/bootstrap.css" rel="stylesheet" />
    <script src="~/MyScripts/jquery-1.8.2.js"></script>
    <script src="~/MyScripts/bootstrap.js"></script>

     <style>
body, html {
     background: url('img/wp3504266.png') ;
   
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: 90px;
margin-bottom:auto;
width: 650px;
background-color: rgba(0,0,0,0.5) !important;
}

.card-header h3{
color: white;




</style>
</head>

<script>
var input = document.getElementById("txtCondUserName");
    input.addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode === 13) {
        document.getElementById("btnLogin").click();
    }
    });

</script>

<body>



    <form id="form1" runat="server" align="Center">  
        
		<div class="card icon-align-center">
			<div class="card-ce">
						
			   <asp:Panel ID="PanelLogin" runat="server">
            <div align="Center" ID="LoginTitle">
              <br /><br /> <br /> <br /> <br /> <br />
               
                <asp:Label ID="lblLoginTitle" runat="server" Text="Emergency Equipment Control Login"
                     Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></asp:Label>
            </div>
            <br /><br />
            	
       
            <div  id="LoginText" style="text-align: center;">
               

                <asp:Label ID="lblUserName" runat="server" ></asp:Label>
                <br />
               
                <asp:TextBox ID="txtCondUserName" runat="server" placeholder="username" Height="30px" Width="300px" AutoPostBack="True" OnTextChanged="txtCondUserName_TextChanged"></asp:TextBox>

                 <br /><br />

                <asp:Label ID="lblPassword" runat="server" ></asp:Label>
                <br />   
                
                <asp:TextBox ID="txtCondPassword" runat="server" class="form-control" placeholder="password" Height="30px" TextMode="Password" Width="300px" ></asp:TextBox>
          
            </div>

            <div style="text-align:center;" ID="LoginButton" class="form-group">
               
                <asp:Button ID="btnLogin" class="btn float-right login_btn " runat="server" CommandName="Login" 
                    Text="Log In" ValidationGroup="LoginUser" OnClick="btnLogin_Click" />
            </div>
            
            <!-- เชื่อมดาต้าเบส สำหรับเซ็ค login ของ committee,Manager,Controller !-->

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT * FROM [Committee] WHERE (([ID] = @ID) AND ([Password] = @Password))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCondUserName" Name="ID" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtCondPassword" DefaultValue="" 
                        Name="Password" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ID, Name FROM Controller WHERE (ID = @IDControler) AND (Password = @PassControler)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCondUserName" Name="IDControler" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtCondPassword" Name="PassControler" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ID, Name FROM Manager WHERE (ID = @IDManager) AND (Password = @PassControler)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCondUserName" Name="IDManager" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtCondPassword" Name="PassControler" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div></form>

</body>
</html>