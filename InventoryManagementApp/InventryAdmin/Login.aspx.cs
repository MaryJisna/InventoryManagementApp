using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryManagementApp.InventryAdmin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["InventoryDB"].ConnectionString))
            {
                string query = "SELECT COUNT(1) FROM login WHERE Username=@Username AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 1)
                {
                    Session["Username"] = username;
                    Response.Redirect("ViewProducts.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid username or password!";
                }
            }
        }

    }
}