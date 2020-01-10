<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_ItemSubType.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_ItemSubType" %>
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
          background-image: url("../Img/health-safety-hero.jpg");
          min-height: 100%;
      }
</style>
    <style>
        body {
            background-image: url("/Img/LV-01-Grey.jpg");
            background-repeat: repeat;
        }
</style>

<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:150px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
       
            <br>ITEMSUBTYPE</span></div> </div></div>

      <div style="margin-top:100px;">
      <div class="text-center">
    <p><a href="#sub" class="w3-button w3-xxlarge w3-black"  style="font-size:20px">LET ME SEE ITEMSUBTYPE</a></p> </div>  
  </div> <div style="margin-top: 150px;"></div>
             

<div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">
  
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="sub">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

         <div class="text-center">

            <asp:TextBox ID="TextBoxSubType" runat="server" Height="25px" Width="250px" placeholder="SubType" AutoPostBack="True"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:5px; margin-bottom:11px; Height:30px;"/>
        <br /><br />


             </div></div></div></header>
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1"><br />
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
					<asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" 
					AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped"
					DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                                <asp:TemplateField HeaderText="No." > 
                                    <ItemTemplate>
                                        <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField >

                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" Visible="False"/>
                                <%--<asp:BoundField DataField="Report" HeaderText="Report" SortExpression="Report" />--%>
                                <%--<asp:BoundField DataField="ItemTypeID" HeaderText="ItemTypeID" SortExpression="ItemTypeID"/>--%>
                                <asp:BoundField DataField="Name" HeaderText="ItemTypeName" SortExpression="Name" />
                                <asp:BoundField DataField="SubType" HeaderText="SubType" SortExpression="SubType" />
                                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                <asp:BoundField DataField="PurchasePrice" HeaderText="PurchasePrice" SortExpression="PurchasePrice" />
                                <asp:TemplateField HeaderText="PhotoLink" > 
                                    <ItemTemplate>
                                     <a ID="ImagePreview" runat="server" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal">Image
                                       <img ID="Image1"  style="width:80px;height:80px; display:none;" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal" src="<%#Eval("Photo")%>""/>
                                     </a>
                                        <%--<a href="<%# ((Eval("SubType").ToString() == Convert.ToString("Dry Chemical")) ?
                                                     ((Eval("Size").ToString()) == Convert.ToString("10 lb") ? "Photo/Ext1.jpg" : 
                                                     ((Eval("Size").ToString()) == Convert.ToString("15 lb") ? "Photo/Ext2.jpg" : "#"))  :

                                                     (Eval("SubType").ToString() == Convert.ToString("Carbondioxide")) ?
                                                     ((Eval("Size").ToString()) == Convert.ToString("5 lb") ? "Photo/Ext3.jpg" : 
                                                     ((Eval("Size").ToString()) == Convert.ToString("10 lb") ? "Photo/Ext4.jpg" :                                                      
                                                     ((Eval("Size").ToString()) == Convert.ToString("15 lb") ? "Photo/Ext5.jpg" : "#"))) : 

                                                     (Eval("SubType").ToString() == Convert.ToString("ABFFC")) ?
                                                     ((Eval("Size").ToString()) == Convert.ToString("10 lb") ? "Photo/Ext6.jpg" : 
                                                     ((Eval("Size").ToString()) == Convert.ToString("15 lb") ? "Photo/Ext7.jpg" : "#")) :

                                                     (Eval("SubType").ToString() == Convert.ToString("Sodium Chloride")) ?
                                                     ((Eval("Size").ToString()) == Convert.ToString("10 lb") ? "Photo/Ext8.jpg" : "#") :

                                                     ((Eval("SubType").ToString() == Convert.ToString("Fire Hose Rack")) ? "Photo/Fhc1.jpg"  :

                                                     ((Eval("SubType").ToString()) == Convert.ToString("Bell & FHC") ? "Photo/Bell1.jpg" : 
                                                     ((Eval("SubType").ToString()) == Convert.ToString("Bell") ? "Photo/Bell2.jpg" :
                                                   
                                                     ((Eval("SubType").ToString() == Convert.ToString("El Inspect")) ? "Photo/EI1.png"  :
                                                     ((Eval("SubType").ToString() == Convert.ToString("Dt Inspect")) ? "Photo/Dt1.png"  :
                                                     ((Eval("SubType").ToString() == Convert.ToString("Chem Inspect")) ? "Photo/Chem1.jpg"  :
                                                     ((Eval("SubType").ToString() == Convert.ToString("FD Inspect")) ? "Photo/FD1.jpg"  :
                                                     ((Eval("SubType").ToString() == Convert.ToString("Elec Inspect")) ? "Photo/Elec1.jpg"  
                                                     : "#"))))))))) %>" >Image</a>--%>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT TOP(10000) [ItemSubType].[ID],[ItemSubType].[ItemTypeID],[ItemType].[Name],[ItemsubType].[SubType],[ItemsubType].[Size],[ItemSubType].[PurchasePrice],[ItemSubType].[photo] FROM [ItemType] LEFT JOIN [ItemSubType] ON (ItemType.ID = ItemSubType.ItemTypeID ) WHERE ([ItemsubType].[SubType] LIKE '%' + @SubType + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSubType" DefaultValue="%" Name="SubType" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
                <Triggers> 
                </Triggers>
            </asp:UpdatePanel>
			
            <!-- Detail Modal Starts here-->
            <!--เปิด pop ให้ปิด class="modal hide fade"  -->
            <div id="detailModal"  class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
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
							BorderStyle="Groove" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Width="100%" DataKeyNames="ID" > 
                                <EditRowStyle Width="100%" Height="30px" />
                                <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                                <Fields>
                     <%--    <asp:BoundField DataField="Report" HeaderText="Report" SortExpression="Report" />--%>
                                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" InsertVisible="false"/>
                                    <asp:TemplateField HeaderText="ItemTypeName" >
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ItemTypeID") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ItemType] "></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ItemTypeID") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ItemType]"></asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbItemTypeName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SubType" HeaderText="SubType" SortExpression="SubType" />
                                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                    <asp:BoundField DataField="PurchasePrice" HeaderText="PurchasePrice" SortExpression="PurchasePrice" />
                                    <asp:CommandField ShowEditButton="True" />
                                </Fields>
                                <FooterStyle Width="100%" />
                                <InsertRowStyle Width="100%" Height="30px" />
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                    SelectCommand="SELECT ItemSubType.ID, ItemSubType.ItemTypeID, ItemSubType.SubType, ItemSubType.Size, ItemSubType.PurchasePrice, ItemSubType.Photo, ItemType.Name FROM ItemSubType INNER JOIN ItemType ON ItemSubType.ItemTypeID = ItemType.ID WHERE (ItemSubType.ID = @ID)" 
                                    UpdateCommand="UPDATE ItemSubType SET ItemTypeID = @ItemTypeID, SubType = @SubType, Size = @Size, PurchasePrice = @PurchasePrice, Update_at = GETDATE(),Update_by = @BY WHERE (ID = @ID)" 
                                    DeleteCommand="DELETE FROM [ItemSubType] WHERE [ID] = @ID" 
                                    InsertCommand="INSERT INTO [ItemSubType] ([ItemTypeID], [SubType], [Size], [PurchasePrice]) VALUES (@ItemTypeID, @SubType, @Size, @PurchasePrice)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="ItemTypeID" Type="String" />
                                        <asp:Parameter Name="SubType" Type="String" />
                                        <asp:Parameter Name="Size" Type="String" />
                                        <asp:Parameter Name="PurchasePrice" Type="String" />
                                    </InsertParameters>

                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>

                                    <UpdateParameters>
                                        <asp:Parameter Name="ItemTypeID" Type="String" />
                                        <asp:Parameter Name="SubType" Type="String" />
                                        <asp:Parameter Name="Size" Type="String" />
                                        <asp:Parameter Name="PurchasePrice" Type="String" />
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
                    <%--        <asp:Parameter Name="Location" Type="Image" />--%>
		            <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true"/>
                </div>
            </div>

         <div class="modal fade" id="myModal" role="dialog" style="display:none;">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3 class="modal-title">Item Sub Type</h3></div>
                            <div class="modal-body">
                                <asp:Image ID="ImageZoom" runat="server" width="300" Height="370"/>
                            </div>
                        <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
                    </div>  
                </div>
         </div>
        <!-- Detail Modal Ends here -->
    </div>

    <script>
        function SetZoomImage(ele) {
            var x = document.getElementById("myModal");
            if (x.style.display === "none") {
                x.style.display = "block";
            }
            else {
                x.style.display = "none";
            }
            var ImageDB = $(ele).closest('tr').find('[id*=Image1]');
            var URL = $(ImageDB).attr("src");
            document.getElementById('<%=ImageZoom.ClientID%>').setAttribute('src', URL);
        };
    </script>
</asp:Content>
