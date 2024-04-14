<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile1.aspx.cs" Inherits="proj1.Profile1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView class="gd1" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="3px" CellPadding="7" DataKeyNames="UserId" DataSourceID="SqlDataSource1">
            <Columns>
                
                <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" HeaderStyle-Width="8%" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-Width="25%" ReadOnly="true"/>
                <asp:BoundField DataField="Enabled" HeaderText="Enabled" SortExpression="Enabled" HeaderStyle-Width="18%"/>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [userDetails] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [userDetails] ([UserId], [Name], [Enabled]) VALUES (@UserId, @Name, @Enabled)" SelectCommand="SELECT [UserId], [Name], [Enabled] FROM [userDetails]" UpdateCommand="UPDATE [userDetails] SET [Name] = @Name, [Enabled] = @Enabled WHERE [UserId] = @UserId">
            <DeleteParameters>
                <asp:Parameter Name="UserId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Enabled" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Enabled" Type="String" />
                <asp:Parameter Name="UserId" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
