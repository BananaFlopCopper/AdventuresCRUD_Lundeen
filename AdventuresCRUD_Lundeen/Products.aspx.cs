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
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            read();
        }
        private void read()
        {
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {

                SqlCommand cmd = new SqlCommand("ReadProducts", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ProductRepeater.DataSource = dr;
                ProductRepeater.DataBind();
                dr.Close();

            }
        }
    }
}