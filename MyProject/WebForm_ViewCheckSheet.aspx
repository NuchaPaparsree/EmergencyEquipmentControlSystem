<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_ViewCheckSheet.aspx.cs" Inherits="MyProject.WebForm_ViewCheckSheet" %>
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
            background-image: url("/img/high.jpg");
            min-height: 100%;
        }
</style>
<header class="bgimg w3-display-container w3-grayscale-min" id="home">

        <div style="padding-top:15px;">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">
     
  </div> <div style="margin-top: 150px;"></div>


<div style="width: auto; margin-right: 5%; margin-left: 5%; text-align: center">
  
     <div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="mana">
  <div class="w3-content">
 </div> 
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px"></h1>

    <div style="margin-top:100px; margin-bottom:10px; text-align:center;">
        <asp:Label ID="Label1" runat="server" Text="ItemType : "></asp:Label>
       
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="True" Width="120px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT * FROM [ItemType]"></asp:SqlDataSource>&nbsp;&nbsp;
       
        <asp:Label ID="Label3" runat="server" Text="Year-Month : "></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="YearMonth" DataValueField="YearMonth" AutoPostBack="True" Width="140px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT CheckSheet.YearMonth FROM [Item] INNER JOIN [CheckSheetDetail] ON (Item.ID = CheckSheetDetail.ItemID) INNER JOIN [CheckSheet] ON (CheckSheet.ID = CheckSheetDetail.CheckSheetID) INNER JOIN [CheckItem] ON (CheckItem.ID = CheckSheetDetail.CheckItemID) INNER JOIN [ItemType] ON (ItemType.ID = CheckItem.ItemTypeID) WHERE  ItemType.ID = @ItemTypeID order by CheckSheet.YearMonth desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="ItemTypeID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Name: "></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="ControllerID" AutoPostBack="True" Width="140px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT CheckSheet.ControllerID, Controller.Name
FROM            Item INNER JOIN
                         CheckSheetDetail ON Item.ID = CheckSheetDetail.ItemID INNER JOIN
                         CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN
                         CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN
                         Controller ON CheckSheet.ControllerID = Controller.ID
						WHERE (CheckSheet.YearMonth =@yearmonth and ItemTypeID = @typeID)
ORDER BY CheckSheet.ControllerID ASC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="yearmonth" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="typeID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

  


        &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Code : "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Code" DataValueField="ID" AutoPostBack="True" Width="180px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT       distinct Item.ID,Item.Code
FROM            Item INNER JOIN
                         ItemSubType ON ItemSubType.ID = Item.ItemSubTypeID LEFT JOIN
                         CheckSheetDetail ON Item.ID = CheckSheetDetail.ItemID INNER JOIN
                         CheckSheet ON CheckSheetDetail.CheckSheetID = CheckSheet.ID
WHERE        (CheckSheet.YearMonth = @yearmonth and ItemTypeID = @typeID and CheckSheet.ControllerID = @ControllerID) order by Item.Code asc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="yearmonth" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="typeID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList4" Name="ControllerID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnsearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnsearch_Click" />
        <br /><br />
    </div>

    <br /><br />
</div>
         </header>
 <br />

    <div class="container-fluid">
    <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="OnRowDataBound" Width="100%">
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
            <asp:CheckBoxField DataField="NA" HeaderText="N/A" SortExpression="NA" >
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT        CheckItem.Detail, CheckItem.CheckID, CheckSheetDetail.OK, CheckSheetDetail.NG, ISNULL(CheckSheetDetail.NA,0) AS NA,CheckSheetDetail.Picture, CheckSheetDetail.Comment
FROM            CheckSheetDetail INNER JOIN
                         CheckSheet ON CheckSheetDetail.CheckSheetID = CheckSheet.ID INNER JOIN
                         CheckItem ON CheckSheetDetail.CheckItemID = CheckItem.ID
WHERE ItemID = @ItemID AND YearMonth = @YearMonth  AND CheckSheet.ControllerID = @ControllerID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ItemID" PropertyName="SelectedValue" DefaultValue="" />
                    <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="YearMonth" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList4" Name="ControllerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>


            <div class="modal fade" id="myModal" role="dialog">
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
