<%@ Page Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_ViewCheckSheet_User.aspx.cs" Inherits="MyProject.WebForm_ViewCheckSheet_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:100px; margin-bottom:10px; text-align:center;">
        <asp:SqlDataSource ID="SqlDataSourcePlaceID" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ID FROM Place WHERE (ControllerID = @ControllerID)">
            <SelectParameters>
                <asp:Parameter Name="ControllerID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label3" runat="server" Text="Year-Month : "></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="YearMonth" DataValueField="YearMonth" AutoPostBack="True" Width="140px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT CheckSheet.YearMonth FROM [Item] INNER JOIN [CheckSheetDetail] ON (Item.ID = CheckSheetDetail.ItemID) INNER JOIN [CheckSheet] ON (CheckSheet.ID = CheckSheetDetail.CheckSheetID) INNER JOIN [CheckItem] ON (CheckItem.ID = CheckSheetDetail.CheckItemID) INNER JOIN [ItemType] ON (ItemType.ID = CheckItem.ItemTypeID)  order by CheckSheet.YearMonth desc">
        </asp:SqlDataSource>

       

        &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Code : "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Code" DataValueField="ID" AutoPostBack="True" Width="180px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT       distinct Item.ID,Item.Code,ItemType.ID
FROM            Item INNER JOIN
                         ItemSubType ON ItemSubType.ID = Item.ItemSubTypeID LEFT JOIN
                         CheckSheetDetail ON Item.ID = CheckSheetDetail.ItemID INNER JOIN
                         CheckSheet ON CheckSheetDetail.CheckSheetID = CheckSheet.ID
	      INNER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID
WHERE        (CheckSheet.YearMonth = @yearmonth and CheckSheet.ControllerID = @ControllerID) order by ItemType.ID asc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="yearmonth" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnsearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnsearch_Click" />
        <br /><br />


        <div align="Center">
        <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource6"  >
                <RowStyle HorizontalAlign="Center" />
                <InsertRowStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    Column1:
                    <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
                    <br />
                    Column2:
                    <asp:TextBox ID="Column2TextBox" runat="server" Text='<%# Bind("Column2") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Column1:
                    <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
                    <br />
                    Column2:
                    <asp:TextBox ID="Column2TextBox" runat="server" Text='<%# Bind("Column2") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div >
                        <span class="auto-style1">Item Checked :</span>
                        <asp:LinkButton ID="Column1Label" runat="server" Text='<%# Bind("Column1") %>' style="font-size: large" data-toggle="modal" data-target="#ItemCheck" />
                        &nbsp;<span class="auto-style1">/ Item to Check :
                        <asp:LinkButton ID="Column2Label" runat="server" Text='<%# Bind("Column2") %>' style="font-size: large" data-toggle="modal" data-target="#ItemNoCheck"/>
                 
                        </span></div>
                </ItemTemplate>

            </asp:FormView>
        </div>

	    <asp:sqldatasource id="SqlDataSource6" runat="server" connectionstring="<%$ ConnectionStrings:xPimConnectionString1 %>"
    selectcommand="SELECT COUNT(DISTINCT CheckSheetDetail.ItemID) AS Column1, (SELECT COUNT(Item.ID) AS Expr1 FROM Item INNER JOIN Place ON Place.ID = Item.PlaceID INNER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.ControllerID = @ControllerID)) AS Column2 FROM CheckSheetDetail INNER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN ItemType ON ItemType.ID = CheckItem.ItemTypeID WHERE (CheckSheet.ControllerID = @ControllerID) AND (ItemType.ID IN (1, 2, 5)) AND (CheckSheet.YearMonth = @YearMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
                <asp:ControlParameter ControlID="DropDownList3" DefaultValue="0" Name="YearMonth" PropertyName="SelectedValue" />
            </SelectParameters>
	    </asp:sqldatasource>
        <br />
    </div>

<div class="container-fluid">
    <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" EmptyDataText="ไม่พบข้อมูล !!" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="OnRowDataBound" Width="100%">
        <Columns>
            <asp:BoundField DataField="CheckID" HeaderText="CheckID" SortExpression="CheckID" />
            <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" />
            <asp:CheckBoxField DataField="OK" HeaderText="OK" SortExpression="OK" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="NG" HeaderText="NG" SortExpression="NG" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="ImagePreview" runat="server" style="width:80px;height:80px" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal" ImageUrl="~/Img/emty-image.png"/>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" /></Columns>
    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT        CheckItem.Detail, CheckItem.CheckID, CheckSheetDetail.OK, CheckSheetDetail.NG, CheckSheetDetail.Picture, CheckSheetDetail.Comment
FROM            CheckSheetDetail INNER JOIN
                         CheckSheet ON CheckSheetDetail.CheckSheetID = CheckSheet.ID INNER JOIN
                         CheckItem ON CheckSheetDetail.CheckItemID = CheckItem.ID
WHERE ItemID = @ItemID AND YearMonth = @YearMonth  AND CheckSheet.ControllerID = @ControllerID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ItemID" PropertyName="SelectedValue" DefaultValue="" />
                    <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="YearMonth" PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
                </SelectParameters>
            </asp:SqlDataSource>


            

        <%////////////////////////////////////////////////// Status Item //////////////////////////////////////////////////////////////////////////////// %>
            <div class="modal hide fade" id="ItemCheck" role="dialog">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                    
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button><P>Item Check Already</P>
                        </div>
                    
                        <div class="modal-body">
                            <asp:GridView ID="gvItemChecked" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemChecked" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="529px">
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="Item Code" SortExpression="Code" >
                                    <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" >
                                    <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceItemChecked" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                                SelectCommand="SELECT dt.CheckSheetID, dt.YearMonth, Item.ID, dt.ItemID, Item.Code, Controller.ID AS ControllerID, Controller.Name, Place.Area, Place.ID AS Expr1, Item.Location FROM Item LEFT OUTER JOIN Place ON Item.PlaceID = Place.ID LEFT OUTER JOIN Controller ON Place.ControllerID = Controller.ID LEFT OUTER JOIN ItemSubType ON Item.ItemSubTypeID = ItemSubType.ID INNER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID LEFT OUTER JOIN (SELECT DISTINCT CheckSheet.ID AS CheckSheetID, CheckSheet.ControllerID, CheckSheetDetail.ItemID, CheckSheet.YearMonth FROM CheckSheetDetail LEFT OUTER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID WHERE (CheckSheet.YearMonth = CONVERT ([varchar] (7), GETDATE(), 120)) AND (CheckSheet.ControllerID = @ControllerID)) AS dt ON dt.ItemID = Item.ID WHERE (Controller.ID = @ControllerID) AND (dt.CheckSheetID IS NOT NULL) ">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />
                                    
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    
                    </div>  
                </div>        
            </div>

          <div class="modal hide fade" id="ItemNoCheck" role="dialog">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                    <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><P>Item No Check</P></div>
                    <div class="modal-body">
                        <asp:GridView ID="gvItemNocheck" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemNoCheck" Width="529px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                               
                                <asp:BoundField DataField="Code" HeaderText="Item Code" SortExpression="Code" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="LocationLink" > 
                                <ItemTemplate>
                                    <a href="<%# ((Eval("Location").ToString() == Convert.ToString("EA1")) ? "../PageAdmin/Location/Ext_A1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EA2") ? "../PageAdmin/Location/Ext_A2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EB2") ? "../PageAdmin/Location/Ext_B2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EC1") ? "../PageAdmin/Location/Ext_C1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EC2") ? "../PageAdmin/Location/Ext_C2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("ED1") ? "../PageAdmin/Location/Ext_D1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("ED2") ? "../PageAdmin/Location/Ext_D2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("ED3") ? "../PageAdmin/Location/Ext_D3.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EE1") ? "../PageAdmin/Location/Ext_E1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EE2") ? "../PageAdmin/Location/Ext_E2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EE3") ? "../PageAdmin/Location/Ext_E3.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EF1") ? "../PageAdmin/Location/Ext_F1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EF2") ? "../PageAdmin/Location/Ext_F2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EF3") ? "../PageAdmin/Location/Ext_F3.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EG1") ? "../PageAdmin/Location/Ext_G1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EG2") ? "../PageAdmin/Location/Ext_G2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EG3") ? "../PageAdmin/Location/Ext_G3.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EGG") ? "../PageAdmin/Location/Ext_GG.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EH1") ? "../PageAdmin/Location/Ext_H1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EH2") ? "../PageAdmin/Location/Ext_H2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EH3") ? "../PageAdmin/Location/Ext_H3.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EHG") ? "../PageAdmin/Location/Ext_HG.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EI1") ? "../PageAdmin/Location/Ext_I1.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EI2") ? "../PageAdmin/Location/Ext_I2.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EI3") ? "../PageAdmin/Location/Ext_I3.pdf" :
                                                     ((Eval("Location").ToString()) == Convert.ToString("EIG") ? "../PageAdmin/Location/Ext_IG.pdf" :
                                                     
                                                    ((Eval("Location").ToString() == Convert.ToString("HA1")) ? "../PageAdmin/Location/FHC_A1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HA2") ? "../PageAdmin/Location/FHC_A2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HB2") ? "../PageAdmin/Location/FHC_B2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HC1") ? "../PageAdmin/Location/FHC_C1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HC2") ? "../PageAdmin/Location/FHC_C2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HD1") ? "../PageAdmin/Location/FHC_D1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HD2") ? "../PageAdmin/Location/FHC_D2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HD3") ? "../PageAdmin/Location/FHC_D3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HE1") ? "../PageAdmin/Location/FHC_E1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HE2") ? "../PageAdmin/Location/FHC_E2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HE3") ? "../PageAdmin/Location/FHC_E3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HF1") ? "../PageAdmin/Location/FHC_F1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HF2") ? "../PageAdmin/Location/FHC_F2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HF3") ? "../PageAdmin/Location/FHC_F3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HG1") ? "../PageAdmin/Location/FHC_G1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HG2") ? "../PageAdmin/Location/FHC_G2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HG3") ? "../PageAdmin/Location/FHC_G3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HGG") ? "../PageAdmin/Location/FHC_GG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HH1") ? "../PageAdmin/Location/FHC_H1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HH2") ? "../PageAdmin/Location/FHC_H2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HH3") ? "../PageAdmin/Location/FHC_H3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HHG") ? "../PageAdmin/Location/FHC_HG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HI1") ? "../PageAdmin/Location/FHC_I1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HI2") ? "../PageAdmin/Location/FHC_I2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HI3") ? "../PageAdmin/Location/FHC_I3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("HIG") ? "../PageAdmin/Location/FHC_IG.pdf" :

                                                    ((Eval("Location").ToString() == Convert.ToString("BA1")) ? "../PageAdmin/Location/BELL_A1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BA2") ? "../PageAdmin/Location/BELL_A2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BB2") ? "../PageAdmin/Location/BELL_B2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BC1") ? "../PageAdmin/Location/BELL_C1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BC2") ? "../PageAdmin/Location/BELL_C2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BD1") ? "../PageAdmin/Location/BELL_D1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BD2") ? "../PageAdmin/Location/BELL_D2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BD3") ? "../PageAdmin/Location/BELL_D3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BE1") ? "../PageAdmin/Location/BELL_E1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BE2") ? "../PageAdmin/Location/BELL_E2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BE3") ? "../PageAdmin/Location/BELL_E3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BF1") ? "../PageAdmin/Location/BELL_F1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BF2") ? "../PageAdmin/Location/BELL_F2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BF3") ? "../PageAdmin/Location/BELL_F3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BG1") ? "../PageAdmin/Location/BELL_G1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BG2") ? "../PageAdmin/Location/BELL_G2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BG3") ? "../PageAdmin/Location/BELL_G3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BGG") ? "../PageAdmin/Location/BELL_GG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BH1") ? "../PageAdmin/Location/BELL_H1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BH2") ? "../PageAdmin/Location/BELL_H2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BH3") ? "../PageAdmin/Location/BELL_H3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BHG") ? "../PageAdmin/Location/BELL_HG.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BI1") ? "../PageAdmin/Location/BELL_I1.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BI2") ? "../PageAdmin/Location/BELL_I2.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BI3") ? "../PageAdmin/Location/BELL_I3.pdf" :
                                                    ((Eval("Location").ToString()) == Convert.ToString("BIG") ? "../PageAdmin/Location/BELL_IG.pdf" 

                                                     : "#")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) %>" target="_blank" >Location</a>
                                </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField >
  
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSourceItemNoCheck" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT dt.CheckSheetID, dt.YearMonth, Item.ID, dt.ItemID, Item.Code, Controller.ID AS ControllerID, Controller.Name, Place.Area, Place.ID AS Expr1, Item.Location FROM Item LEFT OUTER JOIN Place ON Item.PlaceID = Place.ID LEFT OUTER JOIN Controller ON Place.ControllerID = Controller.ID LEFT OUTER JOIN ItemSubType ON Item.ItemSubTypeID = ItemSubType.ID INNER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID LEFT OUTER JOIN (SELECT DISTINCT CheckSheet.ID AS CheckSheetID, CheckSheet.ControllerID, CheckSheetDetail.ItemID, CheckSheet.YearMonth FROM CheckSheetDetail LEFT OUTER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID WHERE (CheckSheet.YearMonth = CONVERT ([varchar] (7), GETDATE(), 120)) AND (CheckSheet.ControllerID = @ControllerID)) AS dt ON dt.ItemID = Item.ID WHERE (Controller.ID = @ControllerID) AND (dt.CheckSheetID IS NULL)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ControllerID" SessionField="myLoginID" />

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
                    </div>  
                </div>
         </div>
        
        <div class="modal hide fade" id="myModal" role="dialog">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                        <div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h3 class="modal-title">Modal Header</h3></div>
                            <div class="modal-body">
                                <asp:Image ID="ImageZoom" runat="server" width="100%" Height="100%"/>
                            </div>
                        <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
                    </div>  
                </div>
            </div>
</div>
    <script type="text/javascript">
            function SetZoomImage(ele)
        {
                var ImageDB = $(ele).closest('tr').find('[id*=ImagePreview]');
                var URL = $(ImageDB).attr("src");
                document.getElementById('<%=ImageZoom.ClientID%>').setAttribute('src', URL);
        };
    </script>
</asp:Content>
