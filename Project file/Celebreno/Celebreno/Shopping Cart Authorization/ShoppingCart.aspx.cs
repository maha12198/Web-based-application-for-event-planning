using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Celebreno.Models;
using Celebreno.Cart;

//for cart update
using System.Collections.Specialized;
using System.Collections;
using System.Web.ModelBinding;



namespace Celebreno
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageLoad();
            }
        }

        void PageLoad()
        {

            //2- Display the total of cart by calling GetTotal() function(located in Actions_of_Cart class)
            //and then store the return value in a new variable, then dispaly it in a label
            using (Actions_of_Cart usersShoppingCart = new Actions_of_Cart())
            {

                //declare a new variable to store the total into it
                decimal cartTotal = 0;
                cartTotal = usersShoppingCart.GetTotal();

                if (cartTotal > 0)
                {
                    //Display Total in a label that has property " Enable ViewState = False"
                    //      ViewSate used
                    LblTotal.Text = String.Format("{0:c}", cartTotal);
                }
                else
                {
                    LblTotalText.Text = "";
                    LblTotal.Text = "";
                    ShoppingCartTitle.InnerText = "The Shopping Cart is Empty";
                    
                    UpdateBtn.Visible = false;
                   
                    

                }
            }

        }



        //1- decalre the select Method (used in GridView in Source Code) to return the value of..
        //..calling GetCartItems(), which is defined in Actions_of_Cart DB class
        public List<ItemsInCart> GetShoppingCartItems()
        {
            Actions_of_Cart actions = new Actions_of_Cart();
            return actions.GetCartItems();
        }



        //for cart update
        //this will loop throw the items in the cart and call update and remove button
        public List<ItemsInCart> UpdateCartItems()
        {
            using (Actions_of_Cart usersShoppingCart = new Actions_of_Cart())
            {
                String cartId = usersShoppingCart.GetCartId();

                Actions_of_Cart.ShoppingCartUpdates[] cartUpdates = new Actions_of_Cart.ShoppingCartUpdates[CartList.Rows.Count];
                for (int i = 0; i < CartList.Rows.Count; i++)
                {
               
                    Label lblId = new Label();
                    lblId = (Label)CartList.Rows[i].FindControl("ProductID");
                    cartUpdates[i].ProductId = Convert.ToInt32(lblId.Text);

                    CheckBox cbRemove = new CheckBox();
                    cbRemove = (CheckBox)CartList.Rows[i].FindControl("Remove");
                    cartUpdates[i].RemoveItem = cbRemove.Checked;

                    TextBox quantityTextBox = new TextBox();
                    quantityTextBox = (TextBox)CartList.Rows[i].FindControl("PurchaseQuantity");
                    cartUpdates[i].PurchaseQuantity = Convert.ToInt16(quantityTextBox.Text.ToString());


                }


                usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
                CartList.DataBind();
                LblTotal.Text = String.Format("{0:c}", usersShoppingCart.GetTotal());
                return usersShoppingCart.GetCartItems();
            }
        }



        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    // Extract values from the cell.
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }




        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            using (Actions_of_Cart usersShoppingCart = new Actions_of_Cart())
            {
                Session["payment_amt"] = usersShoppingCart.GetTotal();
            }
            Response.Redirect("Checkout/CheckoutStart.aspx");
        }

        protected void CheckoutBtn_Click(object sender, ImageClickEventArgs e)
        {
            using (Actions_of_Cart usersShoppingCart = new Actions_of_Cart())
            {
                Session["payment_amt"] = usersShoppingCart.GetTotal();
            }
            Response.Redirect("Checkout/CheckoutStart.aspx");
        }
    }
}








