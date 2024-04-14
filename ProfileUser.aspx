<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="ProfileUser.aspx.cs" Inherits="proj1.ProfileUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
h1 {
text-align: center;
color: #5e92a4;
margin-top: 2%;
}

#profile {
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin: auto;
    height: 315px;
    width: 55%;
    background-color: white;
    border: none;
    box-shadow: rgb(128, 128, 128, 0.8) 0 15px 15px 0;
    padding: 38px;
    MARGIN-BOTTOM: 2%;
}

.form-group-text {
display: flex;
flex-direction: column;
align-items: flex-start;
width: 50%;
}

.form-label {
font-size: larger;
margin-bottom: 5px;
}

.form-control {
width: 100%;
}

.change-link {
    font-size: 14px;
    color: blue;
    position: absolute;
    margin-right: 51%;
    right: 0;
}

.profButton {
    background-color: #05526f;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 1%;
    width: 25%;
    margin-bottom: 2%;
}

.profPict{
    border-radius: 40%;
    height:140px;
    width:140px;
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
    width:200px;
    box-shadow: inset 0 0 0 0 #05526f;
}

.info2:hover {
        color: white;
        box-shadow: inset 0 -100px 0 0 #05526f;
}

.info2:active {
        transform: scale(0.9);
}

</style>

<div>
    <h1>Account Settings</h1>
    <center>
        <h2>
            <asp:Label ID="Label1" runat="server" ></asp:Label>
        </h2>
        <h2>
            <asp:Label ID="Label2" runat="server" ></asp:Label>
        </h2>
        <asp:Button ID="Button3" runat="server" Visible="false" Text="Sign In" CssClass="info2" OnClick="Button3_Click" />
    </center>
    <asp:Panel ID="Panel1" runat="server">
        <div id="profile">
           
                <div class="form-group-text">
                    <div class="form-group">
                        <label for="email" class="form-label">Email:</label>
                        <asp:Label ID="email" runat="server" CssClass="form-control" ReadOnly="true" AutoPostBack="true"></asp:Label><br />
                        <br />
                    </div>

                    <div class="form-group">
                        <label for="username" class="form-label">Username:</label><br />
                        <asp:TextBox ID="username" runat="server" CssClass="form-control" ReadOnly="true" Font-Size="Larger" Width="100%" AutoPostBack="true"></asp:TextBox><br />
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="change-link" Font-Underline="false" OnClick="LinkButton1_Click">change</asp:LinkButton><br />
                        <br />
                    </div>

                    <div class="form-group">
                        <label for="phone" class="form-label">Phone:</label><br />
                        <asp:TextBox ID="phone" runat="server" CssClass="form-control" TextMode="Phone" ReadOnly="true" Font-Size="Larger" Width="100%"></asp:TextBox><br />
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="change-link" Font-Underline="false" OnClick="LinkButton2_Click">change</asp:LinkButton><br />
                        <br />
                    </div>

                    <div class="form-group">
                        <label for="gender" class="form-label">Gender:</label><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Enabled="false">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="change-link" Font-Underline="false" OnClick="LinkButton3_Click">change</asp:LinkButton><br />
                        <br />
                        <asp:Button ID="Button4" runat="server" Text="Logout" CssClass="info2" OnClick="Button4_Click" />

                        <br />
                        <br />
                    </div>
                </div>

                <div style="display: block; width: 170px">
                    <asp:Image ID="ProfilePicture" CssClass="profPict" runat="server" /><br />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file"></asp:FileUpload><br />
                    <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
                    <asp:Button ID="Button1" runat="server" Text="Upload" CssClass="info2" OnClick="Button1_Click" Font-Size="Large" />
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/History.aspx" Font-Underline="false">See all History</asp:LinkButton>
                </div>

            </div>
            
        
        <center>
            <asp:Button ID="Button2" runat="server" Text="DONE" OnClick="Button2_Click" Font-Size="Larger" CssClass="profButton"></asp:Button>
        </center>
    </asp:Panel>
</div>
</asp:Content>