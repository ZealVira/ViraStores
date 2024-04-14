<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="proj1.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/Home.css" type="text/css" />
    <style>
.info {
    padding: 17px 40px;
    border-radius: 50px;
    cursor: pointer;
    border: 0;
    background-color: white;
    box-shadow: rgb(0 0 0 / 5%) 0 0 8px;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    font-size: 15px;
    transition: all 0.5s ease;
}

.info:hover {
        letter-spacing: 3px;
        background-color: hsl(261deg 80% 48%);
        color: hsl(0, 0%, 100%);
        box-shadow: rgb(93 24 220) 0px 7px 29px 0px;
}

.info:active {
        letter-spacing: 3px;
        background-color: hsl(261deg 80% 48%);
        color: hsl(0, 0%, 100%);
        box-shadow: rgb(93 24 220) 0px 0px 0px 0px;
        transform: translateY(10px);
        transition: 100ms;
}

.info2 {
    position: relative;
    display: inline-block;
    margin: 0px;
    padding: 15px 28px;
    text-align: center;
    font-size: 16px;
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

h1 {
text-align: center;
color: #5e92a4;
margin-top: 2%;
}

    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <center><h1>Your Cart</h1></center> 
    <asp:Label ID="username" runat="server" Visible="false" ></asp:Label>
    <center><h1><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h1>
    <asp:Image ID="Image1" runat="server"  />
    <br />
    <div style="margin-left:5%; margin-right:5%">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="ID" OnRowDataBound="GridView1_RowDataBound" BorderWidth="0px" BorderStyle="None" >
            <Columns>
                <asp:TemplateField HeaderText="Image" HeaderStyle-Font-Size="X-Large" >
                    <ItemTemplate>
                        <asp:ImageButton ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' CommandArgument='<%# Eval("ProdId") %>' OnClick="ImageButton1_Click"  Height="90" Width="90"  style="mix-blend-mode:darken; " />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%" ItemStyle-Font-Size="Larger" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="X-Large" Visible="false" >
                <HeaderStyle Font-Bold="True" Font-Size="X-Large"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" Font-Size="Larger" Width="6%"></ItemStyle>
                </asp:BoundField>
                
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50%" ItemStyle-Font-Size="Larger" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="X-Large" >
                <HeaderStyle Font-Bold="True" Font-Size="X-Large"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" Font-Size="Larger" Width="50%"></ItemStyle>
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        <asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        <br />    
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" Font-Size="X-Large" />
                    <ItemStyle Font-Size="Larger" HorizontalAlign="Center" Width="9%" />
                </asp:TemplateField>

                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7%" ItemStyle-Font-Size="Larger" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="X-Large">               
                <HeaderStyle Font-Bold="True" Font-Size="X-Large"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" Font-Size="Larger" Width="7%"></ItemStyle>
                </asp:BoundField>
                
                <asp:BoundField DataField="GST" HeaderText="GST" SortExpression="GST" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="7%" ItemStyle-Font-Size="Larger" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="X-Large">               
                <HeaderStyle Font-Bold="True" Font-Size="X-Large"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" Font-Size="Larger" Width="7%"></ItemStyle>
                </asp:BoundField>

                <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-Font-Size="Larger" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="X-Large">
                    <ItemTemplate>
                        <%# (Convert.ToDouble(Eval("Quantity")) * Convert.ToDouble(Eval("Price"))) + (Convert.ToDouble(Eval("Quantity")) * Convert.ToDouble(Eval("Price")) * Convert.ToDouble(Eval("GST"))/100) %>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" Font-Size="X-Large"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Font-Size="Larger" Width="10%"></ItemStyle>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-Font-Underline="false" ItemStyle-Font-Size="Larger" >
                <ControlStyle Font-Underline="False"></ControlStyle>
                <ItemStyle Font-Size="Larger"></ItemStyle>
                </asp:CommandField>
            </Columns>
             
        </asp:GridView>
        <asp:Label ID="lblTotal" Font-Size="X-Large" runat="server" Text="Total: "></asp:Label>
        <asp:Label ID="lblTotalValue" runat="server" Font-Size="X-Large"></asp:Label>       
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Cart] WHERE [ID] = @original_ID AND [Name] = @original_Name AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL))" 
        InsertCommand="INSERT INTO [Cart] ([Quantity]) VALUES (@Quantity)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [Cart] SET [Quantity] = @Quantity WHERE [ID] = @original_ID AND [Name] = @original_Name " >
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Price" Type="Double" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <div class="cartButtons" style="margin-top:2%;  ">
            <asp:Button ID="Button1" runat="server" Text="Continue Shopping" PostBackUrl="~/HomePage.aspx" CssClass="info2" />
            <asp:Button ID="Button2" runat="server" Text="checkout"  CssClass="info2" OnClick="Button2_Click" />
        </div>
    </center>
   
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /><br />
    <br /><br />
    <br />
<div>
    <asp:Button ID="Button4" runat="server" Text="Login" CssClass="info" style="margin-right:10px"/>
    <asp:Button ID="Button3" runat="server" Text="Registration" CssClass="info2" />
</div>
</asp:Content>
