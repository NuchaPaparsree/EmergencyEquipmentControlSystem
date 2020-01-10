<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_CheckItem.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_CheckItem" %>
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
            background-image: url("../Img/image-full.jpg");
            min-height: 100%;
        }
</style>


<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:150px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
       
            <br>CHECKITEM</span></div> </div></div>

      <div style="margin-top:100px;">
      <div class="text-center">
    <p><a href="#check" class="w3-button w3-xxlarge w3-black"  style="font-size:20px">LET ME SEE CHECKITEM</a></p> </div>  
  </div> <div style="margin-top: 150px;"></div>


<div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="check">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

         <div class="text-center">

                <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="250px" placeholder="Detail" AutoPostBack="True"></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;"/>
                <br /><br />
            </div></div></div>
         </header>
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <br />
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
					<asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" 
					AutoGenerateColumns="False" AllowPaging="True"
					DataKeyNames="ID" CssClass="table table-hover table-striped"
					DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"> 
                     
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="No." > 
                                    <ItemTemplate>
                                        <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="ItemTypeID" HeaderText="ItemTypeID" SortExpression="ItemTypeID" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="ItemTypeName" SortExpression="Name" />
                            <asp:BoundField DataField="CheckID" HeaderText="CheckID" SortExpression="CheckID" />
                            <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                        SelectCommand="SELECT *,[ItemType].[Name] FROM [CheckItem] LEFT JOIN [ItemType] ON (ItemType.ID = CheckItem.ItemTypeID ) WHERE ([Detail] LIKE '%' + @Detail + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Detail" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
                <Triggers>
                </Triggers>
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
							DataKeyNames="ID" DataSourceID="SqlDataselect_Checkitem" Width="100%">
                                <AlternatingRowStyle Width="100%" />
                                <CommandRowStyle Width="100%" />
                                <EditRowStyle Width="100%" Height="30px" />
                                <EmptyDataRowStyle Width="100%" />
                                <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                                  <Fields>

                                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="false"/>

                                    <asp:TemplateField HeaderText="CheckID" SortExpression="CheckID">
                                        <EditItemTemplate>
                                            <asp:Label ID="lbCheckID" runat="server" Text='<%# Bind("CheckID") %>'></asp:Label>
                                        </EditItemTemplate>

                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CheckID") %>'></asp:TextBox>
                                        </InsertItemTemplate>

                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CheckID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ItemTypeName" >
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ItemTypeID") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ItemType]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ItemTypeID") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ItemType]"></asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>

                                            <asp:Label ID="lbTypeName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" />
                                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                </Fields>
                                <FooterStyle Width="100%" />
                                <HeaderStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                                <PagerStyle Width="100%" />
                                <RowStyle Width="100%"/>
                            </asp:DetailsView>

                            <asp:SqlDataSource ID="SqlDataselect_Checkitem" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" DeleteCommand="DELETE FROM [CheckItem] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CheckItem] ([CheckID], [ItemTypeID], [Detail]) VALUES (@CheckID, @ItemTypeID, @Detail)" SelectCommand="SELECT CheckItem.ID, CheckItem.CheckID, CheckItem.ItemTypeID, CheckItem.Detail, ItemType.Name FROM CheckItem INNER JOIN ItemType ON CheckItem.ItemTypeID = ItemType.ID WHERE (CheckItem.ID = @ID)" UpdateCommand="UPDATE [CheckItem] SET [CheckID] = @CheckID, [ItemTypeID] = @ItemTypeID, [Detail] = @Detail WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Byte" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CheckID" Type="String" />
                                    <asp:Parameter Name="ItemTypeID" Type="Byte" />
                                    <asp:Parameter Name="Detail" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CheckID" Type="String" />
                                    <asp:Parameter Name="ItemTypeID" Type="Byte" />
                                    <asp:Parameter Name="Detail" Type="String" />
                                    <asp:Parameter Name="ID" Type="Byte" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                          

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                DeleteCommand="DELETE FROM [CheckItem] WHERE [ID] = @ID" 
                                InsertCommand="INSERT INTO [CheckItem] ([CheckID], [ItemTypeID], [Detail]) VALUES (@CheckID, @ItemTypeID, @Detail)" 
                                SelectCommand="SELECT CheckItem.ID, CheckItem.CheckID, CheckItem.ItemTypeID, CheckItem.Detail, ItemType.Name FROM CheckItem INNER JOIN ItemType ON CheckItem.ItemTypeID = ItemType.ID WHERE (CheckItem.ID = @ID)" 
                                UpdateCommand="UPDATE CheckItem SET CheckID = @CheckID, ItemTypeID = @ItemTypeID, Detail = @Detail, Update_at = GETDATE(),Update_by = @BY WHERE (ID = @ID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="String" />
                                </DeleteParameters>

                                <InsertParameters>
                                    <asp:Parameter Name="CheckID" Type="String" />
                                    <asp:Parameter Name="ItemTypeID" Type="String" />
                                    <asp:Parameter Name="Detail" Type="String" />
                                </InsertParameters>

                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>

                                <UpdateParameters>
                                    <asp:Parameter Name="CheckID" Type="String" />
                                    <asp:Parameter Name="ItemTypeID" Type="String" />
                                    <asp:Parameter Name="Detail" Type="String" />
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
    </div>
</asp:Content>
