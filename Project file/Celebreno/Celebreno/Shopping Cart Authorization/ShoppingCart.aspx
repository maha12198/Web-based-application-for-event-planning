<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Celebreno.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       
    <br />



    <div id="ShoppingCartTitle" runat="server" class="ContentHead">
        <h1>Shopping Cart</h1>
    </div>

    <%--Start of the GridView to display the items in the cart--%>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="Celebreno.Models.ItemsInCart" SelectMethod="GetShoppingCartItems" 
        CssClass="table table-striped table-bordered" >
        <Columns>

            <%--problem solved : change "ID" to "ServicePack.ID"--%>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:label ID="ProductID" Width="40" runat="server" Text="<%#: Item.ServicePackId %>" ></asp:label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ServicePack.ID" HeaderText="Service Package ID" SortExpression="ID" />
            <asp:BoundField DataField="ServicePack.Provider" HeaderText="Provider" />
            <asp:BoundField DataField="ServicePack.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>" ></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Total">
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.ServicePack.UnitPrice)))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove Item">
                <ItemTemplate>

                    <%--checkbox for removing the item--%>
                    <asp:CheckBox ID="Remove" runat="server"></asp:CheckBox>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%--End of the GridView--%>

    <div>
        <p></p>
        <strong>
            <asp:Label ID="LblTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="LblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>
    <br />



    <table>
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" CausesValidation="False" UseSubmitBehavior="false" Cssclass="btn btn-primary" Width="199px" />
               <br />
               <br />
                  <div id="paypal-button-container"></div>

                <script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
                <script>paypal.Buttons().render('#paypal-button-container');</script>


                  
            </td>

        </tr>
    </table>


</asp:Content>
