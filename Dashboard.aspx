<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="proj1.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .card{
           height: 180px;
            width: 200px;
            box-shadow: rgba(0, 0, 0, 0.55) 0px 5px 15px;
            background-color: #76a4b1c9;
            margin: 2%;
            text-align: center;
            vertical-align: middle;
            border-radius: 20px;
            padding-top: 4%;
        }

        .text{
            text-decoration: none;
            font-size: 2.5rem;
            color: aliceblue;
        }

        .card:hover{
            transform:scale(1.1);
            padding: 10px;
            box-shadow: 5px 10px 18px grey;
        }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display:flex; margin-top:2%;">
         <div class="card" >
             <i class="bi bi-clipboard-check" style="font-size:2rem" ></i><br />
            <asp:LinkButton ID="orderLink" runat="server"  Font-Underline="false" PostBackUrl="~/Orders.aspx" CssClass="text">Track Orders</asp:LinkButton>
        </div>

        <div class="card" >
            <i class="bi bi-database-fill-add" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="addProductLink" runat="server" Font-Underline="false" PostBackUrl="~/AddProduct.aspx " CssClass="text" >Add Products</asp:LinkButton>
        </div>

        <div class="card" >
            <i class="bi bi-bar-chart" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="checkReportsLink" runat="server" Font-Underline="false" PostBackUrl="~/Reports.aspx" CssClass="text" >Reports</asp:LinkButton>
        </div>

        <div class="card" >
            <i class="bi bi-database-check" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="seeWholeProductsInventoryLink" runat="server" Font-Underline="false" PostBackUrl="~/SeeProduct.aspx" CssClass="text">Products Inventory</asp:LinkButton>
        </div>  
    </div>


    <div style="display:flex">
         <div class="card" >
             <i class="bi bi-person-check" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="manageProfilesLink" runat="server"  Font-Underline="false" PostBackUrl="~/ProfileAdmin.aspx" CssClass="text" >Manage Users</asp:LinkButton>
        </div>

         <div class="card" >
             <i class="bi bi-database-fill-check" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="inventoryLink" runat="server" Font-Underline="false" PostBackUrl="~/Inventory.aspx" CssClass="text" >Quick Inventory</asp:LinkButton>
        </div>

        <div class="card" >
            <i class="bi bi-plus" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="addBrandsLink" runat="server" Font-Underline="false" PostBackUrl="~/AddBrands.aspx" CssClass="text" >Add a new Brand</asp:LinkButton>
        </div>

        <div class="card" >
            <i class="bi bi-tag" style="font-size:2rem"></i><br />
            <asp:LinkButton ID="addCategLink" runat="server" Font-Underline="false" PostBackUrl="~/AddCategory.aspx" CssClass="text" >Add a new Category</asp:LinkButton>
        </div>
    </div>
</asp:Content>
