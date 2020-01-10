<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_FireHose.aspx.cs" Inherits="MyProject.WebForm_FireHose" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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

    <header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
 
  <div class="w3-display-middle w3-center">
        <div style="padding-top:80px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
        <div class="text-center">
       
            <br>Fire Hose</span></div> </div></div>
      <div class="text-center">
 <div style="margin-top: 50px;"></div>
    
        <br /><br />
        
        <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="250px" placeholder="Code"></asp:TextBox>
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
				DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." DataKeyNames="ID"> 
                    <Columns>
                            <asp:TemplateField HeaderText="ID" > 
                                <ItemTemplate>
                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                            <asp:BoundField DataField="SubType" HeaderText="SubType" SortExpression="SubType" />
                            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                            <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                            <asp:BoundField DataField="DatePurchased" HeaderText="DatePurchased" SortExpression="DatePurchased" />
                            <asp:BoundField DataField="WherePurchased" HeaderText="WherePurchased" SortExpression="WherePurchased" />
                            <asp:BoundField DataField="PurchasePrice" HeaderText="PurchasePrice" SortExpression="PurchasePrice" />
                            <asp:TemplateField HeaderText="PhotoLink" > 
                                <ItemTemplate>
                                    <a ID="ImagePreview" runat="server" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal">Image
                                       <img ID="Image1"  style="width:80px;height:80px; display:none;" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal" src="<%#Eval("Photo")%>""/>
                                   </a>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderText="LocationLink" > 
                                <ItemTemplate>
                                    <a href="<%# ((Eval("Location").ToString() == Convert.ToString("HA1")) ? "Location/FHC_A1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HA2") ? "Location/FHC_A2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HB2") ? "Location/FHC_B2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HC1") ? "Location/FHC_C1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HC2") ? "Location/FHC_C2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HD1") ? "Location/FHC_D1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HD2") ? "Location/FHC_D2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HD3") ? "Location/FHC_D3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HE1") ? "Location/FHC_E1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HE2") ? "Location/FHC_E2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HE3") ? "Location/FHC_E3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HF1") ? "Location/FHC_F1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HF2") ? "Location/FHC_F2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HF3") ? "Location/FHC_F3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HG1") ? "Location/FHC_G1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HG2") ? "Location/FHC_G2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HG3") ? "Location/FHC_G3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HGG") ? "Location/FHC_GG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HH1") ? "Location/FHC_H1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HH2") ? "Location/FHC_H2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HH3") ? "Location/FHC_H3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HHG") ? "Location/FHC_HG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HI1") ? "Location/FHC_I1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HI2") ? "Location/FHC_I2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HI3") ? "Location/FHC_I3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HIG") ? "Location/FHC_IG.pdf" 
                                                    : "#")))))))))))))))))))))))))) %>" target="_blank" >Location</a>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderText="ReportLink" > 
                                <ItemTemplate>
                                    <a href="pdf_Report/Rep.Hose.1.pdf" target="_blank"> Report </a>
                                </ItemTemplate>
                            </asp:TemplateField >
<%--                                <asp:TemplateField HeaderText="PhotoLink" > 
                                <ItemTemplate>
                                    <a href="../Photo/Ext<%#Eval("ID")%>.jpg"> Image </a>
                                </ItemTemplate>
                            </asp:TemplateField >--%>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT [ItemType].[ID],[Item].[Code],[ItemSubType].[SubType],[ItemSubType].[Size],[Item].[SerialNumber],[Item].[DatePurchased],[ItemType].[WherePurchased],[ItemSubType].[PurchasePrice],[ItemType].[Report],[ItemSubType].[Photo],[Item].[Location] FROM [Item] LEFT JOIN [ItemSubType] ON (ItemSubType.ID = Item.ItemSubTypeID ) LEFT JOIN [ItemType] ON (ItemType.ID = ItemSubType.ItemTypeID ) WHERE ([ItemType].[ID]='5' AND ([Item].[Code] LIKE '%' + @Code + '%'))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Code" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

         <div class="modal fade" id="myModal" role="dialog" style="display:none;">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3 class="modal-title">Fire Hose</h3></div>
                            <div class="modal-body">
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
