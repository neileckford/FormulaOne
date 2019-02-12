<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCircuit.aspx.cs" Inherits="NeilsF1.AddCircuit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CircuitID" DataSourceID="LinqDataCircuitList">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="CircuitName" HeaderText="Circuit Name" SortExpression="CircuitName" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataCircuitList" runat="server" ContextTypeName="NeilsF1.FormulaOneDataContext" EntityTypeName="" OrderBy="CircuitName" TableName="Circuits" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:Label ID="Label1" runat="server" Text="Circuit Name: "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Add Circuit" OnClick="Button1_Click" />
</asp:Content>
