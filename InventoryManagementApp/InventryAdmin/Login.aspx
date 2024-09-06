<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InventoryManagementApp.InventryAdmin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-form" style="width:450px">
        <h2>Admin Login</h2>
        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" style="width:400px"></asp:TextBox><br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"  style="width:400px"></asp:TextBox><br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" style="width:420px"/><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
