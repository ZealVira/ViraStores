<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="proj1.AddCategory" %>
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
        background-color: hsl(261deg 80% 48%);
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
        <h2>Wish to add a new Category of product?</h2>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="AddProdtxt" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Add Brand" CssClass="info" OnClick="Button1_Click" />
    </center><br /> 
        <hr />
    <br />
    <h2>Have a look at all the categories that you have</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Category" DataSourceID="SqlDataSource1" CssClass="gridCat">
        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True" SortExpression="Category" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
</asp:Content>
