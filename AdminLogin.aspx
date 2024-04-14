<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="proj1.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Login.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-box" >
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:Label runat="server" ID="Label3" Text ="SIGN IN" Font-Size="XX-Large" style="display:flex;justify-content: center; margin-top:-3px"></asp:Label>
    <hr style="height:2px; background:black; "/>
    <br />
    <asp:TextBox class="text" ID="mstTextBox1" runat="server" placeholder="UserId" Font-Size="Large"></asp:TextBox>
    <br /><br />    <br />
        
    <asp:TextBox class="text" ID="password" runat="server" TextMode="Password" Font-Size="Large" placeholder="Password"></asp:TextBox>
    <br />
    <br />
    
    <asp:Button class="button" ID="Button1" runat="server" Text="Sign IN" Font-Size="Large" OnClick="Button1_Click" />
</div>
</asp:Content>
