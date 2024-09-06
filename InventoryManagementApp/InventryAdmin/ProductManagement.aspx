<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductManagement.aspx.cs" Inherits="InventoryManagementApp.InventryAdmin.ProductManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>



<%--<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add/Edit Product</h2>
    <asp:TextBox ID="txtProductName" runat="server" placeholder="Product Name"></asp:TextBox><br />
    <asp:FileUpload ID="fileUpload" runat="server" /><br />
    <asp:TextBox ID="txtPrice" runat="server" placeholder="Price"></asp:TextBox><br />
    <asp:HiddenField ID="hfProductId" runat="server" /> 
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /><br />
    <img id="imgPreview" src="" alt="Product Image Preview" style="width:100px; height:100px;" />
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add/Edit Product</h2>
    <asp:TextBox ID="txtProductName" runat="server" placeholder="Product Name"></asp:TextBox><br />
    <asp:FileUpload ID="fileUpload" runat="server" /><br />
    <asp:TextBox ID="txtPrice" runat="server" placeholder="Price"></asp:TextBox><br />
    <asp:HiddenField ID="hfProductId" runat="server" />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /><br />
<%--    <img id="imgPreview" src="" alt="Product Image Preview" style="width:100px; height:100px;" />--%>
</asp:Content>
