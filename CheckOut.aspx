<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="proj1.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .orderButton{
        background-color:deepskyblue;
        color:black;
        font-size:large;
        width:30%;
        padding:15px;
        margin:3%;
        border:none;
}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divToPrint" runat="server" style="padding-left: 28%; font-size: larger;">
    <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Larger" Font-Bold="true"> </asp:Label>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="OrderId" DataSourceID="SqlDataSource1" CellPadding="10" CellSpacing="5" >
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
    </asp:DataList>
        HIEEEEEEEEEEEEE<br />
dudeeeeeeeeee
        <div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" >
                
            </asp:GridView>
        </div>
</div>
    <center><asp:Button ID="Button1" runat="server" Text="Done" CssClass="orderButton" OnClick="Button1_Click" />
        <br />
        </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />


    <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"  >
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-Width="70" >

                </asp:BoundField>
                
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    </div>
</asp:Content>
