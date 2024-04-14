<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="try.aspx.cs" Inherits="proj1._try" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Product.css" type="text/css" />
    
<script type="text/javascript">
  
</script>

    <style>
  /* Add your internal CSS rules here */
  #mainContent {
    overflow: auto;
    height: 100%;
  }

  #mainContent::-webkit-scrollbar {
    width: 12px;
    height: 12px;
  }

  #mainContent::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 0, 0.2);
    border-radius: 6px;
  }

  #mainContent::-webkit-scrollbar-track {
    background-color: transparent;
  }

  /* Add other CSS rules as needed */
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h2>You have logged out successfully</h2>
        <h2>Awaiting your presence tilll next time</h2>
        <asp:Button ID="Button1" runat="server" Text="Wish to login in again?" OnClick="Button1_Click1" />
    </center>
</asp:Content>

