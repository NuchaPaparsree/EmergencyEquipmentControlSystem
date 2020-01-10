 <%@ Page Title="test" Language="C#" MasterPageFile="~/SiteMySystem.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MyProject.Test" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding-top:100px; border:solid 1px black;">
    <div style="margin-bottom:50px; margin-left:20px; border:solid 1px black; padding-left:50px;">jhgyg</div>

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Building" HeaderText="Building" SortExpression="Building" />
            <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
            <asp:BoundField DataField="ControllerID" HeaderText="ControllerID" SortExpression="ControllerID" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TestDBConnectionString %>" 
        DeleteCommand="DELETE FROM [Place] WHERE [ID] = @original_ID AND (([Building] = @original_Building) OR ([Building] IS NULL AND @original_Building IS NULL)) AND (([Floor] = @original_Floor) OR ([Floor] IS NULL AND @original_Floor IS NULL)) AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([ControllerID] = @original_ControllerID) OR ([ControllerID] IS NULL AND @original_ControllerID IS NULL))" 
        InsertCommand="INSERT INTO [Place] ([ID], [Building], [Floor], [Area], [ControllerID]) VALUES (@ID, @Building, @Floor, @Area, @ControllerID)" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT ID, Building, Floor, Area, ControllerID FROM Place WHERE (Area LIKE  @area + '%')" 
        UpdateCommand="UPDATE [Place] SET [Building] = @Building, [Floor] = @Floor, [Area] = @Area, [ControllerID] = @ControllerID WHERE [ID] = @original_ID AND (([Building] = @original_Building) OR ([Building] IS NULL AND @original_Building IS NULL)) AND (([Floor] = @original_Floor) OR ([Floor] IS NULL AND @original_Floor IS NULL)) AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([ControllerID] = @original_ControllerID) OR ([ControllerID] IS NULL AND @original_ControllerID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Byte" />
            <asp:Parameter Name="original_Building" Type="String" />
            <asp:Parameter Name="original_Floor" Type="String" />
            <asp:Parameter Name="original_Area" Type="String" />
            <asp:Parameter Name="original_ControllerID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Byte" />
            <asp:Parameter Name="Building" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="ControllerID" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="area" PropertyName="SelectedValue" DefaultValue="%" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Building" Type="String" />
            <asp:Parameter Name="Floor" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="ControllerID" Type="String" />
            <asp:Parameter Name="original_ID" Type="Byte" />
            <asp:Parameter Name="original_Building" Type="String" />
            <asp:Parameter Name="original_Floor" Type="String" />
            <asp:Parameter Name="original_Area" Type="String" />
            <asp:Parameter Name="original_ControllerID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Area" DataValueField="Area" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" SelectCommand="SELECT DISTINCT ID, Area FROM Place"></asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" Width="800px">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"  />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                <asp:TemplateField HeaderText="Email" SortExpression="Email" >
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                <asp:BoundField DataField="InternalNo" HeaderText="InternalNo" SortExpression="InternalNo" />
                <asp:BoundField DataField="ManagerID" HeaderText="ManagerID" SortExpression="ManagerID" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:xPimConnectionString1 %>" 
                SelectCommand="SELECT * FROM [Controller]" ConflictDetection="CompareAllValues" 
                DeleteCommand="DELETE FROM [Controller] WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Section] = @original_Section) OR ([Section] IS NULL AND @original_Section IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([MobileNo] = @original_MobileNo) OR ([MobileNo] IS NULL AND @original_MobileNo IS NULL)) AND (([InternalNo] = @original_InternalNo) OR ([InternalNo] IS NULL AND @original_InternalNo IS NULL)) AND (([ManagerID] = @original_ManagerID) OR ([ManagerID] IS NULL AND @original_ManagerID IS NULL))" 
                InsertCommand="INSERT INTO [Controller] ([ID], [Name], [Department], [Section], [Email], [Password], [MobileNo], [InternalNo], [ManagerID]) VALUES (@ID, @Name, @Department, @Section, @Email, @Password, @MobileNo, @InternalNo, @ManagerID)" OldValuesParameterFormatString="original_{0}" 
                UpdateCommand="UPDATE [Controller] SET [Name] = @Name, [Department] = @Department, [Section] = @Section, [Email] = @Email, [Password] = @Password, [MobileNo] = @MobileNo, [InternalNo] = @InternalNo, [ManagerID] = @ManagerID WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Section] = @original_Section) OR ([Section] IS NULL AND @original_Section IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([MobileNo] = @original_MobileNo) OR ([MobileNo] IS NULL AND @original_MobileNo IS NULL)) AND (([InternalNo] = @original_InternalNo) OR ([InternalNo] IS NULL AND @original_InternalNo IS NULL)) AND (([ManagerID] = @original_ManagerID) OR ([ManagerID] IS NULL AND @original_ManagerID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Department" Type="String" />
                    <asp:Parameter Name="original_Section" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_MobileNo" Type="String" />
                    <asp:Parameter Name="original_InternalNo" Type="String" />
                    <asp:Parameter Name="original_ManagerID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Section" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="MobileNo" Type="String" />
                    <asp:Parameter Name="InternalNo" Type="String" />
                    <asp:Parameter Name="ManagerID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Section" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="MobileNo" Type="String" />
                    <asp:Parameter Name="InternalNo" Type="String" />
                    <asp:Parameter Name="ManagerID" Type="String" />
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Department" Type="String" />
                    <asp:Parameter Name="original_Section" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_MobileNo" Type="String" />
                    <asp:Parameter Name="original_InternalNo" Type="String" />
                    <asp:Parameter Name="original_ManagerID" Type="String" />
                </UpdateParameters>
    </asp:SqlDataSource>
            <br /><br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>