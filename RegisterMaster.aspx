<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="RegisterMaster.aspx.cs" Inherits="proj1.RegisterMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/css/Rgister.css" type="text/css" />  
    <script>
        function handleDateSelection(selectedDate) {
            // Perform actions based on the selected date
            alert("Selected Date: " + selectedDate);
            // You can perform additional actions here, such as updating UI elements or sending data to the server using AJAX.
        }
    </script>

    <style>
        imgMilk{
    position: absolute;
    bottom: -40%;
    height: 100%;
    width: 44%;
}

        .RegisterButton{
             width: 50%;
 height: 55px;
 margin-top: 4%;
 background-color: #05526fba;
 border-radius: 23px;
 color: white;
 font-size: large;
 font-family: Georgia;
 margin-left: 18px;
 border: 2px solid black;
 margin-bottom: 12%;
 padding:2%;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-family:math;">
        <center>
            <h1>Sign up for new account for free</h1>
        </center>
        <div style="display:flex">
         <div class="column" style="width: 48%;  display: flex; flex-direction: column">
            <br />
            <br />
            <div style="margin-top: 8%;  margin-left: 5%; ; padding-left: 2%">
                <center>
                    <h2 style="font-size:2.3rem">Already have an account?</h2>
                    <br />
                
                    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="RegisterButton" PostBackUrl="~/LoginMaster.aspx"  />
                </center><br /><br />
            </div>
            <img src="image/Pouring_Milk.png" CssClass="imgMilk" style="position: absolute;
    bottom: -45%;
    height: 100%;
    width: 44%;"/>
        </div>

        <div class="column" style=" width: 48%; margin-left:5%; margin-right: 3%; padding-left: 2%; box-shadow: 5px 6px rgb(0,0,0,0.2); border: 1px solid black; border-radius: 20px;">
            <h2 style="font-size:2.3rem">Few steps away from your account!</h2>

            <table class="table">
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox CssClass="text" ID="TextBox1" runat="server" placeholder="Name" Font-Names="Cascadia Mono" Font-Size="Large"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" class="text" placeholder="EmailID" TextMode="Email" Font-Size="Large"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="Red" Font-Size="Small" ValidationGroup="log"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="EmailID of incorrect format" ForeColor="Red" ValidationGroup="log" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox2" Font-Size="Small"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TextBox4" class="text" runat="server" TextMode="Password" placeholder="Password" Font-Size="Large" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Font-Size="Small" runat="server" ErrorMessage="*" ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="log"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" class="text" TextMode="Password" placeholder="Confirm your password" Font-Size="Large"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox5" ForeColor="Red" ValidationGroup="log"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ForeColor="Red" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ValidationGroup="log"></asp:CompareValidator>
                    </td>
                </tr>

                
                <tr>
                    <td style="width: 12%; font-family: 'Cascadia Mono'; font-size: large">Gender: </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="Large">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Small" ControlToValidate="RadioButtonList1" ValidationGroup="log"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" class="text" TextMode="Phone" placeholder="Phone Number" Font-Size="Large" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="Small" ControlToValidate="TextBox6" ValidationGroup="log"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <center><asp:Button ID="Button2" runat="server" Text="Create Account" Font-Size="Larger" CssClass="RegisterButton" OnClick="Button1_Click" ValidationGroup="log" /></center>
            <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="X-Large"></asp:Label>

            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
</div>
        </div>
    </div>
</asp:Content>
