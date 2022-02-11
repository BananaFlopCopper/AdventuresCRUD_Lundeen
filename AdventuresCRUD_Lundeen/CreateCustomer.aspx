<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="CreateCustomer.aspx.cs" Inherits="AdventuresCRUD_Lundeen.CreateCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
        <asp:Table ID="Table1" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Title</asp:TableCell>
            <asp:TableCell ID="TitleIn" runat="server" ><asp:TextBox ID="txtbxTitle" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">FirstName</asp:TableCell>
            <asp:TableCell ID="FirstNameIn" runat="server" ><asp:TextBox ID="txtbxFirstName" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">MiddleName</asp:TableCell>
            <asp:TableCell ID="MiddleNameIn" runat="server" ><asp:TextBox ID="txtbxMiddleName" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">LastName</asp:TableCell>
            <asp:TableCell ID="LastNameIn" runat="server" ><asp:TextBox ID="txtbxLastName" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Suffix</asp:TableCell>
            <asp:TableCell ID="SuffixIn" runat="server" ><asp:TextBox ID="txtbxSuffix" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">EmailAddress</asp:TableCell>
            <asp:TableCell ID="EmailAddressIn" runat="server" ><asp:TextBox ID="txtbxEmailAddress" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">CompanyName</asp:TableCell>
            <asp:TableCell ID="CompanyNameIn" runat="server" ><asp:TextBox ID="txtbxCompanyName" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Phone</asp:TableCell>
            <asp:TableCell ID="PhoneIn" runat="server" ><asp:TextBox ID="txtbxPhone" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Password</asp:TableCell>
            <asp:TableCell ID="PasswordIn" runat="server" ><asp:TextBox ID="txtbxPassword" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow runat="server">
            <asp:TableCell runat="server">AddressType</asp:TableCell>
            <asp:TableCell ID="AddressTypeIn" runat="server" ><asp:TextBox ID="txtbxAddressType" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Address1</asp:TableCell>
            <asp:TableCell ID="AddressLine1In" runat="server" ><asp:TextBox ID="txtbxAddressLine1" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Address2</asp:TableCell>
            <asp:TableCell ID="AddressLine2In" runat="server" ><asp:TextBox ID="txtbxAddressLine2" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">City</asp:TableCell>
            <asp:TableCell ID="CityIn" runat="server" ><asp:TextBox ID="txtbxCity" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">State/Province</asp:TableCell>
            <asp:TableCell ID="StateProvinceIn" runat="server" ><asp:TextBox ID="txtbxStateProvince" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Country/Region</asp:TableCell>
            <asp:TableCell ID="CountryRegionIn" runat="server" ><asp:TextBox ID="txtbxCountryRegion" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">PostalCode</asp:TableCell>
            <asp:TableCell ID="PostalCodeIn" runat="server" ><asp:TextBox ID="txtbxPostalCode" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
            <asp:TableRow runat="server">
            <asp:TableCell runat="server">SalesPerson</asp:TableCell>
            <asp:TableCell ID="SalesPersonIn" runat="server" ><asp:TextBox ID="txtbxSalesPerson" runat="server"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
<asp:Button ID="Createbtn" runat="server" OnClick="Createbtn_Click" Text="Create" />
</asp:Content>
