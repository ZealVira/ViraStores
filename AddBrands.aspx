<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AddBrands.aspx.cs" Inherits="proj1.AddBrands" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        .info {
    padding: 17px 40px;
    border-radius: 50px;
    cursor: pointer;
    border: 0;
    background-color: white;
    box-shadow: rgb(0 0 0 / 5%) 0 0 8px;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    font-size: 15px;
    transition: all 0.5s ease;
}

.info:hover {
        letter-spacing: 3px;
        background-color: #05526f;
        color: hsl(0, 0%, 100%);
        box-shadow: rgb(93 24 220) 0px 7px 29px 0px;
}

.info:active {
        letter-spacing: 3px;
        background-color: hsl(261deg 80% 48%);
        color: hsl(0, 0%, 100%);
        box-shadow: rgb(93 24 220) 0px 0px 0px 0px;
        transform: translateY(10px);
        transition: 100ms;
}

.gridCat{
    margin-left: 10%;
    margin-bottom:2%;
    margin-top:1%;
    font-size:1.5rem;
    width: 20%;
    text-align: center;
}

    .AddProdtxt{
        font-size: medium;
        padding: 2%;
        margin-bottom: 4%;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h2>Wish to add a new brand</h2>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="AddProdtxt"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Add Brand" OnClick="Button1_Click" CssClass="info" />
    </center><br /> 
        <hr />
    <br />
    <h2>Have a look at all the brands that you have</h2>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource1" CssClass="gridCat">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name of the Brands" ReadOnly="True" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Brands]"></asp:SqlDataSource>
</asp:Content>
