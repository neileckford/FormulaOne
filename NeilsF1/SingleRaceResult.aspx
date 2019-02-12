<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SingleRaceResult.aspx.cs" Inherits="NeilsF1.SingleRaceResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="RaceTitleDpd" runat="server" DataSourceID="LinqDataSourceRaceTitle" DataTextField="RaceName" DataValueField="RaceID" OnSelectedIndexChanged="RaceTitleDpd_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <asp:LinqDataSource ID="LinqDataSourceRaceTitle" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" TableName="Races">
    </asp:LinqDataSource>
    <h2><asp:Label runat="server" Text="" ID="RaceTitleLbl"></asp:Label></h2>
    <asp:GridView ID="GridViewRaceResult" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="RaceID" HeaderText="RaceID" SortExpression="RaceID" />
            <asp:BoundField DataField="FinalPosition" HeaderText="FinalPosition" SortExpression="FinalPosition" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FormulaOneConnectionString %>" SelectCommand="SELECT RaceResult.RaceID, RaceResult.FinalPosition, Driver.FirstName, Team.TeamName FROM RaceResult INNER JOIN Driver ON RaceResult.DriverID = Driver.DriverID INNER JOIN Team ON RaceResult.TeamID = Team.TeamID"></asp:SqlDataSource>
</asp:Content>
