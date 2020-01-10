<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="WebForm_PrintQR.aspx.cs" Inherits="MyProject.Report.WebForm_PrintQR" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top :160px" align="center">
     
   
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" ZoomPercent="100" Width="800px" ShowParameterPrompts="False" ShowPromptAreaButton="False" ShowRefreshButton="False" ShowWaitControlCancelLink="False" ShowPageNavigationControls="False" ShowBackButton="False" ShowCredentialPrompts="False" ShowFindControls="False" ZoomMode="FullPage" BorderStyle="None">
        <localreport reportpath="Report\Report_PrintQR.rdlc">
        </localreport>
    </rsweb:ReportViewer>
</div>
    <asp:SqlDataSource ID="ItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="

SELECT Item.ID, ItemType.Name, 
(case when ItemType.Name ='ถังดับเพลิง' then 'Fire extinguisher' 
else case when Name ='กริ่งฉุกเฉิน' then 'Bell' 
else case when Name ='ไฟฉุกเฉิน' then 'Emergency light' 
else case when Name ='อุปกรณ์ตรวจจับควันหรือความร้อน' then 'Smoke Detector' 
else case when Name ='ตู้เก็บสายฉีดน้ำดับเพลิง' then 'Fire Hose ' 
else case when Name ='สถานที่จัดเก็บสารเคมีอันตรายและแก๊ส' then Name
else case when Name ='ประตูหนีไฟ' then 'Fire Escape Door' 
else case when Name ='เกี่ยวกับเส้นทางการอพยพ' then 'Mean of Egress' 
else case when Name ='เกี่่ยวกับไฟฟ้า' then Name
else case when Name ='อื่นๆ' then Name
end end end end end end end end end end) as Equipment ,Item.Code, ItemSubType.SubType
FROM Item LEFT OUTER JOIN ItemSubType ON ItemSubType.ID = Item.ItemSubTypeID 
LEFT OUTER JOIN Place ON Place.ID = Item.PlaceID 
LEFT OUTER JOIN ItemType ON ItemType.ID = ItemSubType.ItemTypeID WHERE (Item.ID = @item_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="item_ID" QueryStringField="itemid" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
