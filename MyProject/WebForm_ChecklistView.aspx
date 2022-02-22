<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm_ChecklistView.aspx.cs" Inherits="MyProject.WebForm_ChecklistView" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="MyBootStrap/bootstrap.min.css" rel="stylesheet" />
    <script src="MyBootStrap/jquery.min.js"></script>
    <script src="MyBootStrap/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container"  align="center" style="width: 90%; margin-right: 2%; margin-left: 2%; text-align: center">
            
       
            <div align="center">
            <asp:Label ID="lblItemType" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="X-Large" Font-Underline="True" Visible="False"></asp:Label>
            <asp:Label ID="lblControllerID" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Small" Visible="False"></asp:Label>
            <asp:Label ID="lblControllerName" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Small" Visible="False"></asp:Label>
            <asp:Label ID="lblCode" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Small" Visible="False"></asp:Label>
            <asp:Label ID="lblYear" class="form-group" runat="server" Font-Names="Yu Gothic UI Semibold" Font-Size="Small" Visible="False"></asp:Label>
            </div> 
            

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT MAX(SUBSTRING(YearMonth, 1, 4)) AS Year, ControllerID, ItemTypeName, Code, Name FROM ViewCheckSheet WHERE (ItemID = @ItemID) GROUP BY ControllerID, ItemTypeName, Code, Name">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ItemID" QueryStringField="ItemID" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br /><br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT distinct max(SUBSTRING(YearMonth, 6, 7)) AS Month
				,max (Date) AS Datetime
				, Name
                ,CASE WHEN OK = 'false' THEN '/' ELSE '/' END AS OK
				, CASE WHEN NG = 'true' THEN '-' ELSE '-' END AS NG
				,TB.Note

                ,max (SUBSTRING(YearMonth, 1, 4)) AS Year
			    ,Code
				,ItemTypeName

				,case when charindex(' ',Name) = 0 then Name else left(Name, charindex(' ' ,Name)-1) end as FirstName 

                FROM ViewCheckSheet 
				left join (SELECT DISTINCT CheckSheetID, STUFF((SELECT ',' + CheckID  
				FROM (SELECT distinct CheckSheetID,CheckID 
					  FROM ViewCheckSheet 
					  WHERE (ControllerID = @ControllerID) AND (ItemID = @ItemID) 
					  and OK='False' and NG = 'True' 
					  group by CheckSheetID,CheckID) AS TB1

				where TB1.CheckSheetID = ViewCheckSheet.CheckSheetID
                FOR XML PATH('')), 1, 1, '') as Note 

				FROM ViewCheckSheet 
				WHERE (ControllerID = @ControllerID) AND (ItemID = @ItemID)
				and OK='False' and NG = 'True') as TB

				on TB.CheckSheetID = ViewCheckSheet.CheckSheetID


				WHERE (ControllerID = @ControllerID) AND (ItemID = @ItemID) 
				GROUP BY  YearMonth,Name,Code,ItemTypeName,OK,NG,TB.Note ORDER BY Datetime DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblControllerID" DefaultValue="1" Name="ControllerID" PropertyName="Text" Type="String" />
                    <asp:QueryStringParameter Name="ItemID" QueryStringField="ItemID" />
                </SelectParameters>
            </asp:SqlDataSource>

        


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div align="center">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="450px" Height="400px" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" ShowBackButton="False" ShowFindControls="False" ShowRefreshButton="False" ShowPageNavigationControls="False" ShowZoomControl="False" ZoomMode="PageWidth" >
            <LocalReport ReportPath="Report\Report_Checklist.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet_Checklist" />
                </DataSources>
            </LocalReport>
            </rsweb:ReportViewer>
            <br />
 
        </div>

        <div align="center"  style="margin-top: 415px;" >
            <br />
            <asp:Button ID="ButtonBack" class="btn btn-primary" runat="server" Text="Back" OnClick="ButtonBack_Click" />
            </div>

       </div>
    </form>
</body>
</html>
