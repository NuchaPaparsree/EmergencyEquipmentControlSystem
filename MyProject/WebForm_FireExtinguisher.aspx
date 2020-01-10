<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_FireExtinguisher.aspx.cs" Inherits="MyProject.WebForm_FireExtinguisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 90%;
        }

        body, html {
            height: 100%
        }

        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Amatic SC", sans-serif
        }

        .menu {
            display: none
        }

        .bgimg {
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url("/Img/high.jpg");
            min-height: 100%;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:80px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
            <br>Fire Extinguisher</span></div> </div></div>
      <div class="text-center">
 <div style="margin-top: 50px;"></div>
    
     <br />
     <br />
        <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="250px" placeholder="Code"></asp:TextBox>
        Building:  <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="150px"  DataSourceID="SqlDataBuildingPlace" DataTextField="Building" DataValueField="Building" AutoPostBack="True" OnDataBound="DropDownList1_DataBound"></asp:DropDownList>
         Floor: <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="150px"  DataSourceID="SqlDataFloorPlace" DataTextField="Floor" DataValueField="Floor" AutoPostBack="True" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataFloorPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Floor FROM Place WHERE (Building LIKE '%' + @Building + '%')">
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="Building" PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataBuildingPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Building FROM Place"></asp:SqlDataSource>
         Area:  <asp:DropDownList ID="DropDownList3" runat="server" Height="30px" Width="150px"  AutoPostBack="True" DataSourceID="SqlDataAreaPlace" DataTextField="Area" DataValueField="Area" OnDataBound="DropDownList3_DataBound"></asp:DropDownList>

          <asp:SqlDataSource ID="SqlDataAreaPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Area FROM Place WHERE (Floor LIKE '%' + @Floor + '%')">
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList2" Name="Floor" PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>

        <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left:5px; Height:30px;"/>
<br /><br />
          </div>
         </header>
    <br />
         <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <asp:UpdatePanel ID="upCrudGrid" runat="server">
            <ContentTemplate>
				<asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" 
				AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped"
				DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." DataKeyNames="ID" AllowSorting="True"> 
                    <Columns>
                        <%--  <asp:TemplateField HeaderText="PhotoLink" > 
                                <ItemTemplate>
                                    <a href="../Photo/Ext<%#Eval("ID")%>.jpg"> Image </a>
                                </ItemTemplate>
                            </asp:TemplateField >--%>
                            <asp:TemplateField HeaderText="ID" > 
                                <ItemTemplate>
                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                            <asp:BoundField DataField="SubType" HeaderText="SubType" SortExpression="SubType" />
                            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                            <asp:BoundField DataField="WherePurchased" HeaderText="WherePurchased" SortExpression="WherePurchased" />
                        <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                        <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                        <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                            <asp:TemplateField HeaderText="PhotoLink" > 
                                <ItemTemplate>
                                     <a ID="ImagePreview" runat="server" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal">Image
                                       <img ID="Image1"  style="width:80px;height:80px; display:none;" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal" src="<%#Eval("Photo")%>""/>
                                   </a>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderText="LocationLink" > 
                                <ItemTemplate>
                                    <a href="<%# ((Eval("Location").ToString() == Convert.ToString("EA1")) ? "Location/Ext_A1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EA2") ? "Location/Ext_A2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EB2") ? "Location/Ext_B2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EC1") ? "Location/Ext_C1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EC2") ? "Location/Ext_C2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("ED1") ? "Location/Ext_D1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("ED2") ? "Location/Ext_D2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("ED3") ? "Location/Ext_D3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EE1") ? "Location/Ext_E1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EE2") ? "Location/Ext_E2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EE3") ? "Location/Ext_E3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EF1") ? "Location/Ext_F1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EF2") ? "Location/Ext_F2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EF3") ? "Location/Ext_F3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EG1") ? "Location/Ext_G1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EG2") ? "Location/Ext_G2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EG3") ? "Location/Ext_G3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EGG") ? "Location/Ext_GG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EH1") ? "Location/Ext_H1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EH2") ? "Location/Ext_H2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EH3") ? "Location/Ext_H3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EHG") ? "Location/Ext_HG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EI1") ? "Location/Ext_I1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EI2") ? "Location/Ext_I2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EI3") ? "Location/Ext_I3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("EIG") ? "Location/Ext_IG.pdf" 
                                                    : "#")))))))))))))))))))))))))) %>" target="_blank">Location</a>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderText="ReportLink" > 
                                <ItemTemplate>
                                    <a href="pdf_Report/Rep.Ext.1.pdf" target="_blank"> Report </a>
                                </ItemTemplate>
                            </asp:TemplateField >
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                    SelectCommand="SELECT ItemType.ID, Item.Code, ItemSubType.SubType, ItemSubType.Size, Place.Building, Place.Floor, Place.Area, ItemType.WherePurchased, ItemType.Report, ItemSubType.Photo, Item.Location FROM Item INNER JOIN Place ON Item.PlaceID = Place.ID LEFT OUTER JOIN ItemSubType ON ItemSubType.ID = Item.ItemSubTypeID LEFT OUTER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID WHERE (ItemType.ID = '1') AND (Item.Code LIKE '%' + @Code + '%') AND (Place.Floor LIKE '%' + @Floor + '%') AND (Place.Building LIKE '%' + @Building + '%') AND (Place.Area LIKE '%' + @Area + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Code" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="Floor" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Building" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="Area" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <div class="modal fade" id="myModal" role="dialog" style="display:none;">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3 class="modal-title">Fire Extiguisher</h3></div>
                            <div class="modal-body" align="center">
                                <asp:Image ID="ImageZoom" runat="server" width="300" Height="370"/>
                            </div>
                        <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
                    </div>  
                </div>
        </div>
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
