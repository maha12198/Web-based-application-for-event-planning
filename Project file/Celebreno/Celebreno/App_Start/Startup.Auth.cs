using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.DataProtection;
using Microsoft.Owin.Security.Google;
using Owin;

using Celebreno.Models;

namespace Celebreno
{
    public partial class Startup {


        public void ConfigureAuth(IAppBuilder app)
        {
            // Configure the db context, user manager and signin manager to use a single instance per request
            app.CreatePerOwinContext(ServicePackContext.Create);
            app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
            app.CreatePerOwinContext<ApplicationSignInManager>(ApplicationSignInManager.Create);

            // Enable the application to use a cookie to store information for the signed in user
            // and to use a cookie to temporarily store information about a user logging in with a third party login provider
            // Configure the sign in cookie
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login"),
          
            });
            // Use a cookie to temporarily store information about a user logging in with a third party login provider
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);


            app.UseTwitterAuthentication(
               consumerKey: "JVdo7gr678mkbcB8rphYdfmFw",
               consumerSecret: "LSbpynGLCQAVOp1lcB6ZLIputILuwEJImR0fSXEAcA9WvQHiaW ");



            app.UseFacebookAuthentication(
               appId: "1037397509951037",
               appSecret: "6197e2263a913c08d61ae917799a4ec5");


            app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
            {
                ClientId = "431011539181-3mpf4pftqkgso6svtftrfp9cuf9ev940.apps.googleusercontent.com",
                ClientSecret = "ZQhC0uDCDGOAKGaZEtd4wO6o"
            });
        }
    }
}
