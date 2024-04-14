<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="Amul.aspx.cs" Inherits="proj1.Amul" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Brands.css" type="text/css" />
    <style>
        .productcard {
            
            display: flex;
        }
    #Image2{
               height : 30vh;
               width : 30vh
           }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center> <h1 >Amul</h1> </center> 
    <div  class="box" style="display:flex;  ">
        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>
                <img src="image/amul_cheese.jpg" style="height:85%; width:85%"/>
                <h2>Amul Cheese</h2>
                <asp:Button ID="Button1" runat="server" Text="Add To Cart" class="cart" style="background-color: #ABD3FF; margin: 1%; padding: 6px; border-radius: 35px; border:none; "/> 
            </center>
        </div>

        <div class="quickshopping1" style="border-bottom-left-radius: 12%; height: 15%; width:30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>
                <img src="image/HomePage/amulButter.png" style="height:85%; width:85%" />
                <h2>Amul Butter</h2>
                <asp:Button ID="Button2" runat="server" Text="Add To Cart" class="cart" /> 
            </center>
        </div>

        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>
                <img src="image/HomePage/ATaaza.png" style="height:85%; width:85%" />
                <h2>Amul Taaza </h2>
                <asp:Button ID="Button3" runat="server" Text="Add To Cart" class="cart" /> 
            </center>
        </div>

        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>
            <img src="image/HomePage/AFC.jpg" style="height:85%; width:85%" />
            <h2>Amul Butter</h2>
            <asp:Button ID="Button4" runat="server" Text="Add To Cart" class="cart" /> </center>
        </div>
    </div>

    <div  class="box" style="display:flex; ">
        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>
                <img src="image/HomePage/AB100.jpg" style="height:85%; width:85%; margin:auto"/>
                <h2>Amul Butter 100 g</h2>
                <asp:Button ID="Button5" runat="server" Text="Add To Cart" class="cart" /> 
            </center>
        </div>

        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>
                <img src="image/HomePage/amulMasti.jpg" style="height:85%; width:85%" />
                <h2>Amul Masti</h2>
                <asp:Button ID="Button6" runat="server" Text="Add To Cart" class="cart" />
            </center>
        </div>

        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center>    
                <img src="image/HomePage/AmulGhee.jpg" style="height:85%; width:85%" />
                <h2>Amul Ghee </h2>
                <asp:Button ID="Button7" runat="server" Text="Add To Cart" class="cart" /> 
            </center>
        </div>

        <div class="quickshopping" style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
            <center> 
                <img src="image/HomePage/amulKool.jpg" style="height:85%; width:85%" />
                <h2>Amul Kool Milk</h2>
                <asp:Button ID="Button8" runat="server" Text="Add To Cart" class="cart" /> 
            </center>
        </div>

    </div>

    <div >
        <asp:DataList ID="DataList1" runat="server" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="3px" CellPadding="10" DataSourceID="SqlDataSource1" 
            Font-Bold="True" Font-Italic="False" Font-Names="Georgia" Font-Overline="False" 
            Font-Size="Larger" Font-Strikeout="False" GridLines="Horizontal"
            HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Vertical" 
            RepeatLayout="Table">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <ItemTemplate>
                <table >
                    <tr>
                       <div style="border-bottom-left-radius: 12%; height: 50vh; width: 40vh; border-top-right-radius: 12%; padding: 5%; margin-left: 4%; margin-right: 4%; background-color: #98F3FF; margin-bottom: 6%;" >
                             <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Image1") %>' style="height: 30vh; width: 30vh; padding-top: 4%; justify-content:center" />
                        
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' />
                     </div>
                           </tr>

                </table>

               <!-- <div style="border-bottom-left-radius: 12%; height: 15%; width: 30%; border-top-right-radius: 12%; padding: 2%; margin-left: 2%; margin-right: 2%; background-color: #98F3FF; margin-bottom: 3%;">
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1") %>' style="height: 53%; width: 100%; padding-top: 4%;" />
                <br />
                <asp:Label ID="PriceLabel" runat="server" Font-Bold="False" Font-Size="Medium" Text='<%# Eval("Price") %>' />
                </div>-->
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Price], [Image1] FROM [prodInfo] WHERE [Brand] = 'amul'
"></asp:SqlDataSource>
    </div>
</asp:Content>
