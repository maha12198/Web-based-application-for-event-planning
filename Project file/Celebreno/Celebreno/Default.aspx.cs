using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Celebreno
{
    public partial class _Default : Page
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
            //ctrl + F5 to show and test the error handeled in the ShowErrorPage.aspx 
          //  throw new InvalidOperationException("An InvalidOperationException " + "occurred in the Page_Load handler on the Default.aspx page.");

        }


        //decalre a fucntion to handle page level errors  
        private void Handling_Page_Error(object sender, EventArgs e)
        {
            // Get last error from the server.
            Exception exc = Server.GetLastError();

            // Handle specific exception.
            if (exc is InvalidOperationException)
            {
                // Pass the error on to the error page.
                Server.Transfer("ShowErrorPage.aspx?handler=Page_Error%20-%20Default.aspx",
                    true);
            }
        }





    }
}