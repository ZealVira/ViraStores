<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="proj1.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="column" style="padding-left:2%">
                <center><h1 style="font-size:2.5rem">Visit us or Call us today</h1></center>
                <h2 style="font-size:1.8rem">Opening <strong>Hours</strong></h2>
                <div style="font-size:1.4rem">Monday - Saturday: <strong>9:00am to 8:00pm</strong><br />
                Sunday: <strong>Closed </strong></div>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Name:" Font-Size="Larger"></asp:Label><br />
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="30" Font-Size="X-Large"></asp:TextBox><br /><br />
                <asp:Label ID="Label2" runat="server" Text="E-mail:" Font-Size="Larger"/><br />
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="X-Large" TextMode="Email"></asp:TextBox><br /><br />
                <asp:Label ID="Label3" runat="server" Text="Message:" Font-Size="Larger"/><br />
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="X-Large" BorderWidth="2" BorderStyle="Solid" TextMode="MultiLine"></asp:TextBox><br /><br />
                <br />
                <asp:Button ID="Button1" runat="server" Font-Size="Larger" Text="Submit" OnClick="Button1_Click" />
                <br /><br />
            </div>
            <div class="column">
               <img src="image/amul1.jpeg" style="position:absolute; top:12rem; left:32rem; width:47%" />
            </div>
        </div>
</asp:Content>
