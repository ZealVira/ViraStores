<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="proj1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .dis{
            width:45%;
            padding: 20px;
            padding-left:20px;
            margin-top: 40px;
            margin-left:auto; margin-right:auto;
            font-size:medium;   
        }
        .text{
            padding-left:40px;
            padding-bottom:50px;
            padding-top:50px;
            margin-bottom:25px;
            font-size:x-large; 
            text-decoration:solid;
            text-decoration:dashed;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            
           
        <div class="dis">
            Name
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" class="text"></asp:Label><br />
            <br />User Id<br />
            <asp:Label ID="Label2" runat="server" class="text"></asp:Label><br />
            <br />Phone Number <br />
            <asp:Label ID="Label3" runat="server" class="text"></asp:Label><br />
            <br /> Gender <br />
            <asp:Label ID="Label4" runat="server" class="text"></asp:Label><br />


        </div>
    </form>
</body>
</html>
