<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Committee.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_Committee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
body, html {height: 100%}
        body, h1, h2, h3, h4, h5, h6 {
            font-family-color: "Amatic SC", sans-serif,white
        }
        .menu {display: none}
        .bgimg {
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url("../Img/nebosh.jpg");
            min-height: 100%;
        }
</style>

<%--<style>
    body {
        background-image: url("/Img/1.jpg");
        background-repeat: repeat;
    }
</style>--%>

<header class="bgimg w3-display-container w3-grayscale-min">
  <div class="w3-display-bottomleft w3-padding">
  </div>
  <div class="w3-display-middle w3-center">
        <div style="padding-top:150px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center" >
            <div style="w3-text-white"> 
            
            <br>COMMITTEE</span></div></div>
      <div style="margin-top:100px;">
      <div class="text-center">
    <p><a href="#com" class="w3-button w3-xxlarge w3-black"  style="font-size:20px">LET ME SEE COMMITTEE</a></p> </div>  
  </div> <div style="margin-top: 150px;"></div>
      


<div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="com">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

         <div class="text-center">
            <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="250px" placeholder="ID, Name" AutoPostBack="True"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:1px;  margin-bottom:11px; Height:30px;"/>
         <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;" data-toggle="modal" data-target="#AddNewItem" />
        <br /><br /></div>
         <br />
         </div></div></header>
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <!-- //Show and Sort data -->
        <br />
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
					<asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" AllowSorting="True"
					AutoGenerateColumns="False" AllowPaging="True"
					DataKeyNames="ID" CssClass="table table-hover table-striped"
					DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" > 
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" Visible="false"/>
                            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                            <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                        </Columns>


                       <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="#3366FF" />
                        <PagerStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="White" Font-Bold="False"/>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />


                    </asp:GridView>
                    <!-- //search data -->
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Committee] WHERE (([ID] LIKE '%' + @ID + '%' OR [Name] LIKE '%' + @Name + '%')) AND Is_Logout <> 1">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="ID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Name" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
			
            <!-- Detail Modal Starts here-->
            <!--เปิด pop ให้ปิด class="modal hide fade"  -->
            <div id="detailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Detailed View</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DetailsView ID="DetailsView1" runat="server" 
							CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" 
							FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true" 
							FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black" 
							BorderStyle="Groove" AutoGenerateRows="False"
							DataKeyNames="ID" DataSourceID="SqlDataSource2" Width="100%"> 

                                <AlternatingRowStyle Width="100%" />
                                <CommandRowStyle Width="100%" />
                                <EditRowStyle Width="100%" Height="30px" />
                                <EmptyDataRowStyle Width="100%" />
                                <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                                <Fields>
                                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                    <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                                    <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                                    <asp:BoundField DataField="Is_Logout" HeaderText="Is_Logout" SortExpression="Is_Logout" />
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                </Fields>

                              <%-- <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="#3366FF" />
                        <PagerStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="Black" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />--%>



                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                DeleteCommand="DELETE FROM [Committee] WHERE [ID] = @ID" 
                                InsertCommand="INSERT INTO [Committee] ([ID], [Name], [Department], [Section], [Email], [Password], [MobileNo], [InternalNo]) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo)" SelectCommand="SELECT * FROM [Committee] WHERE ([ID] = @ID)" 
                                UpdateCommand="UPDATE Committee SET Name = @Name, Department = @Department, Section = @Section, Email = @Email, Password = @Password, MobileNo = @MobileNo, InternalNo = @InternalNo, Update_at = GETDATE(),Update_by = @BY, Is_Logout = @Is_Logout WHERE (ID = @ID)">
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
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="SelectedRow.Cells(1).Text" Name="ID" PropertyName="SelectedValue" Type="String" />
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
                                    <asp:Parameter Name="Is_Logout" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <%--<button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>--%>
		            <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true"/>
                </div>
            </div>
        <!-- Detail Modal Ends here -->


        <!--///////////////////////////// ADD NEW ////////////////////////////////////////////////-->
        <div id="AddNewItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
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
                                    SelectCommand="SELECT * FROM [Committee]" UpdateCommand="UPDATE [Committee] SET [Name] = @Name, [Department] = @Department, [Section] = @Section, [Email] = @Email, [Password] = @Password, [MobileNo] = @MobileNo, [InternalNo] = @InternalNo WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Section] = @original_Section) OR ([Section] IS NULL AND @original_Section IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([MobileNo] = @original_MobileNo) OR ([MobileNo] IS NULL AND @original_MobileNo IS NULL)) AND (([InternalNo] = @original_InternalNo) OR ([InternalNo] IS NULL AND @original_InternalNo IS NULL))" 
                                    DeleteCommand="DELETE FROM [Committee] WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Section] = @original_Section) OR ([Section] IS NULL AND @original_Section IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([MobileNo] = @original_MobileNo) OR ([MobileNo] IS NULL AND @original_MobileNo IS NULL)) AND (([InternalNo] = @original_InternalNo) OR ([InternalNo] IS NULL AND @original_InternalNo IS NULL))" 
                                    InsertCommand="INSERT INTO Committee(ID, Name, Department, Section, Email, Password, MobileNo, InternalNo, Create_at, Create_by) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo, GETDATE(),@AT)"
                                    ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">

                                    <DeleteParameters>
                                        <asp:Parameter Name="original_ID" />
                                        <asp:Parameter Name="original_Name" />
                                        <asp:Parameter Name="original_Department" />
                                        <asp:Parameter Name="original_Section" />
                                        <asp:Parameter Name="original_Email" />
                                        <asp:Parameter Name="original_Password" />
                                        <asp:Parameter Name="original_MobileNo" />
                                        <asp:Parameter Name="original_InternalNo" />
                                    </DeleteParameters>

                                    <InsertParameters>
                                        <asp:Parameter Name="ID" Type="String" />
                                        <asp:Parameter Name="Name" Type="String" />
                                        <asp:Parameter Name="Department" Type="String" />
                                        <asp:Parameter Name="Section" Type="String"/>
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="MobileNo" Type="String" />
                                        <asp:Parameter Name="InternalNo" Type="String" />
                                        <asp:SessionParameter Name="AT" Type="String" SessionField="myLoginID" />
                                    </InsertParameters>

                                  
                                    <UpdateParameters>
                                        <asp:Parameter Name="Name" />
                                        <asp:Parameter Name="Department" />
                                        <asp:Parameter Name="Section" />
                                        <asp:Parameter Name="Email" />
                                        <asp:Parameter Name="Password" />
                                        <asp:Parameter Name="MobileNo" />
                                        <asp:Parameter Name="InternalNo" />
                                        <asp:Parameter Name="original_ID" />
                                        <asp:Parameter Name="original_Name" />
                                        <asp:Parameter Name="original_Department" />
                                        <asp:Parameter Name="original_Section" />
                                        <asp:Parameter Name="original_Email" />
                                        <asp:Parameter Name="original_Password" />
                                        <asp:Parameter Name="original_MobileNo" />
                                        <asp:Parameter Name="original_InternalNo" />
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

         </div>
    </div>
</asp:Content>
