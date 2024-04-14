<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="proj1.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Home.css" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
        .headings{
            background-color: #76a4b1c9;
        }

        .headings span{
            color:rgb(5 82 111);
        }

        .cat-img1 {
    padding: 7px;
    width: 18%;
    height: 20%;
    margin-left: 30px;
    text-align: center;
    margin: 0.98%;
    background-color:white;
    box-shadow:none;
    border:none;
}

.but1 {
    background-color: #05526fcc;
    margin: 2%;
    padding: 10px;
    border-radius: 35px;
    cursor: pointer;
    border: none;
    color: white;
    font-style: italic;
    font-family: serif;
    color: white;
}

.quickShopping {
    border-bottom-left-radius: 12%;
    height: 20%;
    width: 30%;
    border-top-right-radius: 12%;
    padding: 2%;
    margin-left: 2%;
    margin-right: 2%;
    margin-bottom: 3%;
    min-height: 300px;
    font-size: larger;
    border: 1.8px solid #1e647d;
    background-color:white;
}

.addToCart {
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
   
    <center>
        <h2 class="headings">
            <center>Shop by <span>Category</span></center>
        </h2>
    </center>
    <div class="Category">
        <div class="cat-img1">
            <asp:ImageButton ID="ImageButton1" runat="server" src="image/HomePage/breads.jpg" class="HomeCategoryImg" Height="90%" Width="90%" Style="border-radius: 50px;" OnClick="ImageButton1_Click" />
            <h3>Breads</h3>
        </div>

        <div class="cat-img1">
            <asp:ImageButton ID="ImageButton2" runat="server" src="image/HomePage/dairy.jpg" class="HomeCategoryImg" Height="90%" Width="90%" Style="border-radius: 50%" OnClick="ImageButton2_Click" />
            <center>
                <h3>Dairy</h3>
            </center>
        </div>

        <div class="cat-img1">
            <asp:ImageButton ID="ImageButton3" runat="server" src="image/HomePage/canned.jpg" class="HomeCategoryImg" Height="90%" Width="90%" Style="border-radius: 100px" OnClick="ImageButton3_Click" />
            <center>
                <h3>Canned</h3>
            </center>
        </div>

        <div class="cat-img1">
            <asp:ImageButton ID="ImageButton4" runat="server" src="image/HomePage/fries.jpg" class="HomeCategoryImg" Height="90%" Width="90%" Style="border-radius: 100px" OnClick="ImageButton4_Click" />
            <center>
                <h3>Frozen</h3>
            </center>
        </div>

        <div class="cat-img1">
            <asp:ImageButton ID="ImageButton5" runat="server" src="image/HomePage/ketchup.jpg" class="HomeCategoryImg" Height="90%" Width="90%" Style="border-radius: 100px" OnClick="ImageButton5_Click" />
            <center>
                <h3>Packed</h3>
            </center>
        </div>

    </div>

   
    <!--<div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div>
                        <h1>Most sold products</h1>
                    </div>
                    <div style="display:flex; justify-content:space-between; ">
                        <img src="image/HomePage/MordeDark.jpg" class="carousel-image" alt="2." />
                        <img src="image/HomePage/amulGhee.jpg" class="carousel-image"  alt="2." />   
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container" style="display: flex; flex-direction: column;">
                    <div>
                        <h1>Most sold products</h1>
                        <p>cdbfweuffcwefcbwecjkwejfcwcjwe jcweb cwejcwcc</p>
                    </div>
                    <div style="display:flex; justify-content:space-between; ">
                        <img src="image/HomePage/VTandoori.png" width="200" height="200" class="carousel-image" alt="2." />
                        <img src="image/HomePage/breads.jpg" width="200" height="200" class="d-block w-100" alt="2." />
                    </div>
                </div>   
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>-->
    <br /><br />
    <hr /><br />
       <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" Interval="6000" runat="server" />

    <asp:UpdatePanel ID="up1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
            
            <asp:AdRotator runat="server" AdvertisementFile="XMLFile1.xml" ></asp:AdRotator>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

    <hr />
    <center>
        <h2 class="headings">
            <center>Featured <span>Brands</span></center>
        </h2>
    </center>
    <div class="CategoryBrands">
        <asp:ImageButton ID="ImageButton6" runat="server" src="image/HomePage/amul.png" class="brands" OnClick="ImageButton6_Click" />
        <asp:ImageButton ID="ImageButton7" runat="server" src="image/HomePage/gowardhan.png" class="brands" OnClick="ImageButton7_Click" />
        <asp:ImageButton ID="ImageButton8" runat="server" src="image/HomePage/britannia.png" class="brands" OnClick="ImageButton8_Click" />
        <asp:ImageButton ID="ImageButton9" runat="server" src="image/HomePage/veeba.png" class="brands" OnClick="ImageButton9_Click" />
        <asp:ImageButton ID="ImageButton11" runat="server" src="image/HomePage/mapro.png" class="brands" OnClick="ImageButton11_Click" />   
    </div>

    <br />
    <hr />

    <center>
        <h2 class="headings">
            <center><span>Best</span>Selling </center>
        </h2>
    </center>
    <div style="display: flex; flex-direction: row">
        <img src="image/HomePage/amulButter.png" class="dealImg" style="mix-blend-mode:darken;" />
        <div>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Amul Pasteruized Butter" Font-Bold="true" Style="font-size: 2.3rem; font-family: Ebrima"></asp:Label>
            <br />
            <span style="font-size: x-large">Amul</span>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Available sizes:" Font-Size="Large"></asp:Label>
            <div style="display: flex; flex-direction: row">
                <asp:Button ID="Button1" runat="server" Text="10g x 100" class="but1" PostBackUrl="~/Product.aspx?prodID=AB10"   />
                <asp:Button ID="Button2" runat="server" Text="250g x 1" class="but1" />
                <asp:Button ID="Button3" runat="server" Text="500g x 1" class="but1" />
            </div>
            <br />
            <br />

            <!--<div style="display: flex; flex-direction: row; margin-left: 8%; margin-right: 5%">
                <span>
                    <asp:Button ID="minus" runat="server" Text="-" class="Quantitybtn"  />
                </span>
                    <asp:Label ID="Label1" runat="server" Text="QUANTITY" class="quantity" ></asp:Label>
                <span>
                    <asp:Button ID="add" runat="server" Text="+" class="Quantitybtn"  OnClientClick="return addButtonClick();"   />
                </span>
            </div>-->
            <br />
            <asp:Button ID="addToCart" runat="server" Text="Add To Cart" CssClass="addToCart" style="margin-left: 8%; margin-right: 5%; height: 17%;  width: 84%;" OnClick="addToCart_Click" />
        </div>
    </div>

    <hr />
    <center>
        <h2 class="headings">
            <center>Quick <span>Shopping</span></center>
        </h2>
    </center>

  
    <br /><asp:Label ID="LblID" runat="server"></asp:Label>
    <div style="display: flex; flex-direction: row">
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <div class="quickShopping" style="min-height:300px;">
            <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="image\HomePage\VTandoori.png" style="height: 100%; width: 100%" OnClick="ImageButton10_Click" />
            <center class="prodName" style="min-height: 48px; min-width: 175px;">Veeba Tandoori Mayonnaise
                <br />
                ₹160
            </center>
             
        </div>

        <div class="quickShopping" style="min-height:300px;">
            <asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="image/HomePage/Wibsbread.png" style="height: 100%; width: 100%" OnClick="ImageButton12_Click" />
            <center class="prodName" style="min-height: 48px; min-width: 175px;">Wibs Medium Bread</center>
            <center>
                ₹35
            </center>
        </div>


        <div class="quickShopping" style="min-height:300px;">
            <asp:ImageButton ID="ImageButton13" runat="server" ImageUrl="image/HomePage/ATaaza.png" style="height: 100%; width: 100%;" OnClick="ImageButton13_Click" />
            <center class="prodName" style="min-height: 48px; min-width: 175px;">Amul Taaza 1L </center>
            <center>
                ₹70
        </div>


        <div class="quickShopping" style="min-height:300px;">
            <asp:ImageButton ID="GCSImageButton" runat="server" ImageUrl="image/Products/GCS28.jpg" style="height: 100%; width: 100%" OnClick="GCSImageButton_Click" />
            <center class="prodName" style="min-height: 48px; min-width: 175px;">Gowardhan Cheese Slice</center>
            <center> 
                ₹490
            </center>
        </div>
    </div>


    <div style="display: flex; flex-direction: row">
        <div class="quickShopping">
            <asp:ImageButton ID="MordeImageButton" runat="server" ImageUrl="image/Products/MordeDark.jpg" style="height: 100%; width: 100%" OnClick="MordeImageButton_Click" />
            <center>Morde Dark Chocolate slab</center>
            <center>
                ₹110
            </center>

        </div>
        <div class="quickShopping">
            <asp:ImageButton ID="VEgglessImageButton" runat="server" ImageUrl="image/HomePage/VEggless.png" style="height: 100%; width: 100%" OnClick="VEgglessImageButton_Click" />
            <center>Veeba Eggless Mayonnaise
            ₹90</center>

        </div>
        <div class="quickShopping">
            <asp:ImageButton ID="MilkmaidImageButton" runat="server" ImageUrl="image/Products/Milkmaid.jpg" style="height: 100%; width: 100%" OnClick="MilkmaidImageButton_Click" />
            <center>
                Milkmaid <br /><br />
                ₹210
            </center>

        </div>
        <div class="quickShopping">
            <asp:ImageButton ID="AFCImageButton" runat="server" ImageUrl="image/Products/AFC.jpg" style="height: 100%; width: 100%" OnClick="AFCImageButton_Click" />
            <center>
                Fresh Cream <br /><br />
                ₹50
            </center>
        </div>
    </div>

    <hr />
    <div>
        
        <center>
        <h2 class="headings">
            <center>Why <span>Choose</span> Us?</center>
        </h2>
    </center>
        <div style="justify-content:space-evenly; display:flex; padding-top:4%; padding-bottom:3%; background-color:#05526f3d">
            <h3>Best Quality</h3>
            <h3>Best Price</h3>
            <h3>Highest Discount </h3>
        </div>

    </div>
</asp:Content>
