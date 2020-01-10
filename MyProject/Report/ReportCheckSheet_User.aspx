<%@ Page Language="C#"  AutoEventWireup="true"  MasterPageFile="~/SiteMySystem.Master"  CodeBehind="ReportCheckSheet_User.aspx.cs" Inherits="MyProject.Report.ReportCheckSheet_User" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 90%; margin-right: 5%; margin-left: 5%; margin-top:60px; text-align: center" >

    <div align="center">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="950px" BackColor="" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" DocumentMapWidth="100%" ExportContentDisposition="AlwaysInline" Height="750px" PageCountMode="Actual" ShowBackButton="False" ShowDocumentMapButton="False" ShowFindControls="False" ShowPromptAreaButton="False" ClientIDMode="AutoID" ShowPageNavigationControls="False" ShowRefreshButton="False" ZoomMode="PageWidth">
                <LocalReport ReportPath="Report\Report_Checklist.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="SqlDataSourceCheckSheet" Name="DataSet_Checklist" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
          </div> 

            <asp:SqlDataSource ID="SqlDataSourceCheckSheet" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT ItemType.ID,(SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc) as IDCheckSheet,
ItemType.Name,
CheckItem.CheckID,CheckItem.Detail
,CASE 
WHEN result &gt;= 1000 THEN '-'
WHEN result &gt; 0 THEN 'O'
WHEN result = 0 THEN '/' 
ELSE '-'
END as CheckResult
,CheckData.CommentNG
,(SELECT  CheckSheet.YearMonth  FROM  CheckSheet where CheckSheet.ID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc)) as YearMonth
,(SELECT  Place.Area FROM  Place INNER Join CheckSheet on CheckSheet.PlaceID = Place.ID where CheckSheet.ID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc)) as Area
,(SELECT  Controller.Name FROM  Controller INNER Join CheckSheet on CheckSheet.ControllerID = Controller.ID where CheckSheet.ID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc)) as NameUser
,(SELECT (Controller.Department+' '+Controller.Section) as DIV  FROM  Controller INNER Join CheckSheet on CheckSheet.ControllerID = Controller.ID where CheckSheet.ID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc)) as DIV
FROM             CheckItem
					LEFT JOIN  ItemType ON CheckItem.ItemTypeID = ItemType.ID 
					LEFT JOIN
						 
						 (SELECT  CheckSheetDetail.CheckItemID,sum(case when (OK = 1 and NG = 0) then 0 when (OK = 0 and NG = 0) then 1000 else 1 end) as result ,DtComment.CommentNG
						 FROM      CheckSheetDetail left join 
							(SELECT distinct CheckItemID, STUFF((SELECT   ',' + Comment 
							 FROM (SELECT distinct CheckItemID,Comment
									FROM [dbo].[CheckSheetDetail]
									where CheckSheetID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc) 
									and (OK = 'false' and NG = 'true')	 
									and Comment &lt;&gt; '') as TB
			
									where TB.CheckItemID=CheckSheetDetail.CheckItemID
									FOR XML PATH ('')), 1, 1, '') as CommentNG

						FROM [dbo].[CheckSheetDetail]
 
						where CheckSheetID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc) 
						and (OK = 'false' and NG = 'true')	 
						and Comment &lt;&gt; '') as DtComment on DtComment.CheckItemID = CheckSheetDetail.CheckItemID

						 where CheckSheetID = (SELECT Top(1) CheckSheet.ID  FROM  CheckSheet where ControllerID = @ID order by ID desc) 
						 group by CheckSheetDetail.CheckItemID,CommentNG
						
                        ) as CheckData on CheckItem.ID = CheckData.CheckItemID">
                <SelectParameters>
                    <asp:SessionParameter Name="ID" SessionField="myLoginID" />
                </SelectParameters>
            </asp:SqlDataSource>
    
</div>
</asp:Content>
