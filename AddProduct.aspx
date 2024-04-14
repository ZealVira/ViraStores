<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="proj1.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/addProduct.css" type="text/css" />
    <style>
        .AddProdtxt{
    font-size: medium;
    padding: 2%;
    margin-bottom: 4%;
        }

        .auto-style1{
            width:250px; 
            margin-right:25px;
        }
        .auto-style2{
            font-size:medium;
        }

.addProdbutton {
    width: 30%;
    height: 25%;
    padding:1%;
    margin-top: 4%;
    background-color: #059DC0;
    border-radius: 23px;
    color: white;
    font-size: larger;
    font-family: Georgia;
    margin-left: 18px;
    border: 2px solid black;
    margin-bottom: 12%;
}


.addProdbutton:hover {
        color: black;
        border-radius: 40px;
        cursor: pointer;
    }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="addProd">
    <h2>ADD PRODUCTS PAGE</h2>
    <center>
    <table class="addProdtbl">
        <tr>
            <td class="auto-style2">Product ID: </td>
            <td style="" ><asp:TextBox ID="txtProdID" runat="server" CssClass="AddProdtxt" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtProdID" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
            
            
        </tr>
        <tr>
            <td class="auto-style2">Name:</td>
            <td class="auto-style1"><asp:TextBox ID="txtName" runat="server" CssClass="AddProdtxt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtName" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">Brand:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlBrand" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name"  CssClass="AddProdtxt"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name] FROM [Brands]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlBrand" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">Price:</td>
            <td class="auto-style1"><asp:TextBox ID="txtPrice" runat="server" CssClass="AddProdtxt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPrice" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">MRP:</td>
            <td class="auto-style1"><asp:TextBox ID="txtMRP" runat="server" CssClass="AddProdtxt"></asp:TextBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtMRP" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">GST:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlGST" runat="server" AutoPostBack="False" CssClass="AddProdtxt">
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                </asp:DropDownList>
                &nbsp;%
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="ddlGST" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">Vegan:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlVegan" runat="server" AutoPostBack="False" CssClass="AddProdtxt">
                    <asp:ListItem>True</asp:ListItem>
                    <asp:ListItem>False</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="ddlVegan" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">Category:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="Category" DataValueField="Category" CssClass="AddProdtxt"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Category] FROM [Category]"></asp:SqlDataSource>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlCategory" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">Subcategory:</td>
            <td class="auto-style1"><asp:TextBox ID="txtSubCat" runat="server" CssClass="AddProdtxt"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtSubCat" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">Size:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlSize" runat="server" CssClass="AddProdtxt">
                    <asp:ListItem>--select--</asp:ListItem>
                    <asp:ListItem>100 grams</asp:ListItem>
                    <asp:ListItem>200 grams</asp:ListItem>
                    <asp:ListItem>250 grams</asp:ListItem>
                    <asp:ListItem>400 grams</asp:ListItem>
                    <asp:ListItem>500 grams</asp:ListItem>
                    <asp:ListItem>1 kg</asp:ListItem>
                    <asp:ListItem>2 kg</asp:ListItem>
                    <asp:ListItem>5 kg</asp:ListItem>
                    <asp:ListItem>250 ml</asp:ListItem>
                    <asp:ListItem>500 ml</asp:ListItem>
                    <asp:ListItem>1 l</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="ddlSize" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">Stock Units:</td>
            <td class="auto-style1"><asp:TextBox ID="txtStock" runat="server" CssClass="AddProdtxt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtStock" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Description:</td>
            <td class="auto-style1"><asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="70" Width="200" CssClass="AddProdtxt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">Disclaimer:</td>
            <td class="auto-style1"><asp:TextBox ID="txtDisclaimer" runat="server" CssClass="AddProdtxt" TextMode="MultiLine" Height="70" Width="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtDisclaimer" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ingredients:</td>
            <td class="auto-style1"><asp:TextBox ID="txtIngr" runat="server" TextMode="MultiLine" CssClass="AddProdtxt" Height="70" Width="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtIngr" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>

            <td class="auto-style2">Image:</td>
            <td class="auto-style1"> <asp:FileUpload ID="FileUpload1" runat="server" CssClass="AddProdtxt"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="FileUpload1" ForeColor="Red" ValidationGroup="Prod" Font-Size="Medium"></asp:RequiredFieldValidator>
                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ></asp:Label>
            </td>
        </tr>

    </table>
    <br />
    <asp:Button class="addProdbutton" ID="Btn2" runat="server" Text="Add Product" OnClick="Btn2_Click"  ValidationGroup="Prod"/>
  </center>
    <asp:Label ID="lbl1" runat="server" Font-Bold="true"  ></asp:Label>
</div>

</asp:Content>
