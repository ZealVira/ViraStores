<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="proj1.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .orderButton{
            background-color:crimson;
            color:white;
            font-size:large;
            width:30%;
            padding:15px;
            margin:3%;
            border:none;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<div style="padding-left: 28%; font-size: larger;">
    <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Larger" Font-Bold="true"> </asp:Label>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound"  >
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    
    <!--<asp:DataList ID="DataList1" runat="server" DataKeyField="OrderId" DataSourceID="SqlDataSource1" CellPadding="10" CellSpacing="5" >
    <ItemTemplate >
        <center style="font-size: 22px; font-weight: bold;">
            <asp:Label ID="OrderIdLabel" runat="server" Font-Size="Larger" Text='<%# Eval("OrderId") != DBNull.Value ? "OrderId: " + Eval("OrderId") : "" %>' />
        </center>
        <div style="margin-right:auto; margin-right:auto">
        <table class="data-table" style="border-collapse: collapse; width: 100%;">
            <tr style="background-color: #f2f2f2;">
                <td style="width: 20%; padding: 10px; border:solid; "><b>Sr No</b></td>
                <td style="width: 70%; padding: 10px; border:solid;"><b>Product</b></td>
                <td style="width: 20%; padding: 10px; border:solid; "><b>Quantity</b></td>
            </tr>
            <tr>
                <td style="border:solid; text-align:center">1</td>
                <td style="padding: 5px; border-left:solid; border-bottom:solid; text-align:center  ">
                    <asp:Label ID="Name1Label" runat="server" Text='<%# Eval("Name1") != DBNull.Value ? Eval("Name1") : "" %>' /><br />
                    
                </td>
                <td style="padding: 5px; border:solid; text-align:center ">
                    <asp:Label ID="Quantity1Label" runat="server" Text='<%# Eval("Quantity1") != DBNull.Value ? Eval("Quantity1") : "" %>' /><br />
                    
                    </td>
                </tr>
                <tr>
                    <td style="border:solid; text-align:center">2</td>
                    <td style="padding: 5px; border-left:solid; border-bottom:solid; ">
                        <asp:Label ID="Name2Label" runat="server" Text='<%# Eval("Name2") != DBNull.Value ?  Eval("Name2") : "--" %>' /><br />
                    </td>
                    <td style="padding: 5px; border:solid; text-align:center">
                        <asp:Label ID="Quantity2Label" runat="server" Text='<%# Eval("Quantity2") != DBNull.Value ? Eval("Quantity2") : "--" %>' /><br />
                    </td>
               </tr>
               <tr>
                    <td style="border:solid; text-align:center">3</td>
                    <td style="padding: 5px; border-left:solid; ">
                        <asp:Label ID="Name3Label" runat="server" Text='<%# Eval("Name3") != DBNull.Value ?  Eval("Name3") : "--" %>' /><br />
                    </td>
                    <td style="padding: 5px; border-left:solid; border-right:solid; text-align:center">
                        <asp:Label ID="Quantity3Label" runat="server" Text='<%# Eval("Quantity3") != DBNull.Value ? Eval("Quantity3") : "--" %>' /><br />
                    </td>
                </tr>

                <tr>
                    <td style="border:solid; text-align:center">4</td>
                    <td style="padding: 5px; border:solid;"> 
                        <asp:Label ID="Name4Label" runat="server" Text='<%# Eval("Name4") != DBNull.Value ? Eval("Name4") : "--" %>' /><br />
                    </td>
                    <td style="padding: 5px; border:solid; text-align:center">
                        <asp:Label ID="Quantity4Label" runat="server" Text='<%# Eval("Quantity4") != DBNull.Value ? Eval("Quantity4") : "--" %>' /><br />
                    </td>
                </tr>

                <tr>
                    <td style="border:solid; text-align:center">5</td>
                    <td style="padding: 5px; border:solid;">
                        <asp:Label ID="Name5Label" runat="server" Text='<%# Eval("Name5") != DBNull.Value ? Eval("Name5") : "--" %>' /><br />
                    </td>
                    <td style="padding: 5px; border:solid; text-align:center">
                        <asp:Label ID="Quantity5Label" runat="server" Text='<%# Eval("Quantity5") != DBNull.Value ? Eval("Quantity5") : "--" %>' /><br />
                    </td>
                </tr>

                <tr>
                    <td style="border:solid; text-align:center">6</td>
                    <td style="padding: 5px; border:solid;">
                        <asp:Label ID="Name6Label" runat="server" Text='<%# Eval("Name6") != DBNull.Value ?  Eval("Name6") : "--" %>' /><br />
                    </td>
                    <td style="padding: 5px; border:solid; text-align:center">
                        <asp:Label ID="Quantity6Label" runat="server" Text='<%# Eval("Quantity6") != DBNull.Value ?  Eval("Quantity6") : "--" %>' /><br />
                    </td>
                </tr>

                <tr>
                    <td style="border:solid; text-align:center">7</td>
                    <td style="padding: 5px; border:solid;">
                        <asp:Label ID="Name7Label" runat="server" Text='<%# Eval("Name7") != DBNull.Value ?  Eval("Name7") : "--" %>' /><br />
                    </td>
                    <td style="padding: 5px; border:solid; text-align:center">
                        <asp:Label ID="Quantity7Label" runat="server" Text='<%# Eval("Quantity7") != DBNull.Value ?  Eval("Quantity7") : "--" %>' /><br />
                    </td>
                </tr>

                <tr>
                    <td style="border:solid; text-align:center">8</td>
                    <td style="padding: 5px; border:solid ">
                        <asp:Label ID="Name8Label" runat="server" Text='<%# Eval("Name8") != DBNull.Value ?  Eval("Name8") : "--" %>' /><br />
                    </td> 
                    <td style="padding: 5px; border:solid; text-align:center">
                        <asp:Label ID="Quantity8Label" runat="server" Text='<%# Eval("Quantity8") != DBNull.Value ?  Eval("Quantity8") : "--" %>' /><br />
                    </td>
                </tr>

            </table>

          </div>
        </ItemTemplate>
    </asp:DataList> --> 
</div>
    <center><asp:Button ID="Button1" runat="server" Text="Completed" CssClass="orderButton" OnClick="Button1_Click" /></center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>

</asp:Content>
