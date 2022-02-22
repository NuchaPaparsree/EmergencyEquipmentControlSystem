<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_ItemType.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_ItemType" %>
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
            background-image: url("../Img/bann.jpg");
            min-height: 100%;
        }
</style>
 

<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:150px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
       
            <br>ITEMTYPE</span></div> </div></div>
    
      <div style="margin-top:100px;">
      <div class="text-center">
    <p><a href="#type" class="w3-button w3-xxlarge w3-black"  style="font-size:20px">LET ME SEE ITEMTYPE</a></p> </div>  
  </div> <div style="margin-top: 150px;"></div>
<div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">
  
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="type">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

         <div class="text-center">

            <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="250px" placeholder="Name" AutoPostBack="True"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;"/>
            <asp:Button ID="ButtonAdd" runat="server" Text="Add" class="btn btn-success" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;" data-toggle="modal" data-target="#AddNewItem"/>

        <br /><br />
             </div></div></div></header>
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1"><br />
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
					<asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" 
					AutoGenerateColumns="False" AllowPaging="True"
					DataKeyNames="ID" CssClass="table table-hover table-striped"
					DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowSorting="True"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="No." > 
                                <ItemTemplate>
                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField >

                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="WherePurchased" HeaderText="WherePurchased" SortExpression="WherePurchased" />
                            <asp:TemplateField HeaderText="ReportLink" > 

                                <ItemTemplate>
                                    <a href="<%# ((Eval("Name").ToString() == Convert.ToString("ถังดับเพลิง")) ? "pdf_Report/Rep.Ext.1.pdf" :
                                                 //((Eval("Name").ToString()) == Convert.ToString("กริ่งฉุกเฉิน") ? "pdf_Report/Rep.Bell.1.pdf" :
                                                 ((Eval("Name").ToString()) == Convert.ToString("ตู้เก็บสายฉีดน้ำดับเพลิง") ? "pdf_Report/Rep.Hose.1.pdf" : "#"))  %>" target="_blank">Report</a>
                                </ItemTemplate>
                            </asp:TemplateField >
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ItemType] WHERE ([Name] LIKE '%' + @Name + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Name" PropertyName="Text" Type="String" />
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
                                <EditRowStyle Width="100%" Height="30px" />
                                <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                                <Fields>
                                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="false"/>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="WherePurchased" HeaderText="WherePurchased" SortExpression="WherePurchased" />
                                    <asp:TemplateField HeaderText="Report" SortExpression="Report">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Report") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Report") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbLinkReport" runat="server" Text='<%# Bind("Report") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                </Fields>
                                <FooterStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                            </asp:DetailsView>

                            <!-- popup select edit  -->

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [ItemType] WHERE ([ID] = @ID)" 
                                DeleteCommand="DELETE FROM [ItemType] WHERE [ID] = @ID" 
                                InsertCommand="INSERT INTO [ItemType] ([Name], [WherePurchased], [Report]) VALUES (@Name, @WherePurchased, @Report)" 
                                UpdateCommand="UPDATE ItemType SET Name = @Name, WherePurchased = @WherePurchased, Report = @Report, Update_at = GETDATE() ,Update_by = @BY WHERE (ID = @ID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="WherePurchased" Type="String" />
                                    <asp:Parameter Name="Report" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="WherePurchased" Type="String" />
                                    <asp:Parameter Name="Report" Type="String" />
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

      <!--เปิด popup Add ให้ปิด class="modal hide fade"  -->
        <div id="AddNewItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="AddLabel">Detailed View</h3>
            </div>
            <div class="modal-body">
                <asp:DetailsView ID="DetailsView2" runat="server" CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black"
                    FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true"
                    FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black"
                    BorderStyle="Groove" AutoGenerateRows="False" Width="100%" DataKeyNames="ID" DefaultMode="Insert" DataSourceID="SqlDataSource5">
                    <EditRowStyle Width="100%" Height="30px" />

                    <FieldHeaderStyle Wrap="False" BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black"></FieldHeaderStyle>
                    <Fields>

                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="WherePurchased" HeaderText="WherePurchased" SortExpression="WherePurchased" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>


                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                    DeleteCommand="DELETE FROM ItemType] WHERE [ID] = @ID"
                    InsertCommand="INSERT INTO ItemType(Name, WherePurchased,   Update_at,Update_by) VALUES (@Name, @WherePurchased,GETDATE(), @AT)" 
                    SelectCommand="SELECT * FROM [ItemType]" UpdateCommand="UPDATE [ItemType] SET [Name] = @Name, [WherePurchased] = @WherePurchased WHERE [ID] = @ID">

                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="String"/>
                    </DeleteParameters>

                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="WherePurchased" Type="String" />       
                        <asp:SessionParameter Name="AT" Type="String" SessionField="myLoginID" />
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"/>
                        <asp:Parameter Name="WherePurchased" Type="String"/>                      
                       </UpdateParameters>

                </asp:SqlDataSource>
                <div class="modal-footer">
                    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true" />
                </div>
            </div>
        </div>

</asp:Content>
