<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Bell.aspx.cs" Inherits="MyProject.WebForm_Bell" %>
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
       
            <br>Bell</span></div> </div></div>
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
                                    <a target="_blank" href="<%# ((Eval("Location").ToString() == Convert.ToString("BA1")) ? "Location/BELL_A1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BA2") ? "Location/BELL_A2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BB2") ? "Location/BELL_B2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BC1") ? "Location/BELL_C1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BC2") ? "Location/BELL_C2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BD1") ? "Location/BELL_D1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BD2") ? "Location/BELL_D2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BD3") ? "Location/BELL_D3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BE1") ? "Location/BELL_E1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BE2") ? "Location/BELL_E2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BE3") ? "Location/BELL_E3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BF1") ? "Location/BELL_F1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BF2") ? "Location/BELL_F2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BF3") ? "Location/BELL_F3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BG1") ? "Location/BELL_G1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BG2") ? "Location/BELL_G2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BG3") ? "Location/BELL_G3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BGG") ? "Location/BELL_GG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BH1") ? "Location/BELL_H1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BH2") ? "Location/BELL_H2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BH3") ? "Location/BELL_H3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BHG") ? "Location/BELL_HG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BI1") ? "Location/BELL_I1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BI2") ? "Location/BELL_I2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BI3") ? "Location/BELL_I3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BIG") ? "Location/BELL_IG.pdf" 
                                                    : "#")))))))))))))))))))))))))) %>" >Location</a>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderText="ReportLink" > 
                                <ItemTemplate>
<%--                                    <a href="pdf_Report/Rep.Bell.1.pdf"> Report </a>--%>
                                </ItemTemplate>
                            </asp:TemplateField >
<%--                                <asp:TemplateField HeaderText="PhotoLink" > 
                                <ItemTemplate>
                                    <a href="../Photo/Ext<%#Eval("ID")%>.jpg"> Image </a>
                                </ItemTemplate>
                            </asp:TemplateField >--%>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT [ItemType].[ID],[Item].[Code],[ItemSubType].[SubType],[ItemSubType].[Size],[Item].[SerialNumber],[Item].[DatePurchased],[ItemType].[WherePurchased],[ItemSubType].[PurchasePrice],[ItemType].[Report],[ItemSubType].[Photo],[Item].[Location] FROM [Item] LEFT JOIN [ItemSubType] ON (ItemSubType.ID = Item.ItemSubTypeID ) LEFT JOIN [ItemType] ON (ItemType.ID = ItemSubType.ItemTypeID ) WHERE ([ItemType].[ID]='2' AND ([Item].[Code] LIKE '%' + @Code + '%'))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Code" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

         
    </div>
    <div class="modal fade" id="myModal" role="dialog" style="display:none;">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3 class="modal-title">Bell</h3></div>
                            <div class="modal-body" align="center">
                                <asp:Image ID="ImageZoom" runat="server" width="300" Height="370"/>
                            </div>
                        <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
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
