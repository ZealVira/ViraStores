<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="H1.aspx.cs" Inherits="proj1.H1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <!--heloo
    <asp:Menu ID="Menu1" runat="server" Orientation="Vertical">
        <DynamicMenuStyle HorizontalPadding="5px" />
        <Items>
            <asp:MenuItem Text="Dairy" Value="Dairy">
                <asp:MenuItem Text="Milk" Value="Milk"></asp:MenuItem>
                <asp:MenuItem Text="Ghee" Value="Ghee"></asp:MenuItem>
                <asp:MenuItem Text="Dahi" Value="Dahi"></asp:MenuItem>
                <asp:MenuItem Text="Butter" Value="Butter"></asp:MenuItem>
                <asp:MenuItem Text="Cheese" Value="Cheese"></asp:MenuItem>
                <asp:MenuItem Text="Cheese Spread" Value="Cheese Spread"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="Juice" Value="Juice">
                <asp:MenuItem Text="Real" Value="Real"></asp:MenuItem>
                <asp:MenuItem Text="Mapro" Value="Mapro"></asp:MenuItem>
                <asp:MenuItem Text="Manama" Value="Manama"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="Frozen" Value="Frozen">
                <asp:MenuItem Text="Peas" Value="Peas"></asp:MenuItem>
                <asp:MenuItem Text="Mc Cain's" Value="Mc Cain's"></asp:MenuItem>
            </asp:MenuItem>
        </Items>
    </asp:Menu>
    <h1 style="font-family:monospace" >hiiiiii....</h1>
    <input type="password" id="txtPassword" />
    <input type="checkbox" id="cbShowPassword" />Show password
    --->

    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    <br /><br />
    <asp:Label ID="Label1" runat="server" ></asp:Label>
</asp:Content>
