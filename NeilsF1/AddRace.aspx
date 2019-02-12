<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRace.aspx.cs" Inherits="NeilsF1.AddRace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RaceID" DataSourceID="SqlDataSourceRaces">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RaceID" HeaderText="RaceID" SortExpression="RaceID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="RaceDate" HeaderText="RaceDate" DataFormatString="{0:d}" SortExpression="RaceDate" />
            <asp:BoundField DataField="RaceName" HeaderText="RaceName" SortExpression="RaceName" />
            <asp:BoundField DataField="CircuitName" HeaderText="CircuitName" SortExpression="CircuitName" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSourceRaces" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" TableName="Races" EnableDelete="True">
    </asp:LinqDataSource>
    <asp:SqlDataSource ID="SqlDataSourceRaces" runat="server" ConnectionString="<%$ ConnectionStrings:FormulaOneConnectionString %>"
        SelectCommand="SELECT Race.RaceID, Race.RaceDate, Race.RaceName, Circuit.CircuitName
        FROM Race INNER JOIN Circuit ON Race.CircuitID = Circuit.CircuitID
        ORDER BY Race.RaceDate"
        DeleteCommand="DELETE FROM [Race] WHERE RaceID=@RaceID"
        UpdateCommand="UPDATE Race
SET RaceName = @RaceName, RaceDate = @RaceDate
WHERE RaceID=@RaceID">
        <DeleteParameters>
            <asp:Parameter Name="RaceID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="RaceName" />
            <asp:Parameter Name="RaceDate" />
            <asp:Parameter Name="RaceID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="RaceNameTxt" runat="server"></asp:TextBox>
    <asp:DropDownList ID="CircuitDpd" runat="server" DataSourceID="LinqDataSourceCircuitname" DataTextField="CircuitName" DataValueField="CircuitID"></asp:DropDownList>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:LinqDataSource ID="LinqDataSourceCircuitname" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" TableName="Circuits">
    </asp:LinqDataSource>
    <asp:Button ID="AddRaceBtn" runat="server" Text="Add Race" OnClick="AddRaceBtn_Click" />
</asp:Content>
