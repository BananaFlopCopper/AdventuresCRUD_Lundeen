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
    public partial class CreateCustomer : System.Web.UI.Page
    {
        private TextBox[] TextBoxes;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxes = new TextBox[17] { 
                txtbxTitle,         txtbxFirstName,     txtbxMiddleName,txtbxLastName,      txtbxSuffix,
                txtbxEmailAddress,  txtbxCompanyName,   txtbxPhone,     txtbxPassword,
                txtbxAddressType,   txtbxAddressLine1,  txtbxAddressLine2,  txtbxCity,      txtbxStateProvince, txtbxCountryRegion, txtbxPostalCode, txtbxSalesPerson };
        }
        private void Create(bool NameStyle, TextBox[] textboxes)
        {
            using (SqlConnection conn = new SqlConnection(dbAccess.getConnection()))
            {
                SqlCommand cmd = new SqlCommand("CreateCustomer", conn);


                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);

                cmd.Parameters.AddWithValue("@NameStyle", 0); // I'm still not entirely sure what namestyle does
                cmd.Parameters.AddWithValue("@Title",           textboxes[0].Text);
                cmd.Parameters.AddWithValue("@FirstName",       textboxes[1].Text);
                cmd.Parameters.AddWithValue("@MiddleName",      textboxes[2].Text);
                cmd.Parameters.AddWithValue("@LastName",        textboxes[3].Text);
                cmd.Parameters.AddWithValue("@Suffix",          textboxes[4].Text);
                cmd.Parameters.AddWithValue("@EmailAddress",    textboxes[5].Text);
                cmd.Parameters.AddWithValue("@CompanyName",     textboxes[6].Text);
                cmd.Parameters.AddWithValue("@Phone",           textboxes[7].Text);
                cmd.Parameters.AddWithValue("@Password",        textboxes[8].Text);
                cmd.Parameters.AddWithValue("@AddressType",     textboxes[9].Text);
                cmd.Parameters.AddWithValue("@AddressLine1",    textboxes[10].Text);
                cmd.Parameters.AddWithValue("@AddressLine2",    textboxes[11].Text);
                cmd.Parameters.AddWithValue("@City",            textboxes[12].Text);
                cmd.Parameters.AddWithValue("@StateProvince",   textboxes[13].Text);
                cmd.Parameters.AddWithValue("@CountryRegion",   textboxes[14].Text);
                cmd.Parameters.AddWithValue("@PostalCode",      textboxes[14].Text);
                cmd.Parameters.AddWithValue("@SalesPerson",     textboxes[15].Text);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("Customers.aspx");
        }

        protected void Createbtn_Click(object sender, EventArgs e)
        {
            Create(false, TextBoxes);
        }
    }
}