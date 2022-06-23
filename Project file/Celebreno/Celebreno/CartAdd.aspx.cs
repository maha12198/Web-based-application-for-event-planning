using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Diagnostics;
using Celebreno.Cart;

namespace Celebreno
{
    public partial class CartAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ID"];
            int productId;

            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
            {
                using (Actions_of_Cart usersShoppingCart = new Actions_of_Cart())
                {
                    usersShoppingCart.AddToCart(Convert.ToInt16(rawId));
                }

            }
            else
            {
               Debug.Fail("ERROR : We should never get to Cart_Add.aspx without a ServicePackId.");
               throw new Exception("ERROR : It is illegal to load Cart_Add.aspx without setting a ServicePackId.");
            }
            Response.Redirect("Shopping Cart Authorization/ShoppingCart.aspx");

        }
    }
}