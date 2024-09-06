using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace InventoryManagementApp.InventryAdmin
{
    public partial class ProductManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productId = Request.QueryString["ProductId"] != null ? Convert.ToInt32(Request.QueryString["ProductId"]) : 0;
                if (productId > 0)
                {
                    LoadProduct(productId);
                }
            }

        }
        private void LoadProduct(int productId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["InventoryDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE ProductId = @ProductId", con);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtProductName.Text = reader["ProductName"].ToString();
                    txtPrice.Text = reader["Price"].ToString();
                    hfProductId.Value = reader["ProductId"].ToString();
                    //imgPreview.ImageUrl = reader["ProductImage"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string productName = txtProductName.Text;
            decimal price = Convert.ToDecimal(txtPrice.Text);
            int productId = string.IsNullOrEmpty(hfProductId.Value) ? 0 : Convert.ToInt32(hfProductId.Value);
            string productImage = string.Empty;

            try
            {
                if (fileUpload.HasFile)
                {
                    // Ensure the folder exists
                    string folderPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    // Generate a unique file name
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string filePath = Path.Combine(folderPath, fileName);

                    // Debugging output
                    System.Diagnostics.Debug.WriteLine("Saving file to: " + filePath);

                    fileUpload.SaveAs(filePath);
                    productImage = "~/Images/" + fileName; // Relative path to the image
                    //productImage = "aaa";

                }
                else
                {
                    productImage = "noImage";

                }

                // Call stored procedure to insert/update product
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["InventoryDB"].ConnectionString))
                {
        
    
                        SqlCommand cmd = new SqlCommand("usp_InsertOrUpdateProduct", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductId", productId);
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@ProductImage", productImage);
                        cmd.Parameters.AddWithValue("@Price", price);
                        con.Open();
                        cmd.ExecuteNonQuery();

                    
                }

                Response.Redirect("ViewProducts.aspx");
            }
            catch (Exception ex)
            {
                // Log the error
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                // Optionally, display error message to user
                //lblMessage.Text = "An error occurred while saving the product.";
            }
        }
    }
}