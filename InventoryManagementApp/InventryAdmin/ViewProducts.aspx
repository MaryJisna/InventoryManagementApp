<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="InventoryManagementApp.InventryAdmin.ViewProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Product List</h2>
    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" OnRowCommand="gvProducts_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ProductImage") %>' AlternateText="Productlll Image" Width="100px" Height="100px" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="InventoryManagementApp.InventryAdmin.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    View Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .main-content {
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .action-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .btn-add {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-add:hover {
            background-color: #218838;
        }
        .product-grid {
            width: 100%;
            border-collapse: collapse;
        }
        .product-grid th, .product-grid td {
            padding: 10px;
            text-align: left;
        }
        .product-grid img {
            border-radius: 4px;
            border: 1px solid #ddd;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-content">
        <div class="action-bar">
            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn-add" OnClick="btnAddProduct_Click" />
        </div>
        <h2>Product List</h2>
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" OnRowCommand="gvProducts_RowCommand" CssClass="product-grid">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ProductImage") %>' AlternateText="Product Image" Width="100px" Height="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
