<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFCSD.aspx.cs" Inherits="MyProject.PageUser.WFCSD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link runat="server" href="~/MyBootStrap/bootstrap.min.css" rel="stylesheet" />
    <script src="../MyBootStrap/jquery.min.js"></script>
    <script src="../MyBootStrap/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        .radioall {
            margin: 4px 4px 4px;
        }

        /*tr:nth-child(even){background-color: #f2f2f2}
        .auto-style1 {
            font-size: large;
        }*/
    </style>

</head>
 
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Button ID="BtnLogout" CssClass="btn btn-link" runat="server" OnClick="BtnLogout_Click" Text="Logout" Style="position: absolute; top: 0px; right: 0px;" />
        <br />
        <div class="container">
            <asp:Label ID="Controller" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Large">ControllerID : </asp:Label>&nbsp;<asp:Label ID="lblControllerID" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Large"></asp:Label>
            &nbsp;&nbsp;<asp:Label ID="Place" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Large">Place : </asp:Label>&nbsp;<asp:Label ID="lblPlaceID" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Large" Visible="false"></asp:Label>
            <asp:Label ID="lblPlaceName" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Large"></asp:Label>
            &nbsp;
            <br />
            <asp:FormView ID="FormView1" CssClass="table table-hover table-striped" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource3" Font-Names="Yu Gothic UI Semibold" Font-Size="Large">
                <ItemTemplate>
                    ID :
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    &nbsp;Code :
                    <asp:Label ID="CodeLabel" runat="server" Text='<%# Bind("Code") %>' />
                    <br />
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' Font-Size="X-Large" />
                    &nbsp;
                    <asp:Label ID="SubTypeLabel" runat="server" Text='<%# Bind("SubType") %>' Font-Size="X-Large" />
                    <br />
                </ItemTemplate>
                <RowStyle HorizontalAlign="Center" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT [Area] FROM [Place] WHERE ([ID] = @ID2)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblPlaceID" Name="ID2" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
                SelectCommand="SELECT Item.ID, Item.Code, ItemType.Name, ItemSubType.SubType 
                FROM ItemType 
                INNER JOIN ItemSubType ON ItemType.ID = ItemSubType.ItemTypeID 
                INNER JOIN Item ON ItemSubType.ID = Item.ItemSubTypeID 
                WHERE (Item.ID = @ID)">
                <SelectParameters>
                    <asp:SessionParameter Name="ID" SessionField="ItemID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Button ID="Button1" class="btn btn-primary btn-lg btn-block" runat="server" OnClick="Button1_Click" Text="เริ่มตรวจสอบ" />
            &nbsp;&nbsp;
                <asp:Button CssClass="btn btn-primary" ID="ButtonRefresh" runat="server" Text="Refresh" OnClick="ButtonRefresh_Click" Visible="False" />




            <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource6">
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
                    <div align="center">
                        <span class="auto-style1">Item Checked :</span>
                        <asp:LinkButton ID="Column1Label" runat="server" Text='<%# Bind("Column1") %>' Style="font-size: large" data-toggle="modal" data-target="#ItemCheck" />
                        &nbsp;<span class="auto-style1">/ Item to Check :
                        <asp:LinkButton ID="Column2Label" runat="server" Text='<%# Bind("Column2") %>' data-toggle="modal" data-target="#ItemNoCheck" />

                        </span>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
                SelectCommand="SELECT COUNT(DISTINCT ViewCheckSheetThisMonth.ItemID) AS Column1, 
(SELECT COUNT(ID) AS Expr1 FROM Item WHERE (PlaceID = @PlaceID)) AS Column2,
(SELECT DISTINCT(Location) AS Expr1 FROM Item WHERE (PlaceID = @PlaceID) AND (Item.ID = @ItemID)) AS Location

FROM ViewCheckSheetThisMonth 

WHERE (ViewCheckSheetThisMonth.ControllerID = @ControllerID) AND (ViewCheckSheetThisMonth.PlaceID = @PlaceID)
 AND (ViewCheckSheetThisMonth.ItemTypeID IN (1, 2, 5)) ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblPlaceID" Name="PlaceID" PropertyName="Text" />
                    <asp:QueryStringParameter Name="ItemID" QueryStringField="ItemID" />
                    <asp:ControlParameter ControlID="lblControllerID" Name="ControllerID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

            <div>
                <asp:GridView ID="GridView2" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="PHOTO">
                            <ItemTemplate>
                                <div align="center">
                                    <asp:Image ID="Image1" runat="server" ImageUrl=' <%# "~/" + Eval("PHOTO").ToString()%>' Width="300" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT PHOTO FROM ItemType
 INNER JOIN ItemSubType ON ItemType.ID = ItemSubType.ItemTypeID 
INNER JOIN Item ON ItemSubType.ID = Item.ItemSubTypeID 
WHERE (Item.ID = @ID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ID" SessionField="ItemID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
              <%--  <ContentTemplate>--%>
                    <div style="overflow-x: auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CheckSheetDetailID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" OnRowDataBound="OnRowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                            <Columns>

                                <%-- <asp:BoundField DataField="CheckSheetDetailID" HeaderText="" ReadOnly="True" SortExpression="CheckSheetDetailID">
                        <ItemStyle ForeColor="White" Width="5px" Height="0px" />
                        </asp:BoundField>--%>

                                <asp:BoundField DataField="CheckID" HeaderText="No." SortExpression="CheckID" />
                                <asp:BoundField DataField="Detail" HeaderText="CheckingDataDetails" SortExpression="Detail" />
                                <asp:CheckBoxField DataField="OK" HeaderText="OK" SortExpression="OK" Visible="False" />
                                <asp:TemplateField HeaderText="OK">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="RadioButton1" runat="server" Checked='<%# Bind("OK") %>' GroupName="MyGroup" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="NG" HeaderText="NG" SortExpression="NG" Visible="False" />
                                <asp:TemplateField HeaderText="NG">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="RadioButton2" runat="server" Checked='<%# Bind("NG") %>' GroupName="MyGroup" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <img src="../Img/Camera2.png" style="cursor: pointer; height: 49px; width: 49px;" onclick="OpenCamera(this)" />
                                        <asp:FileUpload ID="FileUploadCamera" runat="server" onchange="SetPreview(this)" Style="display: none" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Image ID="ImagePreview" runat="server" Style="cursor: pointer; height: 49px; width: 49px;" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal" ImageUrl="~/Img/emty-image.png" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
                                <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" Visible="False" />
                                <asp:TemplateField HeaderText="Comment">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxComment" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnClear" class="btn btn-primary" OnClientClick="Clear(this);" runat="server" Text="Clear" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="White" />
                            <SortedAscendingHeaderStyle BackColor="White" />
                            <SortedDescendingCellStyle BackColor="White" />
                            <SortedDescendingHeaderStyle BackColor="White" />
                        </asp:GridView>

                        <div style="margin-top: 30px;"></div>

                        <h3>
                            <asp:Label ID="Label1" runat="server" Text="อุปกรณ์ที่ไม่มี QR Code"></asp:Label>
                        </h3>
                        <asp:CheckBox ID="CheckShowGridNoQR" runat="server" AutoPostBack="True" Checked="False" OnCheckedChanged="CheckShowGridNoQR_CheckedChanged" Text="แก้ไขสอบอุปกร์ที่ไม่มี QR Code" />



                        <div style="margin-bottom: 30px;"></div>
                        <center>
                            <asp:RadioButton class="radioall" ID="RadioButtonALLYes" type="radio" GroupName="group5" value="1" runat="server" onclick="selectAll(form1)" Text="All Yes " />
                            <asp:RadioButton class="radioall" ID="RadioButtonALLNO" type="radio" GroupName="group5" value="0" runat="server" onclick="selectAll(form1)" Text="All No" />
                            <asp:RadioButton class="radioall" ID="RadioButtonALLNA" type="radio" GroupName="group5" value="2" runat="server" onclick="selectAll(form1)" Text="All N/A" />
                            <br />
                        </center>

                        <%/////////////////////////Gridview No ItemID////////////////////////////// %>

  <%--                      <asp:GridView ID="GridViewNoItemNew" runat="server" EnableViewState="false" AutoGenerateColumns="False" DataKeyNames="CheckSheetDetailID" DataSourceID="SqlDataSourceNoItem" HorizontalAlign="Center" OnRowDataBound="OnRowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                            <Columns>--%>
                         
                        <asp:GridView ID="GridViewNoItemNew" runat="server" AutoGenerateColumns="False" DataKeyNames="CheckSheetDetailID" DataSourceID="SqlDataSourceNoItem" HorizontalAlign="Center" OnRowDataBound="OnRowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                            <Columns>


                                <asp:BoundField DataField="Name" HeaderText="ItemType" SortExpression="Name" />
                                <asp:BoundField DataField="CheckID" HeaderText="ID" SortExpression="CheckID" />
                                <asp:BoundField DataField="Detail" HeaderText="CheckingDataDetails" SortExpression="Detail" />
                                <asp:CheckBoxField DataField="OK" HeaderText="OK" SortExpression="OK" Visible="False" />
                                <asp:TemplateField HeaderText="OK">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="RadioButton1NoNew" runat="server" value="1" Checked='<%# Bind("OK") %>' GroupName="MyGroup" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="NG" HeaderText="NG" SortExpression="NG" Visible="False" />
                                <asp:TemplateField HeaderText="NG">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="RadioButton2NoNew" runat="server" value="0" Checked='<%# Bind("NG") %>' GroupName="MyGroup" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="NA" HeaderText="N/A" SortExpression="NA" Visible="False" />
                                <asp:TemplateField HeaderText="N/A">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="RadioButton3NoNew" runat="server" value="2" Checked='<%# Bind("NA") %>' GroupName="MyGroup" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <img src="../Img/Camera2.png" style="cursor: pointer; height: 49px; width: 49px;" onclick="OpenCamera(this)" />
                                        <asp:FileUpload ID="FileUploadCamera" runat="server" onchange="SetPreview(this)" Style="display: none" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Image ID="ImagePreview" runat="server" Style="cursor: pointer; height: 49px; width: 49px;" onclick="SetZoomImage(this)" data-toggle="modal" data-target="#myModal" ImageUrl="~/Img/emty-image.png" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
                                <asp:BoundField DataField="YearMonth" HeaderText="YearMonth" SortExpression="YearMonth" Visible="False" />
                                <asp:TemplateField HeaderText="Comment">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxCommentNo" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnClearNo" class="btn btn-primary" OnClientClick="ClearNo(this);" runat="server" Text="Clear" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>


                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceNoItem" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>"
                            SelectCommand="SELECT ViewCheckSheetThisMonth.CheckSheetDetailID, ItemType.Name, ViewCheckSheetThisMonth.CheckID, ViewCheckSheetThisMonth.Detail, ViewCheckSheetThisMonth.OK, ViewCheckSheetThisMonth.NG, ViewCheckSheetThisMonth.NA , ViewCheckSheetThisMonth.ItemID, ViewCheckSheetThisMonth.Picture, ViewCheckSheetThisMonth.YearMonth, ViewCheckSheetThisMonth.Comment 
                    FROM ViewCheckSheetThisMonth 
                    LEFT OUTER JOIN ItemType ON ViewCheckSheetThisMonth.ItemTypeID = ItemType.ID 
                    WHERE (ViewCheckSheetThisMonth.CheckSheetID = @CheckSheetID)  AND (ViewCheckSheetThisMonth.ItemTypeID NOT IN ('1', '2', '5'))">
                            <SelectParameters>
                                <asp:SessionParameter Name="CheckSheetID" SessionField="CheckSheetID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
            <%--    </ContentTemplate>
            </asp:UpdatePanel>--%>
            <%/////////////////////////////////////////////////////// %>


            <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource5">

                <ItemTemplate>
                    Date:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' />
                    <br />

                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT [Date] FROM [ViewCheckSheetThisMonth] WHERE ControllerID = @ControllerID AND PlaceID = @PlaceID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblControllerID" Name="ControllerID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="lblPlaceID" Name="PlaceID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div style="margin-bottom: 30px;"></div>
            <asp:Button ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" Text="Send Report" OnClick="Button2_Click" />

            <%--<asp:Label ID="Label5" runat="server" Text=""></asp:Label>--%>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT CheckSheetDetailID, CheckID, Detail, OK, NG, ItemID,Picture, YearMonth,Comment 
FROM ViewCheckSheetThisMonth 

WHERE (ItemID = @ItemID) AND (PlaceID = @PlaceID) AND (YearMonth = @YearMonth) ">
                <SelectParameters>
                    <asp:SessionParameter Name="ItemID" SessionField="ItemID" />
                    <asp:ControlParameter ControlID="lblPlaceID" Name="PlaceID" PropertyName="Text" />
                    <asp:SessionParameter Name="YearMonth" SessionField="YearMonth" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"/>x</div>
                        <div class="modal-body">
                            <asp:Image ID="ImageZoom" runat="server" Width="100%" Height="100%" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
                    </div>
                </div>
            </div>

            <%////////////////////////////////////////////////// Status Item //////////////////////////////////////////////////////////////////////////////// %>
            <div class="modal fade" id="ItemCheck" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">Item Check Already</h4>
                        </div>

                        <div class="modal-body">
                            <asp:GridView ID="gvItemChecked" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemChecked" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Code" HeaderText="Item Code" SortExpression="Code" />
                                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle HorizontalAlign="Center" BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceItemChecked" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT dt.CheckSheetID, dt.YearMonth, Item.ID, dt.ItemID, Item.Code, Controller.ID AS ControllerID, Controller.Name, Place.Area, Place.ID AS Expr1, Item.Location FROM Item LEFT OUTER JOIN Place ON Item.PlaceID = Place.ID LEFT OUTER JOIN Controller ON Place.ControllerID = Controller.ID LEFT OUTER JOIN ItemSubType ON Item.ItemSubTypeID = ItemSubType.ID INNER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID LEFT OUTER JOIN (SELECT DISTINCT CheckSheet.ID AS CheckSheetID, CheckSheet.ControllerID, CheckSheetDetail.ItemID, CheckSheet.YearMonth FROM CheckSheetDetail LEFT OUTER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID WHERE (CheckSheet.YearMonth = CONVERT ([varchar] (7), GETDATE(), 120)) AND (CheckSheet.ControllerID = @ControllerID)) AS dt ON dt.ItemID = Item.ID WHERE (Controller.ID = @ControllerID) AND (dt.CheckSheetID IS NOT NULL) AND (Place.ID = @PlaceID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblControllerID" Name="ControllerID" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="lblPlaceID" Name="PlaceID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="ItemNoCheck" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">Item No Check</h4>
                        </div>
                        <div class="modal-body">
                            <asp:GridView ID="gvItemNocheck" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemNoCheck" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>

                                    <asp:BoundField DataField="Code" HeaderText="Item Code" SortExpression="Code">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="LocationLink">
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

                                                     : "#")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) %>"
                                                target="_blank">Location</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle HorizontalAlign="Center" BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceItemNoCheck" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT dt.CheckSheetID, dt.YearMonth, Item.ID, dt.ItemID, Item.Code, Controller.ID AS ControllerID, Controller.Name, Place.Area, Place.ID AS Expr1, Item.Location FROM Item LEFT OUTER JOIN Place ON Item.PlaceID = Place.ID LEFT OUTER JOIN Controller ON Place.ControllerID = Controller.ID LEFT OUTER JOIN ItemSubType ON Item.ItemSubTypeID = ItemSubType.ID INNER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID LEFT OUTER JOIN (SELECT DISTINCT CheckSheet.ID AS CheckSheetID, CheckSheet.ControllerID, CheckSheetDetail.ItemID, CheckSheet.YearMonth FROM CheckSheetDetail LEFT OUTER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID WHERE (CheckSheet.YearMonth = CONVERT ([varchar] (7), GETDATE(), 120)) AND (CheckSheet.ControllerID = @ControllerID)) AS dt ON dt.ItemID = Item.ID WHERE (Controller.ID = @ControllerID) AND (dt.CheckSheetID IS NULL) AND (Place.ID = @PlaceID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblControllerID" Name="ControllerID" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="lblPlaceID" Name="PlaceID" PropertyName="Text" />

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>



                    </div>
                </div>
            </div>

        </div>


        <script type="text/javascript">

            function Clear(lnk) {
                //Reference the GridView Row.
                var row = lnk.parentNode.parentNode;

                //Determine the Row Index.
                var message = "Row Index: " + (row.rowIndex - 1);

                var txt = $("input[id*=TextBoxComment]");
                txt[row.rowIndex - 1].value = '';

                var rdb = $("input[id*=RadioButton1]");
                rdb[row.rowIndex - 1].value = false;

                var rdb2 = $("input[id*=RadioButton2]");
                rdb2[row.rowIndex - 1].value = false;

                alert(message);
                return false;
            }

            function ClearNo(lnk) {
                //Reference the GridView Row.
                var row = lnk.parentNode.parentNode;

                //Determine the Row Index.
                var message = "Row Index: " + (row.rowIndex - 1);

                var txt = $("input[id*=TextBoxCommentNo]");
                txt[row.rowIndex - 1].value = '';

                var rdb = $("input[id*=RadioButton1No]");
                rdb[row.rowIndex - 1].value = false;

                var rdb2 = $("input[id*=RadioButton2No]");
                rdb2[row.rowIndex - 1].value = false;

                var rdb3 = $("input[id*=RadioButton3No]");
                rdb3[row.rowIndex - 1].value = false;


                alert(message);
                return false;
            }

            //function คลิก Browse file จาก Image แทน
            function OpenCamera(ele) {
                var FileUploadCTRL = $(ele).closest('tr').find('[id*=FileUploadCamera]');
                FileUploadCTRL.click();
            }

            //Set preview image เมื่อ Browse file แต่ยังไม่ Save to DB
            function SetPreview(ele) {
                var ImagePreviewCTRL = $(ele).closest('tr').find('[id*=ImagePreview]');
                //var File = $(ele).closest('tr').find('[id*=FileUploadCamera]');
                if (typeof (FileReader) != "undefined") {
                    $(ImagePreviewCTRL).show();
                    var reader = new FileReader();
                    reader.onload = function (e) { $(ImagePreviewCTRL).attr("src", e.target.result); }
                    reader.readAsDataURL($(ele)[0].files[0]);
                }
            };

            //แสดงรูปใหญ่ เมื่อ click รูปใน Gridview
            function SetZoomImage(ele) {
                var ImageDB = $(ele).closest('tr').find('[id*=ImagePreview]');
                var URL = $(ImageDB).attr("src");
                document.getElementById('<%=ImageZoom.ClientID%>').setAttribute('src', URL);
            };

            function selectAll(form1) {

                var check = document.getElementsByName("group5"),
                    radios = $("input[id*=GridViewNoItem]");

                //radioButton1.Checked = true;

                //RadioButton

                //If the first radio is checked
                if (check[0].checked) {
                    for (i = 0; i < radios.length; i++) {
                        if (radios[i].type == "radio") {
                            if (radios[i].value == 1) {
                                radios[i].checked = true;
                            }
                        }
                    }
                } else if (check[1].checked) {

                    for (i = 0; i < radios.length; i++) {

                        if (radios[i].type == "radio") {

                            if (radios[i].value == 0) {
                                radios[i].checked = true;
                            }
                        }
                    }
                } else {
                    for (i = 0; i < radios.length; i++) {

                        if (radios[i].type == "radio") {

                            if (radios[i].value == 2) {
                                radios[i].checked = true;
                            }
                        }
                    }
                };
                /* return null;*/
            }
        </script>
    </form>

</body>

</html>
