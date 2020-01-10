<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Controller.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_Controller" %>
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
        background-image: url("../Img/construction-health-and-safety.jpg");
        min-height: 100%;
    }

</style>

    <%--<style>
    body {
        background-image: url("/Img/1.jpg");        
        background-repeat: repeat;
    }
</style>--%>

<header class="bgimg w3-display-container w3-grayscale-min" id="home">

  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:150px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
       
            <br>CONTROLLER</span></div></div> </div>

    <div style="margin-top: 100px;">
        <div class="text-center">
            <p><a href="#con" class="w3-button w3-xxlarge w3-black" style="font-size: 20px">LET ME SEE CONTROLLER</a></p>
        </div> <div style="margin-top: 150px;"></div>
    </div>
   


<div style="width: auto; margin-right: 5%; margin-left: 5%; margin-bottom:2%; text-align: center">
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="con">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

         <div class="text-center">
             
             <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="200px" placeholder="ID, Name" AutoPostBack="True"></asp:TextBox>
             <asp:DropDownList ID="DropDownList3" runat="server" Height="35px" Width="200px" AutoPostBack="True" DataSourceID="SqlDataBuildingPlace" DataTextField="Building" DataValueField="Building" OnDataBound="DropDownList3_DataBound"></asp:DropDownList>

             <asp:SqlDataSource ID="SqlDataBuildingPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Building FROM Place"></asp:SqlDataSource>

           
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;"/>
            <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;" data-toggle="modal" data-target="#AddNewItem" />
           
             <br /><br />
             </div></div></div></header>
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <!-- // show and sort data -->
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
					<asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" AllowSorting="True"
					AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped"
					DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="4px" CellPadding="3" CellSpacing="2" DataKeyNames="ID"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-Width="22%" />
                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False"/>
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" Visible="False"/>
                            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" Visible="False"/>
                            <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                            <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" HeaderStyle-Width="8%" />
                            <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" SortExpression="CommitteeID" />
                            <asp:BoundField DataField="CommitteeName" HeaderText="CommitteeName" SortExpression="CommitteeName" />
                        </Columns>

                       <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="#3366FF" />
                        <PagerStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="White" Font-Bold="False"  />
                        <SortedAscendingCellStyle BackColor="#ffffff" />
                        <SortedAscendingHeaderStyle BackColor="#d9ffff" />
                        <SortedDescendingCellStyle BackColor="#ffffff" />
                        <SortedDescendingHeaderStyle BackColor="#d9ffff" />


                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                        SelectCommand="SELECT DISTINCT Controller.ID, Controller.Name, Controller.Department, Controller.Section, Controller.Email, Controller.InternalNo, Place.Building, Committee.ID AS CommitteeID, Committee.Name AS CommitteeName FROM Controller LEFT OUTER JOIN Place ON Controller.ID = Place.ControllerID LEFT OUTER JOIN Committee ON Place.CommitteeID = Committee.ID WHERE (Controller.ID LIKE '%' + @ID + '%') OR (Controller.Name LIKE '%' + @Name + '%') AND (Place.Building LIKE @Build + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="ID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList3" DefaultValue="%" Name="Build" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
			
            <!-- Detail Modal Starts here-->
            <!--เปิด pop ให้ปิด class="modal hide fade"  -->
            <div id="detailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">× </div>
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
                                    <asp:TemplateField HeaderText="ManagerName">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ManagerID") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Manager]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ManagerID") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Manager]"></asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbManagerName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                </Fields>                                
                                <FooterStyle Width="100%" />
                                <HeaderStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                                <PagerStyle Width="100%" />
                                <RowStyle Width="100%"/>

                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [Controller] WHERE ([ID] = @ID)" DeleteCommand="DELETE FROM [Controller] WHERE [ID] = @ID" 
                                InsertCommand="INSERT INTO [Controller] ([ID], [Name], [Department], [Section], [Email], [Password], [MobileNo], [InternalNo], [ManagerID]) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo, @ManagerID)" 
                                UpdateCommand="UPDATE Controller SET Name = @Name, Department = @Department, Section = @Section, Email = @Email, Password = @Password, MobileNo = @MobileNo, InternalNo = @InternalNo, ManagerID = @ManagerID, Update_at = GETDATE(),Update_by = @BY WHERE (ID = @ID)">
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
                                    <asp:Parameter Name="ManagerID" Type="String" />
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
                                    <asp:Parameter Name="ManagerID" Type="String" />
                                    <asp:Parameter Name="ID" Type="String" />
                                    <asp:SessionParameter Name="BY" Type="String" SessionField="myLoginID" />
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


        <!--/////////////////////////////ADD NEW////////////////////////////////////////////////-->
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
                                    <asp:TemplateField HeaderText="ManagerID" SortExpression="ManagerID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ManagerID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlAdd" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAdd" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ManagerID") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceAdd" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Manager]"></asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ManagerID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowInsertButton="True" />
                                </Fields>
                                <FooterStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSourceADD" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [Controller]" 
                                    UpdateCommand="UPDATE [Controller] SET [Name] = @Name, [Department] = @Department, [Section] = @Section, [Email] = @Email, [Password] = @Password, [MobileNo] = @MobileNo, [InternalNo] = @InternalNo, [ManagerID] = @ManagerID WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Section] = @original_Section) OR ([Section] IS NULL AND @original_Section IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([MobileNo] = @original_MobileNo) OR ([MobileNo] IS NULL AND @original_MobileNo IS NULL)) AND (([InternalNo] = @original_InternalNo) OR ([InternalNo] IS NULL AND @original_InternalNo IS NULL)) AND (([ManagerID] = @original_ManagerID) OR ([ManagerID] IS NULL AND @original_ManagerID IS NULL))" 
                                    DeleteCommand="DELETE FROM [Controller] WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Section] = @original_Section) OR ([Section] IS NULL AND @original_Section IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([MobileNo] = @original_MobileNo) OR ([MobileNo] IS NULL AND @original_MobileNo IS NULL)) AND (([InternalNo] = @original_InternalNo) OR ([InternalNo] IS NULL AND @original_InternalNo IS NULL)) AND (([ManagerID] = @original_ManagerID) OR ([ManagerID] IS NULL AND @original_ManagerID IS NULL))" 
                                    InsertCommand="INSERT INTO Controller(ID, Name, Department, Section, Email, Password, MobileNo, InternalNo, ManagerID, Create_at,Create_by) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo, @ManagerID, GETDATE(),@AT)" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">

                                    <DeleteParameters>
                                        <asp:Parameter Name="original_ID" />
                                        <asp:Parameter Name="original_Name" />
                                        <asp:Parameter Name="original_Department" />
                                        <asp:Parameter Name="original_Section" />
                                        <asp:Parameter Name="original_Email" />
                                        <asp:Parameter Name="original_Password" />
                                        <asp:Parameter Name="original_MobileNo" />
                                        <asp:Parameter Name="original_InternalNo" />
                                        <asp:Parameter Name="original_ManagerID" />
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
                                        <asp:Parameter Name="ManagerID" Type="String" />
                                        <asp:SessionParameter Name="AT" Type="String" SessionField="myLoginID" />
                                    </InsertParameters>

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
 
</asp:Content>
