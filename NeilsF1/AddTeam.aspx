<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTeam.aspx.cs" Inherits="NeilsF1.AddTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="TeamID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="TeamName" HeaderText="Entrant" SortExpression="TeamName" />
            <asp:BoundField DataField="Constructor" HeaderText="Constructor" SortExpression="Constructor" />
            <asp:BoundField DataField="Chassis" HeaderText="Chassis" SortExpression="Chassis" />
            <asp:BoundField DataField="Engine" HeaderText="Engine" SortExpression="Engine" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FormulaOneConnectionString %>" SelectCommand="SELECT Team.* FROM Team" UpdateCommand="UPDATE Team
SET TeamName=@TeamName, Constructor=@Constructor, Chassis=@Chassis, Engine=@Engine
WHERE TeamID=@TeamID" DeleteCommand="DELETE FROM Team
WHERE TeamID=@TeamID">
        <DeleteParameters>
            <asp:Parameter Name="TeamID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TeamName" />
            <asp:Parameter Name="Constructor" />
            <asp:Parameter Name="Chassis" />
            <asp:Parameter Name="Engine" />
            <asp:Parameter Name="TeamID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:LinqDataSource ID="LinqDataTeamList" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" GroupBy="TeamName" Select="new (key as teamname, it as Teams)" TableName="Teams" EnableUpdate="True">
    </asp:LinqDataSource>

    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="TeamNameLbl" runat="server" Text="Entrant"></asp:Label>
        <asp:TextBox ID="TeamNameTxt" runat="server"></asp:TextBox>
        <asp:Label ID="ConstructorLbl" runat="server" Text="Constructor"></asp:Label>
        <asp:TextBox ID="ConstructorTxt" runat="server"></asp:TextBox>
        <asp:Label ID="ChassisLbl" runat="server" Text="Chassis"></asp:Label>
        <asp:TextBox ID="ChassisTxt" runat="server"></asp:TextBox>
        <asp:Label ID="EngineLbl" runat="server" Text="Power Unit"></asp:Label>       
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:Button ID="EngineTxt" runat="server" Text="Add Team" OnClick="addTeamBtn_Click" />
    </asp:Panel>
</asp:Content>
