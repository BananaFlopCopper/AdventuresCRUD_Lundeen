using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace AdventuresCRUD_Lundeen
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Read(-1);

        }

        private void Read(int Id)
        {
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {

                SqlCommand cmd = new SqlCommand("ReadCustomer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", Id);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                CustomerRepeater.DataSource = dr;
                CustomerRepeater.DataBind();
                dr.Close();

            }
        }

        private void Delete(int CustomerID)
        {
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {
                SqlCommand cmd = new SqlCommand("DeleteCustomer", conn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", CustomerID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            
            Read(-1);
        }
        protected void OnEdit(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int customerID = int.Parse((item.FindControl("lblCustomerId") as Label).Text);
            EditCustomer.id = customerID;
            Response.Redirect("EditCustomer.aspx?id=" + customerID);
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int customerID = int.Parse((item.FindControl("lblCustomerId") as Label).Text);
            Delete(customerID);
        }
    }
}