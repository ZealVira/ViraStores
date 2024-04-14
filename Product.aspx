<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="proj1.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Product.css" type="text/css" />


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

.recommendations{
    border-style: solid;
    padding:5px;
    height: 50vh;
    width: 17vw;
    border-radius:10px;
}

.quantity{
    height: 12%; 
    width: 65%; 
    border-radius:5px; 
    text-align: center; 
    color: white; 
    font-size: 1.3rem; 
    font-weight: 700; 
    word-wrap: break-word; 
    background-color: #0B60B0; 
    padding-left: 5%; 
    padding-top: 2.4%; 
    padding-bottom: 2.8%; 
    border: none; 
    padding-bottom: 3%;
}

.quantity:hover{
    cursor:pointer;
    font-size:1.6rem;
}  

.info2 {
    position: relative;
    display: inline-block;
    margin: 0px;
    padding: 14px 28px;
    text-align: center;
    font-size: 14px;
    letter-spacing: 1px;
    text-decoration: none;
    color: #05526f;
    background: transparent;
    cursor: pointer;
    transition: ease-out 0.5s;
    border: 2px solid #05526f;
    border-radius: 50px;
    box-shadow: inset 0 0 0 0 #05526f;
}

.info2:hover {
        color: white;
        box-shadow: inset 0 -100px 0 0 #05526f;
}

.info2:active {
        transform: scale(0.9);
}

.addToCart{
    position: relative;
    display: inline-block;
    margin: 0px;
    padding: 14px 28px;
    text-align: center;
    font-size: 20px;
    letter-spacing: 1px;
    text-decoration: none;
    color: #05526f;
    background: transparent;
    cursor: pointer;
    transition: ease-out 0.5s;
    border: 3px solid #05526f;
    border-radius: 18px;
    width: 380px;
}

.addToCart:hover {
        color: white;
        box-shadow: inset 0 -100px 0 0 #05526f;
}

.addToCart:active {
        transform: scale(0.9);
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: flex; flex-direction: row;">
        <div style="text-align: center; width: 62%; border-radius: 4px;">
            <asp:Image ID="Image1" runat="server" class="ProdImage" Style="width: 75%; margin-left: 3%; margin-top: 3%; aspect-ratio: 4/5; object-fit: contain; display: inline-block; vertical-align: middle; height: 75%; margin-right: 1%; mix-blend-mode: darken;" />
        </div>
        <div style="width: 75%; overflow-y:auto; max-height:400px;" id="mainContent">
            <asp:Label ID="brand" runat="server" Style="font-size: 1.3rem; padding-top: 2%; color: rebeccapurple"></asp:Label><br />
            <asp:Label ID="Name" runat="server" Font-Bold="true" Style="font-size: 2.0rem; font-family: Ebrima"></asp:Label><br />
            <br />
            <div style="display: flex;">
                <div style="font-size: x-large; stroke: red; text-decoration: line-through">₹</div>
                <asp:Label ID="MRP" runat="server" Text="" Font-Size="X-Large" Font-Strikeout="true"></asp:Label>&nbsp;&nbsp;
                <div style="font-size:x-large; color:red;"><asp:Label ID="discount" runat="server" Font-Size="X-Large" ForeColor="Red" ></asp:Label>%</div> 
            </div>
            <div style="display: flex;">
                <div style="font-size: xx-large">₹</div>
                <asp:Label ID="price" runat="server" Text="" Font-Size="XX-Large"></asp:Label>
            </div>
            <br />
            <div style="font-size: x-large">
               <b>Vegan: </b> 
            <asp:Label ID="Vegan" runat="server"></asp:Label>
            </div><br />

            <asp:Label ID="stock" runat="server" Font-Size="Larger"></asp:Label>

            <br />
            <br />
            <asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True"  Width="140" Font-Size="Larger" EnableViewState="true" >
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            <asp:Button ID="addToCart" runat="server" Text="Add To Cart" CssClass="addToCart" OnClick="addToCart_Click" /><br />
            <br />

            <div style="font-size:x-large">Size: 
            <asp:Label ID="size" runat="server"></asp:Label> </div> <br />
            <h2>Description about the product: </h2>
            <asp:Label ID="descriptionLabel" runat="server" Style="padding-top: 3%; word-wrap: break-word; font-size: 1.0rem"></asp:Label><br />
            
            <h2>Ingredients of the product: </h2>
            <asp:Label ID="IngredientsLabel" runat="server"></asp:Label><br />
            
            <h2>Legal information: </h2>
            <asp:Label ID="DisclaimerLabel" runat="server"></asp:Label><br />
            <br />
            
        </div>
    </div>
    <hr />
    <div>

            <div style="overflow: auto; white-space: nowrap;">
                <h2>People also buy:</h2>
                <asp:DataList ID="DataList2" runat="server" CellPadding="10" DataSourceID="SqlDataSource2" RepeatColumns="7" RepeatDirection="Horizontal" ForeColor="#333333">
        
                    <ItemTemplate>
                         <table >
                             <tr >
                                <div class="recommendations" >
                                     <center> <asp:ImageButton ID="Image2" runat="server" ImageUrl='<%# Eval("Image1") %>' CommandArgument='<%# Eval("ProductId") %>' OnClick="ImageButton1_Click" style="height: 30vh; width: 30vh; padding-top: 4%; mix-blend-mode: darken "/></center> 
                                 <br />
                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'  style="text-wrap: wrap;"/>
                                 <br />
                                      ₹<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' />
                                 <br />
                                 </div>
                                    </tr>
                             </table>
                     </ItemTemplate>
                   <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
               </asp:DataList>
            </div>
        <hr />
      <div style="overflow: auto; white-space: nowrap;">
        <h2>Customers frequently viewed:</h2>
                <asp:DataList ID="DataList1" runat="server" CellPadding="10" DataSourceID="SqlDataSource1" RepeatColumns="7" RepeatDirection="Horizontal" ForeColor="#333333">
                    <ItemTemplate>
                         <table >
                             <tr >
                                <div class="recommendations">
                                     <center> <asp:ImageButton ID="Image2" runat="server" ImageUrl='<%# Eval("Image1") %>' CommandArgument='<%# Eval("ProductId") %>' OnClick="ImageButton1_Click"  style="height: 30vh; width: 30vh; padding-top: 4%; mix-blend-mode: darken"/></center> 
                                 <br />
                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'  style="text-wrap: wrap;" />
                                 <br />
                                      ₹<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' />
                                 <br />
                                 </div>
                                    </tr>
                             </table>
                     </ItemTemplate>
                   <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            <hr />
        </div>

        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    

    <div>
        <center><h2>Review ofnthis product</h2></center>
        <div style="display: flex; flex-direction: row;">
        
            <div style="text-align: center; width: 32%; border-radius: 4px;font-size:large; margin-left:3px; margin-right:5px;">
                Share your thoughts here<br /><br />
                <asp:TextBox ID="review" runat="server" TextMode="MultiLine" Font-Size="Large" Height="80" ></asp:TextBox><br /><br />
                <asp:Button ID="reviewBtn" runat="server" CssClass="info2" Text="Write a product review" OnClick="reviewBtn_Click"  />
            </div>
            <div style="font-size:large;">
              <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" AutoPostBack="true" >
                <ItemTemplate>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    <br />
                    Reviewed on <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    <br />
                    <asp:Label ID="ReviewLabel" runat="server" Text='<%# Eval("Review") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            </div>
        </div>
      </div>  
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    </div>
</asp:Content>
