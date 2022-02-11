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
    public partial class EditCustomer : System.Web.UI.Page
    {
        int txtbxCount;
        private TextBox[] TextBoxes;
        //So I can set the id on clicking the edit button
        public static int id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxes = new TextBox[16] { txtbxTitle, txtbxFirstName, txtbxMiddleName, txtbxLastName, txtbxSuffix,
                txtbxEmailAddress, txtbxCompanyName, txtbxPhone, txtbxPassword,
                txtbxAddressLine1, txtbxAddressLine2, txtbxCity, txtbxStateProvince, txtbxCountryRegion, txtbxPostalCode, txtbxSalesPerson };
            txtbxCount = TextBoxes.Length;
            if (!Page.IsPostBack)
            {
                Read(id);
            }
            


        }
        private void Update(int id, bool CustomerTable, bool AddressTable)
        {
            if (CustomerTable == true)
            { UpdateCustomer(); }
            if(AddressTable == true)
            { UpdateAddress(); }
            Response.Redirect("Customers.aspx");
        }
        private void UpdateCustomer()
        {
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {
                //SqlCommand cmd = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UpdateCustomer", conn);


                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CustomerID", id);
                cmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);

                cmd.Parameters.AddWithValue("@NameStyle", 0); // I'm still not entirely sure what namestyle does
                cmd.Parameters.AddWithValue("@Title", TextBoxes[0].Text);
                cmd.Parameters.AddWithValue("@FirstName", TextBoxes[1].Text);
                cmd.Parameters.AddWithValue("@MiddleName", TextBoxes[2].Text);
                cmd.Parameters.AddWithValue("@LastName", TextBoxes[3].Text);
                cmd.Parameters.AddWithValue("@Suffix", TextBoxes[4].Text);
                cmd.Parameters.AddWithValue("@EmailAddress", TextBoxes[5].Text);
                cmd.Parameters.AddWithValue("@CompanyName", TextBoxes[6].Text);
                cmd.Parameters.AddWithValue("@Phone", TextBoxes[7].Text);
                cmd.Parameters.AddWithValue("@Password", TextBoxes[8].Text);
                cmd.Parameters.AddWithValue("@SalesPerson", TextBoxes[15].Text);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        private void UpdateAddress()
        {
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {
                //SqlCommand cmd = conn.CreateCommand();
                SqlCommand cmd = new SqlCommand("UpdateAddress", conn);


                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustomerID", id);
                cmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);

                cmd.Parameters.AddWithValue("@AddressLine1", TextBoxes[10].Text);
                cmd.Parameters.AddWithValue("@AddressLine2", TextBoxes[11].Text);
                cmd.Parameters.AddWithValue("@City", TextBoxes[12].Text);
                cmd.Parameters.AddWithValue("@StateProvince", TextBoxes[13].Text);
                cmd.Parameters.AddWithValue("@CountryRegion", TextBoxes[14].Text);
                cmd.Parameters.AddWithValue("@PostalCode", TextBoxes[14].Text);

                conn.Open();
                cmd.ExecuteNonQuery();
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
        }
        private void Read(int Id)
        {
            DataTable _customer = new DataTable();
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {
                SqlCommand cmd = new SqlCommand("ReadCustomer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", Id);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                
                _customer.Load(dr);
                dr.Close();
            }
            DataRow temp = _customer.Rows[0];
            for (int i = 1; i <= txtbxCount; i++)
            {
                if (!(temp.IsNull(i)))
                {
                    TextBoxes[i - 1].Text = (string)temp[i];
                    TextBoxes[i - 1].ToolTip = TextBoxes[i - 1].Text;
                }
            }
        }

        protected void Deletebtn_Click(object sender, EventArgs e)
        {
            Delete(id);
            Response.Redirect("Customers.aspx");
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            bool UpdateCustomerTable = false;
            for (int i = 0; i < 9; i++)
            {
                if(TextBoxes[i].Text != TextBoxes[i].ToolTip)
                    UpdateCustomerTable = true;
                
            }

            bool UpdateAddressTable = false;
            for(int i = 9;i < TextBoxes.Length; i++)
            {
                if (TextBoxes[i].Text != TextBoxes[i].ToolTip)
                    UpdateAddressTable = true;
            }

            if(TextBoxes[15].Text != TextBoxes[15].ToolTip)
            {
                UpdateCustomerTable=true;
            }
            
            Update(id, UpdateCustomerTable, UpdateAddressTable);
        }
    }
}