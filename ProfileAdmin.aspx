<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.Master" AutoEventWireup="true" CodeBehind="ProfileAdmin.aspx.cs" Inherits="proj1.ProfileAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 7%; ">
    <asp:GridView class="gd1" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" Width="100%" BorderStyle="Solid" BorderWidth="3px" CellPadding="7" DataKeyNames="UserId" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" HeaderStyle-Font-Size="X-Large" HeaderStyle-Width="28%" ItemStyle-Width="30%" />
        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Font-Size="X-Large" SortExpression="Name" HeaderStyle-Width="25%"  ItemStyle-Width="30%"  ReadOnly="true"/>
        <asp:TemplateField HeaderText="Enable" SortExpression="Enable">
            <EditItemTemplate>
                <asp:Label ID="lblEnable" runat="server" Text='<%# Bind("Enabled") %>'></asp:Label>
                <asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="True">True</asp:ListItem>
                    <asp:ListItem Value="False">False</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Enabled") %>'></asp:Label>
                <br />    
            </ItemTemplate>
            <HeaderStyle Font-Bold="True" Font-Size="X-Large" />
            <ItemStyle Font-Size="Larger" HorizontalAlign="Center" Width="29%" />
        </asp:TemplateField>
        <asp:CommandField  ShowEditButton="True" ControlStyle-Width="25%" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [userDetails] WHERE [UserId] = @UserId" 
        InsertCommand="INSERT INTO [userDetails] ([Enabled]) VALUES ( @Enabled)" 
        SelectCommand="SELECT [UserId], [Name], [Enabled] FROM [userDetails]" 
        UpdateCommand="UPDATE [userDetails] SET [Enabled] = @Enabled WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="Enabled" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Enabled" Type="String" />
            <asp:Parameter Name="UserId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </div>
</asp:Content>
