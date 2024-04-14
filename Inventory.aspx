<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="proj1.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <h1>Complete details</h1>
        </center>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="MRP" />
                <asp:BoundField DataField="GST" HeaderText="GST" SortExpression="GST" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Sub-Category" HeaderText="Sub-Category" SortExpression="Sub-Category" />
                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Image1" HeaderText="Image1" SortExpression="Image1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [prodInfo] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [prodInfo] ([ProductId], [Name], [Brand], [Price], [MRP], [GST], [Category], [Sub-Category], [Size], [Stock], [Description], [Image1]) VALUES (@ProductId, @Name, @Brand, @Price, @MRP, @GST, @Category, @column1, @Size, @Stock, @Description, @Image1)" SelectCommand="SELECT * FROM [prodInfo]" UpdateCommand="UPDATE [prodInfo] SET [Name] = @Name, [Brand] = @Brand, [Price] = @Price, [MRP] = @MRP, [GST] = @GST, [Category] = @Category, [Sub-Category] = @column1, [Size] = @Size, [Stock] = @Stock, [Description] = @Description, [Image1] = @Image1 WHERE [ProductId] = @ProductId">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductId" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="MRP" Type="Double" />
                <asp:Parameter Name="GST" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="column1" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Image1" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="MRP" Type="Double" />
                <asp:Parameter Name="GST" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="column1" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Image1" Type="String" />
                <asp:Parameter Name="ProductId" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>
