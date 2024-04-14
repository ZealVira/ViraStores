<%@ Page Title="" Language="C#" MasterPageFile="BasicLayout.Master" AutoEventWireup="true" CodeBehind="LoginMaster.aspx.cs" Inherits="proj1.LoginMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Login.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="login-box" >
            <br />
            <center>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Label runat="server" ID="Label3" Text ="SIGN IN" Font-Size="XX-Large" style="display:flex;justify-content: center; margin-top:-3px"></asp:Label>
                <hr style="height:2px; background:black; "/>
                <br />
                <asp:TextBox class="text" ID="mstTextBox1" runat="server" placeholder="UserId" Font-Size="Large"></asp:TextBox>
                <br /><br />    
                
                <br />
                <asp:TextBox class="text" ID="password" runat="server" TextMode="Password" Font-Size="Large" placeholder="Password"></asp:TextBox>
                <br /><asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#FF6600" Font-Size="Small" Font-Underline="False" PostBackUrl="ForgotPassword.aspx" class="loginlink" OnClick="LinkButton1_Click">Forgot password?</asp:LinkButton>
                <br />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me?" />
                <br /><br />
                <asp:Button class="button" ID="Button1" runat="server" Text="Sign IN" Font-Size="Large" OnClick="Button1_Click" />
                <br />
                <hr style="height:2px; background:black;"/>
                <center><asp:Label ID="Label5" runat="server" Text="New to Vira Stores?" style=""></asp:Label></center>
                <br />
                <asp:Button class="button" ID="Button2" runat="server" Text="Create Your Account" OnClick="Button2_Click1"  />
                <br />
            </center>
        </div>
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <asp:Label ID="Label7" runat="server"></asp:Label>
        
</asp:Content>
