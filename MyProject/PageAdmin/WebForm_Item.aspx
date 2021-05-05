 <%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Item.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_Item" %>

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
            background-image: url("../Img/Safety-Engineering-1243x431.jpg");
            min-height: 100%;
        }
    </style>


    <header class="bgimg w3-display-container w3-grayscale-min" id="home">
        <div class="w3-display-bottomleft w3-padding">

            <div class="w3-display-middle w3-center">
                <div style="padding-top: 150px;">
                    <span class="w3-text-white w3-hide-small" style="font-size: 100px">
                        <div class="text-center">

                            <br>
                        ITEM</div>
                    </span>
                </div>
            </div>
        </div>

        <div style="margin-top: 100px;">
            <div class="text-center">
                <p><a href="#item" class="w3-button w3-xxlarge w3-black" style="font-size: 20px">LET ME SEE ITEM</a></p>
            </div>
        </div>
        <div style="margin-top: 150px;"></div>



        <div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">

            <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="item">
                <div class="w3-content">
                </div>
                <h1 class="w3-center w3-jumbo" style="margin-bottom: 64px"></h1>
                <div class="text-center">
                    <asp:TextBox ID="TextBoxSearch" runat="server" Height="25px" Width="150px" placeholder="Code" AutoPostBack="True"></asp:TextBox>
                    TypeName :
                    <asp:DropDownList ID="DropDownList5" runat="server" Height="30px" Width="150px" AutoPostBack="True" DataSourceID="DataNameItemType" DataTextField="Name" DataValueField="Name" OnDataBound="DropDownList5_DataBound"></asp:DropDownList>
                    <asp:SqlDataSource ID="DataNameItemType" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Name, ID FROM ItemType ORDER BY ID"></asp:SqlDataSource>
                    Building :
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="150px" DataSourceID="datasourcebuild" DataTextField="Building" DataValueField="Building" AutoPostBack="True" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
                    <asp:SqlDataSource ID="datasourcebuild" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Building FROM Place ORDER BY Building"></asp:SqlDataSource>
                    Floor :
                    <asp:DropDownList ID="DropDownList3" runat="server" Height="30px" Width="150px" DataSourceID="dataFloorPlace" DataTextField="Floor" DataValueField="Floor" AutoPostBack="True" OnDataBound="DropDownList3_DataBound"></asp:DropDownList>
                    <asp:SqlDataSource ID="dataFloorPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Floor FROM Place WHERE Building LIKE '%'+ @Build +'%'">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Build" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    Area :
                    <asp:DropDownList ID="DropDownList4" runat="server" Height="30px" Width="150px" DataSourceID="dataAreaPlace" DataTextField="Area" DataValueField="Area" AutoPostBack="True" OnDataBound="DropDownList4_DataBound"></asp:DropDownList>
                    <asp:SqlDataSource ID="dataAreaPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT Area FROM Place  WHERE Building LIKE '%' + @Build +'%' AND Floor LIKE '%' +@Floor + '%'  GROUP BY Area ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Build" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList3" Name="Floor" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDSPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
                        SelectCommand="SELECT Place.ID, 'Building : ' + Place.Building + CASE WHEN Floor &lt;&gt; '' THEN ', Floor : ' + Floor ELSE ' ' END + ', ' + 'Area : ' + Place.Area AS Location, Place.Building, Place.Floor, Place.Area, Controller.Name 
FROM Place INNER JOIN Controller ON Place.ControllerID = Controller.ID
 WHERE Controller.Name LIKE '%'+@Name+'%'"></asp:SqlDataSource>
                    <asp:Button ID="ButtonSearch" CssClass="btn btn-primary" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left: 5px; margin-bottom: 11px; height: 30px;" Visible="False" />
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" aria-hidden="true" Style="margin-left: 5px; margin-bottom: 11px; height: 30px;" data-toggle="modal" data-target="#AddNewItem" />
                    <br />
                    <br />
                </div>
            </div>
    </header>

    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <br />
        <asp:UpdatePanel ID="upCrudGrid" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center"
                    AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-hover table-striped"
                    DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" AllowSorting="True" BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <%--<asp:TemplateField HeaderText="No." > 
                                    <ItemTemplate>
                                        <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField >--%>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" Visible="True" />
                        <asp:BoundField DataField="ItemSubTypeID" HeaderText="ItemSubTypeID" SortExpression="ItemSubTypeID" Visible="False" />
                        <asp:BoundField DataField="Name" HeaderText="ItemTypeName" SortExpression="Name" />
                        <asp:BoundField DataField="SubType" HeaderText="SubType" SortExpression="SubType" />
                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                        <%--  <asp:BoundField DataField="SerialNumber" HeaderText="SerialNum." SortExpression="SerialNumber" />
                                <asp:BoundField DataField="DatePurchased" HeaderText="DatePur." SortExpression="DatePurchased" />--%>
                        <asp:BoundField DataField="PlaceID" HeaderText="PlaceID" SortExpression="PlaceID" Visible="False" />
                        <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                        <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />


                        <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        <asp:TemplateField HeaderText="LocationLink">
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
                                                     ((Eval("Location").ToString()) == Convert.ToString("EIG") ? "Location/Ext_IG.pdf" :
                                                     
                                                    ((Eval("Location").ToString() == Convert.ToString("HA1")) ? "Location/FHC_A1.pdf" :
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
                                                    ((Eval("Location").ToString()) == Convert.ToString("HIG") ? "Location/FHC_IG.pdf" :

                                                    ((Eval("Location").ToString() == Convert.ToString("BA1")) ? "Location/BELL_A1.pdf" :
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

                                                     : "#")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) %>"
                                    target="_blank">Location</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="QR CODE">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Img/qr-code.png" CommandName="printqr" CommandArgument='<%#Eval("ID")%>' Height="50px" />
                                <%--<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# "~/Report/ReportCheckSheet.aspx?ItemSubTypeID=" + Eval("ItemSubTypeID")%>' OnClick="lbtnReport_Click" Height="50px" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                </div> 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
                        SelectCommand="SELECT Item.ID, Item.ItemSubTypeID, ItemType.Name, ItemSubType.SubType, Item.Code, Item.SerialNumber, Item.DatePurchased, Item.PlaceID, Place.Building, Place.Floor, Place.Area, Item.Location FROM Item LEFT OUTER JOIN ItemSubType ON ItemSubType.ID = Item.ItemSubTypeID LEFT OUTER JOIN Place ON Place.ID = Item.PlaceID 
                        LEFT OUTER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID 
                        WHERE (Item.Code LIKE '%' + @Code + '%') AND (Place.Building LIKE '%' + @Build + '%') AND (Place.Floor LIKE '%' + @Floor +'%') AND (Place.Area LIKE '%' + @Area +'%') AND (ItemType.Name LIKE '%' + @Name +'%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="%" Name="Code" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Build" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList3" Name="Floor" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList4" Name="Area" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DropDownList5" DefaultValue="" Name="Name" PropertyName="SelectedValue" />
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
                            BorderStyle="Groove" AutoGenerateRows="False" DataSourceID="SqlDataSelect_item" Width="100%" DataKeyNames="ID">
                            <EditRowStyle Width="100%" Height="30px" />
                            <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                               <Fields>
                                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" InsertVisible="false"/>
                                    <asp:TemplateField HeaderText="ItemSubType" SortExpression="ItemSubTypeID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="MyColumn" DataValueField="ID" SelectedValue='<%# Bind("ItemSubTypeID") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT *,( SubType + ' , ' + Size ) AS MyColumn FROM [ItemSubType] "></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ItemSubTypeID") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbItemSubType" runat="server" Text='<%# Bind("SubType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                    <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                                    <asp:BoundField DataField="DatePurchased" HeaderText="DatePurchased" SortExpression="DatePurchased" />
                                    <asp:TemplateField HeaderText="Place" SortExpression="PlaceID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="MyColumn" DataValueField="ID" SelectedValue='<%# Bind("PlaceID") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT *,( Building + ' , ' + Floor + ' , ' + Area ) AS MyColumn FROM [Place] "></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PlaceID") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbPlace" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                </Fields>

                            <FooterStyle Width="100%" />
                            <InsertRowStyle Width="100%" Height="30px" />
                        </asp:DetailsView>

                        <asp:SqlDataSource ID="SqlDataSelect_item" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" DeleteCommand="DELETE FROM [Item] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Item] ([ItemSubTypeID], [Code], [SerialNumber], [DatePurchased], [PlaceID], [Location]) VALUES (@ItemSubTypeID, @Code, @SerialNumber, @DatePurchased, @PlaceID, @Location)" SelectCommand="SELECT Item.ItemSubTypeID, Item.Code, Item.SerialNumber, Item.DatePurchased, Item.PlaceID, Item.Location, Place.Building + ' , ' + Place.Floor + ' , ' + Place.Area AS Area, ItemSubType.SubType + ' , ' + ItemSubType.Size AS SubType, Item.ID FROM Item INNER JOIN Place ON Item.PlaceID = Place.ID INNER JOIN ItemSubType ON Item.ItemSubTypeID = ItemSubType.ID WHERE (Item.ID = @ID)" UpdateCommand="UPDATE [Item] SET [ItemSubTypeID] = @ItemSubTypeID, [Code] = @Code, [SerialNumber] = @SerialNumber, [DatePurchased] = @DatePurchased, [PlaceID] = @PlaceID, [Location] = @Location WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ItemSubTypeID" Type="Byte" />
                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="SerialNumber" Type="String" />
                                <asp:Parameter Name="DatePurchased" Type="String" />
                                <asp:Parameter Name="PlaceID" Type="Int32" />
                                <asp:Parameter Name="Location" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ItemSubTypeID" Type="Byte" />
                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="SerialNumber" Type="String" />
                                <asp:Parameter Name="DatePurchased" Type="String" />
                                <asp:Parameter Name="PlaceID" Type="Int32" />
                                <asp:Parameter Name="Location" Type="String" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true" />
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
                            BorderStyle="Groove" AutoGenerateRows="False" DataSourceID="SqlDataSourceADD" Width="100%" DataKeyNames="ID" DefaultMode="Insert">
                            <EditRowStyle Width="100%" Height="30px" />
                            <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="30%" />
                            <Fields>
                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" InsertVisible="false" />

                                <asp:TemplateField HeaderText="ItemSubTypeID" SortExpression="ItemSubTypeID">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlAddSubType" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAddSubType" DataTextField="MyColumn" DataValueField="ID" SelectedValue='<%# Bind("ItemSubTypeID") %>' Width="100%">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceAddSubType" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT *,( SubType + ' , ' + Size ) AS MyColumn FROM [ItemSubType]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" SortExpression="SerialNumber" />
                                <asp:BoundField DataField="DatePurchased" HeaderText="DatePurchased" SortExpression="DatePurchased" />
                                <asp:TemplateField HeaderText="PlaceID" SortExpression="PlaceID">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlAddPlace" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceAddPlace" DataTextField="MyColumn" DataValueField="ID" SelectedValue='<%# Bind("PlaceID") %>' Width="100%">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceAddPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT *,( Building + ' , ' + Floor + ' , ' + Area ) AS MyColumn FROM [Place]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                            <FooterStyle Width="100%" />
                            <InsertRowStyle Width="100%" Height="30px" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSourceADD" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
                            SelectCommand="SELECT * FROM [Item]" UpdateCommand="UPDATE [Item] SET [ItemSubTypeID] = @ItemSubTypeID, [Code] = @Code, [SerialNumber] = @SerialNumber, [DatePurchased] = @DatePurchased, [PlaceID] = @PlaceID, [Location] = @Location WHERE [ID] = @original_ID AND (([ItemSubTypeID] = @original_ItemSubTypeID) OR ([ItemSubTypeID] IS NULL AND @original_ItemSubTypeID IS NULL)) AND (([Code] = @original_Code) OR ([Code] IS NULL AND @original_Code IS NULL)) AND (([SerialNumber] = @original_SerialNumber) OR ([SerialNumber] IS NULL AND @original_SerialNumber IS NULL)) AND (([DatePurchased] = @original_DatePurchased) OR ([DatePurchased] IS NULL AND @original_DatePurchased IS NULL)) AND (([PlaceID] = @original_PlaceID) OR ([PlaceID] IS NULL AND @original_PlaceID IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL))"
                            DeleteCommand="DELETE FROM [Item] WHERE [ID] = @original_ID AND (([ItemSubTypeID] = @original_ItemSubTypeID) OR ([ItemSubTypeID] IS NULL AND @original_ItemSubTypeID IS NULL)) AND (([Code] = @original_Code) OR ([Code] IS NULL AND @original_Code IS NULL)) AND (([SerialNumber] = @original_SerialNumber) OR ([SerialNumber] IS NULL AND @original_SerialNumber IS NULL)) AND (([DatePurchased] = @original_DatePurchased) OR ([DatePurchased] IS NULL AND @original_DatePurchased IS NULL)) AND (([PlaceID] = @original_PlaceID) OR ([PlaceID] IS NULL AND @original_PlaceID IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL))"
                            InsertCommand="INSERT INTO Item(ItemSubTypeID, Code, SerialNumber, DatePurchased, PlaceID, Location, Create_at,Create_by) VALUES (@ItemSubTypeID, @Code, @SerialNumber, @DatePurchased, @PlaceID, @Location, GETDATE(),@AT)" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">

                            <DeleteParameters>
                                <asp:Parameter Name="original_ID" />
                                <asp:Parameter Name="original_ItemSubTypeID" />
                                <asp:Parameter Name="original_Code" />
                                <asp:Parameter Name="original_SerialNumber" />
                                <asp:Parameter Name="original_DatePurchased" />
                                <asp:Parameter Name="original_PlaceID" />
                                <asp:Parameter Name="original_Location" />
                            </DeleteParameters>

                            <InsertParameters>
                                <asp:Parameter Name="ItemSubTypeID" Type="String" />
                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="SerialNumber" Type="String" />
                                <asp:Parameter Name="DatePurchased" Type="String" />
                                <asp:Parameter Name="PlaceID" Type="String" />
                                <asp:Parameter Name="Location" Type="String" />
                                <asp:SessionParameter Name="AT" Type="String" SessionField="myLoginID" />
                            </InsertParameters>

                            <UpdateParameters>
                                <asp:Parameter Name="ItemSubTypeID" />
                                <asp:Parameter Name="Code" />
                                <asp:Parameter Name="SerialNumber" />
                                <asp:Parameter Name="DatePurchased" />
                                <asp:Parameter Name="PlaceID" />
                                <asp:Parameter Name="Location" />
                                <asp:Parameter Name="original_ID" />
                                <asp:Parameter Name="original_ItemSubTypeID" />
                                <asp:Parameter Name="original_Code" />
                                <asp:Parameter Name="original_SerialNumber" />
                                <asp:Parameter Name="original_DatePurchased" />
                                <asp:Parameter Name="original_PlaceID" />
                                <asp:Parameter Name="original_Location" />
                            </UpdateParameters>

                        </asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true" />
            </div>
        </div>
 </asp:Content>
