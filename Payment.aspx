<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="proj1.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtOrder" runat="server" placeholder="order"></asp:TextBox>

    <br />
    <br />
    <asp:TextBox ID="txtAmount" runat="server" placeholder="amount" ></asp:TextBox>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="txtName" runat="server" placeholder="name"></asp:TextBox>
    <br />
    <br /> <asp:TextBox ID="txtMobileNumber" runat="server" placeholder="mobile" ></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:TextBox ID="txtEmail" runat="server" placeholder="email"></asp:TextBox>

    <br />

    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
</asp:Content>
