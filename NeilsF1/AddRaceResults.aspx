<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRaceResults.aspx.cs" Inherits="NeilsF1.AddRaceResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="RaceTitleDpd" runat="server" DataSourceID="LinqDataSourceRaceTitle" DataTextField="RaceName" DataValueField="RaceID" OnSelectedIndexChanged="RaceTitleDpd_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <asp:LinqDataSource ID="LinqDataSourceRaceTitle" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" TableName="Races" OrderBy="RaceDate">
    </asp:LinqDataSource>
    <h2><asp:Label runat="server" Text="" ID="RaceTitleLbl"></asp:Label></h2>
    <asp:GridView ID="GridViewRaceResult" runat="server" AutoGenerateColumns="False" DataKeyNames="RaceResultID" DataSourceID="SqlDataSource1" OnRowDeleted="GridViewRaceResult_RowDeleted" OnRowDeleting="GridViewRaceResult_RowDeleting">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="FinalPosition" HeaderText="Position" SortExpression="FinalPosition" />
            <asp:BoundField DataField="Fullname" HeaderText="Driver" SortExpression="Fullname" ReadOnly="True" />
            <asp:BoundField DataField="TeamName" HeaderText="Team" SortExpression="TeamName" />
            <asp:BoundField DataField="RaceTime" HeaderText="Time" SortExpression="RaceTime" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FormulaOneConnectionString %>"
        DeleteCommand="DELETE FROM RaceResult
WHERE RaceResultID=@RaceResultID"
        SelectCommand="Result" SelectCommandType="StoredProcedure"
        UpdateCommand="UPDATE RaceResult
SET RaceTime=@RaceTime
WHERE RaceResultID=@RaceResultID">
        <DeleteParameters>
            <asp:Parameter Name="RaceResultID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="115" Name="param1" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="RaceTime" />
            <asp:Parameter Name="RaceResultID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="PanelAddResult" runat="server">
        <asp:Label ID="DriverLbl" runat="server" Text="Label">Driver</asp:Label><asp:DropDownList ID="DriverCbx" runat="server" DataSourceID="SqlDataSourceDriver" DataTextField="Fullname" DataValueField="DriverID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDriver" runat="server" ConnectionString="<%$ ConnectionStrings:FormulaOneConnectionString %>" SelectCommand="SELECT DriverID, FirstName + ' ' + SecondName AS Fullname FROM Driver"></asp:SqlDataSource>
        <asp:Label ID="TeamLbl" runat="server" Text="Label">Team</asp:Label><asp:DropDownList ID="TeamCbx" runat="server" DataSourceID="LinqDataSourceTeam" DataTextField="TeamName" DataValueField="TeamID"></asp:DropDownList>
        <asp:LinqDataSource ID="LinqDataSourceTeam" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" TableName="Teams">
        </asp:LinqDataSource>
        <asp:Label ID="PositionLbl" runat="server" Text="Label">Position</asp:Label><asp:TextBox ID="PositionTxt" runat="server"></asp:TextBox>
        
        <asp:Label ID="TimeLbl" runat="server" Text="Time (HH/MM/SS)"></asp:Label>
        <asp:TextBox ID="HourTxt" runat="server" Width="50px"></asp:TextBox>
        <asp:TextBox ID="MinuteTxt" runat="server" Width="50px"></asp:TextBox>
        <asp:TextBox ID="SecondTxt" runat="server" Width="50px"></asp:TextBox>
        <asp:Button ID="AddResultBtn" runat="server" Text="Add Result" OnClick="AddResultBtn_Click" />
    </asp:Panel>
    </asp:Content>
