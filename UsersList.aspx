<%@ Page Title="User Details" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="UsersList.aspx.cs" Inherits="proj1.Profile1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:20%; margin-right:4%">
    <h1 class="subhead">List of all account holders</h1>
    <asp:GridView class="gd1" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="2px" CellPadding="7" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" HeaderStyle-Width="7%"  >
<HeaderStyle Width="7%"></HeaderStyle>
                </asp:CommandField>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" HeaderStyle-Width="8%" >
<HeaderStyle Width="8%"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" HeaderStyle-Width="25%">
<HeaderStyle Width="25%"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" ReadOnly="True" HeaderStyle-Width="18%">
<HeaderStyle Width="18%"></HeaderStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Enabled(True/False)" SortExpression="Enabled" HeaderStyle-Width="20%">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("enabled") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("enabled") %>' ></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" >
                            <asp:ListItem>true</asp:ListItem>
                            <asp:ListItem>false</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>

<HeaderStyle Width="20%"></HeaderStyle>
                </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#16796F" Font-Size="Larger" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [userDetails] WHERE [Id] = @Id" InsertCommand="INSERT INTO [userDetails] ( [enabled]) VALUES ( @enabled)" SelectCommand="SELECT [Id], [Name], [enabled], [UserId] FROM [userDetails]" UpdateCommand="UPDATE [userDetails] SET [enabled] = @enabled WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="enabled" Type="String" />
                <asp:Parameter Name="UserId" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="enabled" Type="String" />
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</div>
</asp:Content>
