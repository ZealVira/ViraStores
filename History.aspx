<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="proj1.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn{
            font-size:medium;
            padding:3%;
            background-color:mediumblue;
            border-radius: 5px;
            border:none;
            color:white;
            margin-right:4%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; ">
        <center><h2>VIEW YOUR ORDER HISTORY HERE</h2></center>

        <asp:DataList ID="DataList1" runat="server" DataKeyField="OrderId" DataSourceID="SqlDataSource1" RepeatLayout="Flow" >
          <ItemTemplate>
            <table style="border: solid; margin-left: 8%; display: block; margin-right: 6%;">
                <tr>
                    <td style="width:22%">
                        Order ID
                    </td>
                    <td style="width:22%">
                        Date
                    </td>
                    <td style="width:20%">
                        Total
                    </td>
                    <td style="width:20%">
                        Status
                    </td>
                    <td style="width:48%;">

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="OrderIdLabel" runat="server" ForeColor="DarkGray" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date") %>' />
                    </td>
                    <td>
                        ₹<asp:Label ID="Label1" runat="server" Text='<%# Eval("Total") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="View Complete Order" CssClass="btn" OnClick="Button1_Click" CommandName="ViewOrder" CommandArgument='<%# Eval("OrderId") %>' />
                    </td>
                </tr>
            </table>
            
<br />
        </ItemTemplate>
    </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
</asp:Content>
