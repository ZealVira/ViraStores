<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="proj1.Brands" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.brandTable{
    border-bottom-left-radius: 12%; 
    height: 50vh; 
    width: 40vh; 
    border-top-right-radius: 12%; 
    padding: 5%; 
    margin-left: 4%; 
    margin-right: 4%; 
    background-color: #ffffff;
    border: 1px solid #05526f;
    margin-bottom: 6%;
    min-height:320px;
    color:black;
}

.ViewMoreButton{
    width: 80%;
    height: 10%;
    text-align: center;
    color: white;
    /* word-wrap: break-word; */
    background-color: rgba(4, 31, 96, 0.77);
    padding-left: 5%;
    border-radius: 8px;
    border:none;

}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div >
            <center><h1>Showing products for <asp:Label ID="Label2" runat="server" ></asp:Label></h1></center>
        <asp:DataList ID="DataList1" runat="server" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="3px" CellPadding="10" DataSourceID="SqlDataSource1" 
            Font-Bold="True" Font-Italic="False" Font-Names="Georgia" Font-Overline="False" 
            Font-Size="Larger" Font-Strikeout="False" GridLines="Horizontal"
            HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Vertical" 
            RepeatLayout="Table" >
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#FFFFFF" ForeColor="#4A3C8C" />
            <ItemTemplate>
                <table >
                    <tr>
                       <div class="brandTable" style="" >
                            <center> <asp:ImageButton ID="Image2" runat="server" ImageUrl='<%# Eval("Image1") %>'  OnClick="Button1_Click" CommandArgument='<%# Eval("ProductId") %>' style="height: 30vh; width: 30vh; padding-top: 4%; "/></center> 
                        <br />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'  style="min-height:210px; color: black; " />
                        <br />
                             ₹<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' />
                        <br />
                             
                     </div>
                           </tr>

                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    </div>

   
</asp:Content>
