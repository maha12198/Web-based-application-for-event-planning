using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Celebreno.Models;

namespace Celebreno.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = TxtUserName.Text, Email = Email.Text, FirstName = TxtFirstName.Text, LastName = TxtLastName.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {


              //  IdentityHelper.SignIn(manager, user, isPersistent: false);
               


                // Clear shopping cart.
                //using (Celebreno.Cart.Actions_of_Cart usersShoppingCart =
                  //  new Celebreno.Cart.Actions_of_Cart())
                //{
                  //  usersShoppingCart.EmptyCart();
                //}



                // migrate cart
                using (Celebreno.Cart.Actions_of_Cart usersShoppingCart = new Celebreno.Cart.Actions_of_Cart())
                {
                    String cartId = usersShoppingCart.GetCartId();
                    usersShoppingCart.MigrateCart(cartId, user.Id);
                }


                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}