<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="proj1.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
                <br /><br />
            <asp:Label ID="Label4" runat="server" Text="Forgot your password?" Font-Size="XX-Large" ></asp:Label><hr style="width:40%;"/>
            <div style = "border:solid 1px; border-radius:5px; width:fit-content; padding:20px; padding-left:20px; margin-top:40px; margin-left:auto; margin-right:auto;">
                <asp:Label ID="Label5" runat="server" Text="Enter your mail ID"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Larger"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Send OTP" OnClick="Button1_Click" class="button"/>
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Enter OTP received on your mail acount" Font-Size="X-Large"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter OTP" class="text" Font-Size="X-Large"></asp:TextBox>
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Resend OTP</asp:LinkButton>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Verify" OnClick="Button2_Click" class="button"/>
                <br />
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Font-Size="Medium" ></asp:Label>
                
            </div>
            </center>
</asp:Content>
