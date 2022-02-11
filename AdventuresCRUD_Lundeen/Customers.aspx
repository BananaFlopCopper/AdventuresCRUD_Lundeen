<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="AdventuresCRUD_Lundeen.Customer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="CustomerRepeater" runat="server">
                <HeaderTemplate>
                    <table cellspacing="0" rules="all" border="1">
                        <tr>
                            <th scope="col" style="width: 800px">
                                Title
                            </th>
                            <th scope="col" style="width: 800px">
                                Name
                            </th>
                            <th scope="col" style="width: 100px">
                                Email
                            </th>
                            <th scope="col" style="width: 80px">
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>' Visible="false" />

                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>' />
                            <asp:Label ID="lblMiddleName" runat="server" Text='<%# Eval("MiddleName") %>' />
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>' />
                            <asp:Label ID="lblSuffix" runat="server" Text='<%# Eval("Suffix") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailAddress") %>' />
                        </td>
                        <td >
                            <p class="Button"><asp:LinkButton ID="lnkEdit"  Text="Edit" runat="server" OnClick="OnEdit"  /></p>
                            <p class="Button"><asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Delete this Customer?');" /></p>
                        </td>
                    </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <p>
    </p>
</asp:Content>
