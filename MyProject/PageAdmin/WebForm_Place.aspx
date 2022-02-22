<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_Place.aspx.cs" Inherits="MyProject.PageAdmin.WebForm_Place" %>

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
            background-image: url("../Img/high.jpg");
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
                        PLACE
                            </div></span>
                </div>
            </div>
        </div>

        <div style="margin-top: 100px;">
            <div class="text-center">
                <p><a href="#place" class="w3-button w3-xxlarge w3-black" style="font-size: 20px">LET ME SEE PLACE</a></p>
            </div>
        </div>
        <div style="margin-top: 150px;"></div>



        <div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">

            <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="place">
                <div class="w3-content">
                </div>
                <h1 class="w3-center w3-jumbo" style="margin-bottom: 64px"></h1>

                <div class="text-center">

                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="DataBuildingPlace" DataTextField="Building" DataValueField="Building" OnDataBound="DropDownList3_DataBound1"></asp:DropDownList>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DataAreaPlace" DataTextField="Floor" DataValueField="Floor" AutoPostBack="True" OnDataBound="DropDownList4_DataBound"></asp:DropDownList>
                    <asp:SqlDataSource ID="DataAreaPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Floor FROM Place"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="DataBuildingPlace" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT Building FROM Place"></asp:SqlDataSource>

                    <asp:TextBox ID="TextBoxControllerID" runat="server" Height="20px" Width="120px" placeholder="ControllerID" AutoPostBack="True"></asp:TextBox>


                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" class="btn btn-info" aria-hidden="true" Style="margin-left: 5px; height: 30px;" />
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" aria-hidden="true" Style="margin-left: 5px; height: 30px;" data-toggle="modal" data-target="#AddNewItem" />

                    <br />
                    <br />

                </div>
            </div>
        </div>
    </header>
    <div style="margin-right: 5%; margin-left: 5%; text-align: center" class="auto-style1">
        <br />
        <asp:UpdatePanel ID="upCrudGrid" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center"
                    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
                    DataKeyNames="ID" CssClass="table table-hover table-striped"
                    DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#DEBA84" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <asp:Label ID="Label_ID" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                        <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                        <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        <asp:BoundField DataField="ControllerID" HeaderText="ControllerID" SortExpression="ControllerID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" SortExpression="CommitteeID" />
                        <asp:BoundField DataField="Com_name" HeaderText="Name" SortExpression="Comm_name" />
                    </Columns>

               
                    <FooterStyle BackColor="#CCCCCC" />

                    <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="#3366FF" />
                    <PagerStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="White" Font-Bold="False"  />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />


                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT TOP (10000) Place.ID, Place.Floor, Place.Building, Place.Area, Place.ControllerID, Controller.Name, Place.CommitteeID, Committee.Name AS Com_name FROM Place INNER JOIN Committee ON Place.CommitteeID = Committee.ID LEFT OUTER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.Floor LIKE '%' + @Floor + '%') AND (Place.ControllerID LIKE '%' + @ControllerID + '%') AND (Place.Building LIKE '%' + @Building + '%')" OnSelecting="SqlDataSource1_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList4" DefaultValue="%" Name="Floor" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="TextBoxControllerID" DefaultValue="%" Name="ControllerID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList3" DefaultValue="%" Name="Building" PropertyName="SelectedValue" Type="String" />

                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <!-- Detail Modal Starts here-->
        <!--เปิด pop ให้ปิด class="modal hide fade"  -->
        <div id="detailModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
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
                            <AlternatingRowStyle Width="100%" />
                            <CommandRowStyle Width="100%" />
                            <EditRowStyle Width="100%" Height="30px" />
                            <EmptyDataRowStyle Width="100%" />
                            <FieldHeaderStyle BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black" Wrap="False" Width="60%" />
                            <Fields>
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                                <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                                <asp:TemplateField HeaderText="ControllerName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="ID" DataValueField="ID" SelectedValue='<%# Bind("ControllerID") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Controller]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ControllerID") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Controller]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbControllerName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CommitteeName" SortExpression="Com_name">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlEditCom" runat="server" DataSourceID="SqlDataSource8" DataTextField="ID" DataValueField="ID" SelectedValue='<%# Bind("CommitteeID") %>'></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ID, Name FROM Committee" ></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Com_name") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbComName" runat="server" Text='<%# Bind("Com_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Fields>
                            <FooterStyle Width="100%" />
                            <HeaderStyle Width="100%" />
                            <InsertRowStyle Width="100%" Height="30px" />
                            <PagerStyle Width="100%" />
                            <RowStyle Width="100%" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" DeleteCommand="DELETE FROM [Place] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Place] ([Building], [Floor], [Area], [ControllerID]) VALUES (@Building, @Floor, @Area, @ControllerID)" SelectCommand="SELECT Place.ID, Place.Building, Place.Floor, Place.Area, Place.ControllerID, Controller.Name, Place.CommitteeID, Committee.Name AS Com_name FROM Place INNER JOIN Controller ON Controller.ID = Place.ControllerID INNER JOIN Committee ON Place.CommitteeID = Committee.ID WHERE (Place.ID = @ID)" UpdateCommand="UPDATE Place SET Building = @Building, Floor = @Floor, Area = @Area, ControllerID = @ControllerID, CommitteeID = @CommitteeID, Update_at = GETDATE(), Update_by = @BY WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Building" Type="String" />
                                <asp:Parameter Name="Floor" Type="String" />
                                <asp:Parameter Name="Area" Type="String" />
                                <asp:Parameter Name="ControllerID" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="ID" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Building" Type="String" />
                                <asp:Parameter Name="Floor" Type="String" />
                                <asp:Parameter Name="Area" Type="String" />
                                <asp:Parameter Name="ControllerID" Type="String" />
                                <asp:Parameter Name="CommitteeID" Type="String"/>
                                <asp:SessionParameter Name="BY" Type="String" SessionField="myLoginID" />
                                <asp:Parameter Name="ID" Type="String" />
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
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true" />
            </div>
        </div>
        <!-- Detail Modal Ends here  -->
         <!--เปิด pop ให้ปิด class="modal hide fade"  -->

        <div id="AddNewItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="True">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="AddLabel">Add New Place </h3>
            </div>
            <div class="modal-body">
                <asp:DetailsView ID="DetailsView2" runat="server" CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black"
                    FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true"
                    FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black"
                    BorderStyle="Groove" AutoGenerateRows="False" Width="100%" DataKeyNames="ID" DefaultMode="Insert" DataSourceID="SqlDataSource5">
                    <EditRowStyle Width="100%" Height="30px" />

                    <FieldHeaderStyle Wrap="False" BackColor="LavenderBlush" Font-Bold="True" ForeColor="Black"></FieldHeaderStyle>
                    <Fields>
                    <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
                    <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                    <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                        <asp:TemplateField HeaderText="ControllerID" SortExpression="ControllerID">
                            <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource6" DataTextField="ID" DataValueField="ID" SelectedValue='<%# Bind("ControllerID") %>'></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT ID FROM Controller WHERE Is_Logout <> 1"></asp:SqlDataSource>

                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CommitteeID">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList8" runat="server"  DataSourceID="SqlDataSource7" DataTextField="ID" DataValueField="ID" SelectedValue='<%# Bind("CommitteeID") %>'></asp:DropDownList>
                                          <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [Committee] WHERE Is_Logout <> 1"></asp:SqlDataSource>

                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>


                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Place] WHERE [ID] = @ID"
                    InsertCommand="INSERT INTO Place(Building, Floor, Area, ControllerID, CommitteeID, Create_at,Create_by) VALUES (@Building, @Floor, @Area, @ControllerID, @CommitteeID, GETDATE(),@AT)" 
                    SelectCommand="SELECT * FROM [Place]" UpdateCommand="UPDATE [Place] SET [Building] = @Building, [Floor] = @Floor, [Area] = @Area, [ControllerID] = @ControllerID, [CommitteeID] = @CommitteeID WHERE [ID] = @ID">

                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="String"/>
                    </DeleteParameters>

                    <InsertParameters>
                        <asp:Parameter Name="Building" Type="String" />
                        <asp:Parameter Name="Floor" Type="String" />
                        <asp:Parameter Name="Area" Type="String" />
                        <asp:Parameter Name="ControllerID" Type="String" />
                        <asp:Parameter Name="CommitteeID" Type="String" />
                        <asp:SessionParameter Name="AT" Type="String" SessionField="myLoginID" />
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="Building" Type="String"/>
                        <asp:Parameter Name="Floor" Type="String"/>
                        <asp:Parameter Name="Area" Type="String"/>
                        <asp:Parameter Name="ControllerID" Type="String"/>
                        <asp:Parameter Name="CommitteeID" Type="String" />
                        <asp:Parameter Name="ID" Type="String"/>
                    </UpdateParameters>

                </asp:SqlDataSource>
                <div class="modal-footer">
                    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Close" class="btn btn-info" aria-hidden="true" />
                </div>
            </div>
        </div>
</asp:Content>
