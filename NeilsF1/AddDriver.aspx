<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="NeilsF1.AddDriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DriverID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="DriverID" HeaderText="DriverID" SortExpression="DriverID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="SecondName" HeaderText="SecondName" SortExpression="SecondName" />
            <asp:BoundField DataField="TeamID" HeaderText="TeamID" SortExpression="TeamID" />
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FormulaOneConnectionString %>" SelectCommand="SELECT Driver.*, Team.TeamName FROM Driver INNER JOIN Team ON Driver.TeamID = Team.TeamID" UpdateCommand="UPDATE Driver
SET FirstName=@FirstName, SecondName=@SecondName
WHERE DriverID=@DriverID">
        <UpdateParameters>
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="SecondName" />
            <asp:Parameter Name="DriverID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="PanelAddDriver" runat="server">
        <asp:Label ID="FirstNameLbl" runat="server" Text="First Name: "></asp:Label><asp:TextBox ID="FirstNameTxt" runat="server"></asp:TextBox>
        <asp:Label ID="SecondNameLbl" runat="server" Text="Second Name: "></asp:Label><asp:TextBox ID="SecondNameTxt" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownTeams" runat="server" DataSourceID="LinqDataSourceTeams" DataTextField="TeamName" DataValueField="TeamID"></asp:DropDownList>
        <asp:LinqDataSource ID="LinqDataSourceTeams" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" TableName="Teams">
        </asp:LinqDataSource>
        <asp:Button ID="submitDriver" runat="server" Text="Submit" OnClick="submitDriver_Click" />
    </asp:Panel>
</asp:Content>
