using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

using System.Data.Entity;
using Celebreno.Models;

using Celebreno.Cart;



namespace Celebreno
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);


            //1
            // Initialize the product database.
            Database.SetInitializer(new ServicePackDatabaseInitializer());


            //2
            // Create the custom role and user.
            RoleActions roleActions1 = new RoleActions();
            roleActions1.AddAdminRole();

            //3
            RoleActions roleActions2 = new RoleActions();
            roleActions2.AddProviderRole();



            //4
            //Add routes to support URL routing (SEO)
            //call the function
            RegisterNewRoutes(RouteTable.Routes);
        }

        //5
        //decalare function to add routes to the web application
        void RegisterNewRoutes(RouteCollection routes)
        {
            //add the routes by calling the MapPageRoute method of the RouteCollection object
            routes.MapPageRoute(
                "ServicePacksByEventTypeRoute",
                "EventType/{eventtypeName}",
                "~/ServicePackList.aspx"
            );


            routes.MapPageRoute(
                "ServicePackByProviderRoute",
                "ServicePack/{servicepackProvider}",
                "~/ServicePackDetails.aspx"
            );
        }



        //6
        // declare a function for application level error handling
        void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            if (exc is HttpUnhandledException)
            {
                //exc = new Exception(exc.InnerException.Message);
                // Pass the error on to the error page.
                Server.Transfer("ShowErrorPage.aspx?handler=Application_Error%20-%20Global.asax", true);
            }
        }

    }
}