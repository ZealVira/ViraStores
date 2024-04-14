<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="proj1.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pending-row {
            background-color: yellow;             
        }

        .completed-rows{
            background-color:lightseagreen;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Search here..." FontStyle="Medium" CssClass="textBox"  ></asp:TextBox>
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" style="padding-right:15px; color: black"><i class="bi bi-search"></i></asp:LinkButton>
        <asp:GridView ID="GridView3" runat="server"></asp:GridView>              
   
    <center>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" OnRowCommand="GridView2_RowCommand">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" />
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Payment Reference" HeaderText="Payment Reference" SortExpression="Payment Reference" />
                <asp:TemplateField HeaderText="Complete Order">
                    <ItemTemplate>
                        <center><asp:Button ID="Button1" runat="server" Text="Show Order" CommandName="ViewOrder" CommandArgument='<%# Eval("OrderId") %>' /> </center>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>

    </center>
    
    <br /><center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="Large" DataKeyNames="OrderId" DataSourceID="SqlDataSource2" AllowSorting="True" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="OrderId" HeaderText="OrderId" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" ItemStyle-Width="12%" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" ReadOnly="True"/>
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" ReadOnly="True"/>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ReadOnly="True" ItemStyle-Width="12%"/>
            <asp:TemplateField HeaderText="Status" SortExpression="Status" ItemStyle-Width="20%">
                <EditItemTemplate>
                    <asp:Label ID="Labelstatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" ReadOnly="true" />
             <asp:TemplateField HeaderText="Complete Order">
            <ItemTemplate>
                <center><asp:Button ID="Button1" runat="server" Text="Show Order" CommandName="ViewOrder" CommandArgument='<%# Eval("OrderId") %>' /> </center>
            </ItemTemplate>
        </asp:TemplateField> 
            <asp:CommandField ShowEditButton="True" ItemStyle-Width="10%" />
            
        </Columns>
    </asp:GridView></center>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [OrderDetails] ([UserName], [Total], [Status], [Payment]) VALUES (@UserName, @Total, @Status, @Payment)" UpdateCommand = "UPDATE [OrderDetails] SET [UserName] = @UserName, [Total] = @Total, [Status] = @Status, [Payment] = @Payment WHERE [OrderId] = @OrderId">
        <DeleteParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Total" Type="Double" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Payment" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Total" Type="Double" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Payment" Type="String" />
            <asp:Parameter Name="OrderId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
    <asp:ListItem>Pending</asp:ListItem>
    <asp:ListItem>Completed</asp:ListItem>
    <asp:ListItem>Picked Up</asp:ListItem>
</asp:DropDownList>  
    

     </div>
</asp:Content>
