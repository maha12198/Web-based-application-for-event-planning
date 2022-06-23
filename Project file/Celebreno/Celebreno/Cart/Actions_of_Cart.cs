using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Celebreno.Models;

namespace Celebreno.Cart
{
    public class Actions_of_Cart : IDisposable
    {

        public string ShoppingCartId { get; set; }
        private ServicePackContext _db = new ServicePackContext();
        public const string CartSessionKey = "Cart_ID";


        //Function to add servicepack to cart
        public void AddToCart(int id)
        {
            // Retrieve the servicepack from the database.
            // GetCartId() Fucntion, declared above, in this page
            ShoppingCartId = GetCartId();

           
            //Note: CartItem.css is accessed by ShoppingCartItems in the context class
            var cartItem = _db.Cart_Items.SingleOrDefault(
                //CartId which is in CartItem.css
                c => c.Cart_ID == ShoppingCartId
                && c.ServicePackId == id);
            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists.                 
                cartItem = new ItemsInCart
                {
              
                    Item_ID = Guid.NewGuid().ToString(),
                    ServicePackId = id,
                    Cart_ID = ShoppingCartId,
                    ServicePack = _db.ServicePacks.SingleOrDefault(
                   p => p.ID == id),
                    Quantity = 1,
                    Date = DateTime.Now
                };

      
                _db.Cart_Items.Add(cartItem);
            }
            else
            {
                // If the item does exist in the cart,                  
                // then add one to the quantity.                 
                cartItem.Quantity++;
            }
            //auto or built-in declared function 
            _db.SaveChanges();
        }

        public void Dispose()
        {
            if (_db != null)
            {
                _db.Dispose();
                _db = null;
            }
        }


        public string GetCartId()
        {
            if (HttpContext.Current.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
                {
                    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class.     
                    Guid tempCartId = Guid.NewGuid();
                    HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            //the return value of the fucntion
            return HttpContext.Current.Session[CartSessionKey].ToString();
        }


        public List<ItemsInCart> GetCartItems()
        {
            ShoppingCartId = GetCartId();

            //which is in the context class
            return _db.Cart_Items.Where(
                c => c.Cart_ID == ShoppingCartId).ToList();
        }


        public decimal GetTotal()
        {
            //call GetCartId() function and store the return value in ShoppingCartId variable
            ShoppingCartId = GetCartId();

            //declare a new variable "tot" as a nullable decimal variable
            decimal? tot = decimal.Zero;

            //quiries to retrieve data from the DB and get sum of it, then store it in tot variable
            // Multiply servicepack price by quantity of that it to get        
            // the current price for each of those servicepacks in the cart.   
            tot = (decimal?)(from cartItems in _db.Cart_Items
                               where cartItems.Cart_ID == ShoppingCartId
                               select (int?) cartItems.Quantity * cartItems.ServicePack.UnitPrice).Sum();

            //the return value of the fucntion is "tot", which is the total amount of the items in Cart
            return tot ?? decimal.Zero;
        }


        public Actions_of_Cart GetCart(HttpContext context)
        {
            using (var cart = new Actions_of_Cart())
            {
                cart.ShoppingCartId = cart.GetCartId();
                return cart;
            }
        }


        //called in UpdateCartItems() fucntion , in click event  
        public void UpdateShoppingCartDatabase(String cartId, ShoppingCartUpdates[] CartItemUpdates)
        {
            using (var db = new Celebreno.Models.ServicePackContext())
            {
                try
                {
                    int CartItemCount = CartItemUpdates.Count();
                    List<ItemsInCart> myCart = GetCartItems();
                    foreach (var cartItem in myCart)
                    {
                        // Iterate through all rows within shopping cart list
                        for (int i = 0; i < CartItemCount; i++)
                        {
                            if (cartItem.ServicePack.ID == CartItemUpdates[i].ProductId)
                            {
                                if (CartItemUpdates[i].PurchaseQuantity < 1 || CartItemUpdates[i].RemoveItem == true)
                                {
                                    RemoveItem(cartId, cartItem.ServicePackId);
                                }
                                else
                                {
                                    UpdateItem(cartId, cartItem.ServicePackId, CartItemUpdates[i].PurchaseQuantity);
                                }
                            }
                        }
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Database - " + exp.Message.ToString(), exp);
                }
            }
        }


        public void RemoveItem(string removeCartID, int removeProductID)
        {
            using (var _db = new Celebreno.Models.ServicePackContext())
            {
                try
                {
                    var myItem = (from c in _db.Cart_Items where c.Cart_ID == removeCartID && c.ServicePack.ID == removeProductID select c).FirstOrDefault();
                    if (myItem != null)
                    {
                        // Remove Item.
                        _db.Cart_Items.Remove(myItem);
                        _db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Remove Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }



        public void UpdateItem(string updateCartID, int updateProductID, int quantity)
        {
            using (var _db = new Celebreno.Models.ServicePackContext())
            {
                try
                {
                    var myItem = (from c in _db.Cart_Items where c.Cart_ID == updateCartID && c.ServicePack.ID == updateProductID select c).FirstOrDefault();
                    if (myItem != null)
                    {
                        myItem.Quantity = quantity;
                        _db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }


        public void EmptyCart()
        {
            ShoppingCartId = GetCartId();
            var cartItems = _db.Cart_Items.Where(
                c => c.Cart_ID == ShoppingCartId);
            foreach (var cartItem in cartItems)
            {
                _db.Cart_Items.Remove(cartItem);
            }
            // Save changes.             
            _db.SaveChanges();
        }



        public int GetCount()
        {
            ShoppingCartId = GetCartId();

            // Get the count of each item in the cart and sum them up          
            int? count = (from cartItems in _db.Cart_Items
                          where cartItems.Cart_ID == ShoppingCartId
                          select (int?)cartItems.Quantity).Sum();
            // Return 0 if all entries are null         
            return count ?? 0;
        }



        public struct ShoppingCartUpdates
        {
            public int ProductId;
            public int PurchaseQuantity;
            public bool RemoveItem;
        }


        //declare a fucntion for enabling cart migration
        public void MigrateCart(string cartId, string userName)
        {
            var shoppingCart = _db.Cart_Items.Where(c => c.Cart_ID == cartId);
            foreach (ItemsInCart item in shoppingCart)
            {
                item.Cart_ID = userName;
            }
            HttpContext.Current.Session[CartSessionKey] = userName;
            _db.SaveChanges();
        }


    }
}