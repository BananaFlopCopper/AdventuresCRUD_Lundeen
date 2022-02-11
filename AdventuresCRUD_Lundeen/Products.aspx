<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="AdventuresCRUD_Lundeen.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="ProductRepeater" runat="server">
                <HeaderTemplate>
                    <table cellspacing="0" rules="all" border="1">
                        <tr>
                            <th scope="col" style="width: 30px">
                                Product Name
                            </th>
                            <th scope="col" style="width: 800px">
                                Color
                            </th>
                            <th scope="col" style="width: 800px">
                                StandardCost
                            </th>
                            <th scope="col" style="width: 100px">
                                ListPrice
                            </th>
                            <th scope="col" style="width: 100px">
                                Size
                            </th>
                            <th scope="col" style="width: 100px">
                                Weight
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblStandardCost" runat="server" Text='<%# Eval("StandardCost") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblListPrice" runat="server" Text='<%# Eval("ListPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblSize" runat="server" Text='<%# Eval("Size") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lblWeight" runat="server" Text='<%# Eval("Weight") %>' />
                        </td>
                        <td>

                        </td>
                    </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
