<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteMySystem.Master" CodeBehind="ReportCheckSheet.aspx.cs" Inherits="MyProject.Report.ReportCheckSheet" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 90%; margin-right: 5%; margin-left: 5%; margin-top:100px; text-align: center" >
        <div  style="margin-top:100px">
            <asp:Button ID="btnApprove" runat="server" Text="Send Email" CssClass=" btn btn-warning" Width="100%" Height="40px" OnClick="btnApprove_Click" />
        </div>
        <br />
    <div align="center">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="950px" BackColor="" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" DocumentMapWidth="100%" ExportContentDisposition="AlwaysInline" Height="750px" PageCountMode="Actual" ShowBackButton="False" ShowDocumentMapButton="False" ShowFindControls="False" ShowPromptAreaButton="False" ClientIDMode="AutoID" ShowPageNavigationControls="False" ShowRefreshButton="False" ZoomMode="PageWidth">
                <LocalReport ReportPath="Report\Report_CheckSheet.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="SqlDataSourceCheckSheet" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
          </div> 
            <asp:SqlDataSource ID="SqlDataSourceCheckSheet" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT ItemType.ID,(SELECT  CheckSheet.ID  FROM  CheckSheet where CheckSheet.ID = @CheckSheetID) as IDCheckSheet,
ItemType.Name,
CheckItem.CheckID,CheckItem.Detail
,CASE 
WHEN result &gt;= 1000 THEN '-'
WHEN result &gt; 0 THEN 'O'
WHEN result = 0 THEN '/' 
ELSE '-'
END as CheckResult
,CheckData.CommentNG
,(SELECT  CheckSheet.YearMonth  FROM  CheckSheet where CheckSheet.ID = @CheckSheetID) as YearMonth

 ,(SELECT  DATE_APPROVE1.APPROVE1  FROM  (SELECT CheckSheet.ID,substring(convert(varchar(20),ApproveDate1,102),1,10) as APPROVE1  FROM CheckSheet  where CheckSheet.ID = @CheckSheetID )as DATE_APPROVE1 ) as Approve_Date1
  ,(SELECT  DATE_APPROVE2.APPROVE2  FROM (SELECT CheckSheet.ID,substring(convert(varchar(20),ApproveDate2,102),1,10) as APPROVE2  FROM CheckSheet  where CheckSheet.ID = @CheckSheetID )as DATE_APPROVE2 ) as Approve_Date2
  ,(SELECT  DATE_APPROVE3.APPROVE3  FROM (SELECT CheckSheet.ID,substring(convert(varchar(20),ApproveDate3,102),1,10) as APPROVE3  FROM CheckSheet  where CheckSheet.ID = @CheckSheetID )as DATE_APPROVE3 ) as Approve_Date3


,(SELECT  Place.Area FROM  Place INNER Join CheckSheet on CheckSheet.PlaceID = Place.ID where CheckSheet.ID = @CheckSheetID) as Area
,(SELECT  Controller.Name FROM  Controller INNER Join CheckSheet on CheckSheet.ControllerID = Controller.ID where CheckSheet.ID = @CheckSheetID) as NameUser

,(SELECT  TBCom.Name FROM  (SELECT Committee.ID,LEFT (SUBSTRING(Name,(CHARINDEX('.',Name)+1),LEN(Name)),   CHARINDEX(' ',(SUBSTRING(Name,(CHARINDEX('.',Name)+1),LEN(Name))))+1) +'.' as Name
FROM Committee)as TBCom  INNER Join CheckSheet on CheckSheet.CommitteeID = TBCom.ID where CheckSheet.ID = @CheckSheetID) AS NAME_Committee

,(SELECT  TBChair.Name FROM  (SELECT Committee.ID ,LEFT (SUBSTRING(Name,(CHARINDEX('.',Name)+1),LEN(Name)),   CHARINDEX(' ',(SUBSTRING(Name,(CHARINDEX('.',Name)+1),LEN(Name))))+1) +'.' as Name
FROM Committee)as TBChair INNER Join CheckSheet on CheckSheet.ChairmanID = TBChair.ID where CheckSheet.ID = @CheckSheetID) AS NAME_Chairman

,(SELECT  TBCon.Name FROM  (SELECT Controller.ID, LEFT (SUBSTRING(Name,(CHARINDEX('.',Name)+1),LEN(Name)),   CHARINDEX(' ',(SUBSTRING(Name,(CHARINDEX('.',Name)+1),LEN(Name))))+1) +'.' as Name
FROM Controller)as TBCon INNER Join CheckSheet on CheckSheet.ControllerID = tbCon.ID where CheckSheet.ID = @CheckSheetID) AS NAMESTAMP

,(SELECT (Controller.Department+' '+Controller.Section) as DIV  FROM  Controller INNER Join CheckSheet on CheckSheet.ControllerID = Controller.ID where CheckSheet.ID = @CheckSheetID) as DIV
FROM CheckItem
					LEFT JOIN  ItemType ON CheckItem.ItemTypeID = ItemType.ID 
					LEFT JOIN
						 
						 (SELECT  CheckSheetDetail.CheckItemID,sum(case when (OK = 1 and NG = 0) then 0 when (OK = 0 and NG = 0) then 1000 else 1 end) as result ,DtComment.CommentNG
						 FROM      CheckSheetDetail left join 
							(SELECT distinct CheckItemID, STUFF((SELECT   ',' + Comment 
							 FROM (SELECT distinct CheckItemID,Comment
									FROM [dbo].[CheckSheetDetail]
									where CheckSheetID = @CheckSheetID 
									and (OK = 'false' and NG = 'true')	 
									and Comment &lt;&gt; '') as TB
			
									where TB.CheckItemID=CheckSheetDetail.CheckItemID
									FOR XML PATH ('')), 1, 1, '') as CommentNG

						FROM [dbo].[CheckSheetDetail]
 
						where CheckSheetID = @CheckSheetID 
						and (OK = 'false' and NG = 'true')	 
						and Comment &lt;&gt; '') as DtComment on DtComment.CheckItemID = CheckSheetDetail.CheckItemID

						 where CheckSheetID = @CheckSheetID 
						 group by CheckSheetDetail.CheckItemID,CommentNG
						
                        ) as CheckData on CheckItem.ID = CheckData.CheckItemID order by ItemType.ID">
                <SelectParameters>
                    <asp:QueryStringParameter  Name="CheckSheetID" QueryStringField="CheckSheetID" />
                </SelectParameters>
            </asp:SqlDataSource>

      <asp:sqldatasource id="SqlDataSourceCheckItemCheck" runat="server" connectionstring="<%$ ConnectionStrings:xPimConnectionString1 %>"
    selectcommand="SELECT COUNT(DISTINCT CheckSheetDetail.ItemID) AS Column1, (SELECT COUNT(Item.ID) AS Expr1 FROM Item INNER JOIN Place ON Place.ID = Item.PlaceID INNER JOIN Controller ON Controller.ID = Place.ControllerID WHERE (Place.ControllerID = @ControllerID)) AS Column2 
        FROM CheckSheetDetail INNER JOIN CheckSheet ON CheckSheet.ID = CheckSheetDetail.CheckSheetID INNER JOIN CheckItem ON CheckItem.ID = CheckSheetDetail.CheckItemID INNER JOIN ItemType ON ItemType.ID = CheckItem.ItemTypeID WHERE (CheckSheet.ControllerID = @ControllerID) AND (ItemType.ID IN (1, 2, 5)) AND (CheckSheet.YearMonth = @YearMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="ControllerID" SessionField="U_ID" />
                <asp:SessionParameter Name="YearMonth" SessionField="Day" />
            </SelectParameters>
	    </asp:sqldatasource>
     
</div>
</asp:Content>