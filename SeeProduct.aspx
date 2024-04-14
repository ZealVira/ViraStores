<%@ Page Title="Products Inventory" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="SeeProduct.aspx.cs" Inherits="proj1.SeeProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .lessProd {
        background-color: red;             
    }
    .gridView{
        margin-left: 2%;
        font-size: 1.1rem; 
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><h1 class="subhead" style="padding-bottom:2%">Products Inventory</h1></center>
        
    <asp:GridView ID="GridView2" runat="server" CssClass="gridView" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound" >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="GST" HeaderText="GST" SortExpression="GST" />
            <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="MRP" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
        </Columns>
    </asp:GridView>
    <br /><br />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [prodInfo] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [prodInfo] ([ProductId], [Name], [Price], [GST], [MRP], [Stock], [Size]) VALUES (@ProductId, @Name, @Price, @GST, @MRP, @Stock, @Size)" SelectCommand="SELECT [ProductId], [Name], [Price], [GST], [MRP], [Stock], [Size] FROM [prodInfo]" UpdateCommand="UPDATE [prodInfo] SET [Name] = @Name, [Price] = @Price, [GST] = @GST, [MRP] = @MRP, [Stock] = @Stock, [Size] = @Size WHERE [ProductId] = @ProductId">
        <DeleteParameters>
            <asp:Parameter Name="ProductId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductId" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Double" />
            <asp:Parameter Name="GST" Type="Double" />
            <asp:Parameter Name="MRP" Type="Double" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter Name="Size" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Double" />
            <asp:Parameter Name="GST" Type="Double" />
            <asp:Parameter Name="MRP" Type="Double" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="ProductId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>











    <div style=" top:8%; left:20%; margin-top:5%">
        <h1 class="subhead" style="padding-bottom:2%">Products Inventory</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="2px" CellPadding="7"  DataKeyNames="ProductId" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ItemStyle-Font-Underline="false" />
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="GST" HeaderText="GST" SortExpression="GST" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Sub-Category" HeaderText="Sub-Category" SortExpression="Sub-Category" />
                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Image1" SortExpression="Image1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="220px" ImageUrl='<%# Eval("Image1") %>' Width="220px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#041560" Font-Size="Larger" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [prodInfo] WHERE [ProductId] = @ProductId" 
            InsertCommand="INSERT INTO [prodInfo] ([ProductId], [Name], [Brand], [Price], [GST], [Category], [Sub-Category], [Size], [Stock], [Description], [Image1]) VALUES (@ProductId, @Name, @Brand, @Price, @Discount, @Category, @column1, @Size, @Stock, @Description, @Image1)" 
            SelectCommand="SELECT * FROM [prodInfo]" 
            UpdateCommand="UPDATE [prodInfo] SET [Name] = @Name, [Brand] = @Brand, [Price] = @Price, [GST] = @GST, [Category] = @Category, [Sub-Category] = @column1, [Size] = @Size, [Stock] = @Stock, [Description] = @Description, [Image1] = @Image1 WHERE [ProductId] = @ProductId">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductId" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
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
                <asp:Parameter Name="GST" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="column1" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Image1" Type="String" />
                <asp:Parameter Name="ProductId" Type="String"  />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
