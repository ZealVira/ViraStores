<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="RecreatePasswordaspx.aspx.cs" Inherits="proj1.RecreatePasswordaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Password.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style = "border: solid 1px;border-radius:5px; width: fit-content; padding: 20px;padding-left:20px; margin-top:40px; margin-left: auto; margin-right: auto;">
            <center><asp:Label ID="Label1" runat="server" Text="Create password" Font-Size="Larger"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Re-enter your password" Font-Size="Larger"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox2" ></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage=" Password does not match" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ForeColor="Red"></asp:CompareValidator>
                <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Reset" OnClick="Button1_Click" style="height: 35px" />
            <br /></center>
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <br />
        </div>
   
</asp:Content>
