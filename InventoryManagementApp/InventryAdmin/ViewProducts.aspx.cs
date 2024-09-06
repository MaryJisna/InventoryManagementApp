using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryManagementApp.InventryAdmin
{
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        private void BindGrid()
        {
            string connStr = ConfigurationManager.ConnectionStrings["InventoryDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT [ProductId], [ProductName], [ProductImage], [Price] FROM [dbo].[products]", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }
        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvProducts.Rows[rowIndex];
                int productId = Convert.ToInt32(row.Cells[0].Text);
                string productName = row.Cells[1].Text;

                Response.Redirect($"ProductManagement.aspx?ProductId={productId}");
            }

        }
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductManagement.aspx");


        }

    }

}