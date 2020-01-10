<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Manager.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_Manager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}
    .bgimg {
        background-repeat: no-repeat;
        background-size: cover;
        background-image: url("../Img/safetymanagers.png");
        min-height: 100%;
    }
</style>

<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:150px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
       
            <br>MANAGER</span></div> </div></div>

      <div style="margin-top:100px;">
      <div class="text-center">
    <p><a href="#mana" class="w3-button w3-xxlarge w3-black"  style="font-size:20px">LET ME SEE MANAGER</a></p> </div>  
  </div> <div style="margin-top: 150px;"></div>
        


<div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">
  
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="mana">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

         <div class="text-center">
            <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="250px" placeholder="ID, Name" AutoPostBack="True" ></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;"/>
            <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" aria-hidden="true" Style="margin-left:5px;  margin-bottom:11px; Height:30px;" data-toggle="modal" data-target="#AddNewItem" />
        <br /><br />
</div>
         </header>
   
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <br />
         <asp:UpdatePanel ID="upCrudGrid" runat="server">
             <ContentTemplate>
                 <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" AllowSorting="True"
                     AutoGenerateColumns="False" AllowPaging="True"
                     DataKeyNames="ID" CssClass="table table-hover table-striped"
                     DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." 
                     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                     <Columns>
                         <asp:CommandField ShowSelectButton="True" />
                         <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                         <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                         <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                         <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                         <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                         <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" Visible="False" />
                         <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                         <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                     </Columns>

                     <FooterStyle BackColor="#CCCCCC" />
                     
                     <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="#3366FF" />
                     <PagerStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" />
                     <RowStyle BackColor="White" />
                     <SelectedRowStyle BackColor="White" Font-Bold="False" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#808080" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#383838" />

                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Manager] WHERE ([ID] LIKE '%' + @ID + '%' OR [Name] LIKE '%' + @Name + '%')">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="ID" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Name" PropertyName="Text" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </ContentTemplate>
         </asp:UpdatePanel>
      
      </div>

			
            <!-- Detail Modal Starts here-->
            <!--เปิด pop ให้ปิด class="modal hide fade"  -->
  

        <!--///////////////////////////// ADD NEW ////////////////////////////////////////////////-->
        <div id="AddNewItem" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="AddLabel">Detailed View</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DetailsView ID="DetailsView2" runat="server" 
							CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" 
							FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true" 
							FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black" 
							BorderStyle="Groove" AutoGenerateRows="False" DataSourceID="SqlDataSourceADD" Width="100%" DataKeyNames="ID" DefaultMode="Insert" > 
                                <EditRowStyle Width="100%" Height="30px" />
                                <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                                <Fields>
                                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True"/>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                    <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                                    <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                                    <asp:CommandField ShowInsertButton="True" />
                                </Fields>
                                <FooterStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSourceADD" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                    SelectCommand="SELECT [ID], [Name], [Department], [Section], [Email], [Password], [MobileNo], [InternalNo] FROM [Manager]
" 
                                     UpdateCommand="UPDATE Manager SET Name = @Name, Department = @Department, Section = @Section, Email = @Email, Password = @Password, MobileNo = @MobileNo, InternalNo = @InternalNo, Update_at = GETDATE()"
                                    DeleteCommand="DELETE FROM [Manager] WHERE [ID] = @original_ID" 
                                    InsertCommand="INSERT INTO Manager(ID, Name, Department, Section, Email, Password, MobileNo, InternalNo, Create_at, Create_by) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo, GETDATE(),@AT)
">
                                   
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ID" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID" Type="String" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="Section" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="MobileNo" Type="String" />
                                    <asp:Parameter Name="InternalNo" Type="String" />
                                    <asp:SessionParameter Name="AT" Type="String" SessionField="myLoginID" />

                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="Section" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="MobileNo" Type="String" />
                                    <asp:Parameter Name="InternalNo" Type="String" />
                                </UpdateParameters>

                                </asp:SqlDataSource>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
		            <asp:Button ID="Button2" runat="server"  OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true"/>
                </div>
            </div>


                <%---------------------------------------- Edit  -----------------------------------------%>
      <div id="detailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Detailed View</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:DetailsView ID="DetailsView3" runat="server" 
							CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" 
							FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true" 
							FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black" 
							BorderStyle="Groove" AutoGenerateRows="False"
							DataKeyNames="ID" DataSourceID="SqlDataSourceUpdaete" Width="100%">
                                <AlternatingRowStyle Width="100%" />
                                <CommandRowStyle Width="100%" />
                                <EditRowStyle Width="100%" Height="30px" />
                                <EmptyDataRowStyle Width="100%" />
                                <FieldHeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                                <Fields>
                                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                    <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                                    <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                </Fields>
                                <FooterStyle Width="100%" />
                                <HeaderStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                                <PagerStyle Width="100%" />
                                <RowStyle Width="100%"/>

                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSourceUpdaete" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                DeleteCommand="DELETE FROM [Manager] WHERE [ID] = @ID"
                                InsertCommand="INSERT INTO [Manager] ([ID], [Name], [Department], [Section], [Email], [Password], [MobileNo], [InternalNo]) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo)" 
                                SelectCommand="SELECT * FROM [Manager] WHERE ([ID] = @ID)" 
                                UpdateCommand="UPDATE Manager SET Name = @Name, Department = @Department, Section = @Section, Email = @Email, Password = @Password, MobileNo = @MobileNo, InternalNo = @InternalNo, Update_at = GETDATE() ,Update_by = @BY WHERE (ID = @ID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID" Type="String" />
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="Section" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="MobileNo" Type="String" />
                                    <asp:Parameter Name="InternalNo" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="SelectedRow.Cells(1).Text" Name="ID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="Section" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="MobileNo" Type="String" />
                                    <asp:Parameter Name="InternalNo" Type="String" />
                                    <asp:Parameter Name="ID" Type="String" />
                                    <asp:SessionParameter Name="BY" Type="String" SessionField="myLoginID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                             </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <%--<button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>--%>
		            <asp:Button ID="Button3" runat="server"  OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true"/>
                </div>
            </div>

</asp:Content>
