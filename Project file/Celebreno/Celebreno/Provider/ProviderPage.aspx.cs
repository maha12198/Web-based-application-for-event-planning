using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celebreno.Models;
using Celebreno.Cart;

using System.Web.ModelBinding;


using System.Data.SqlClient;
using System.Collections;

namespace Celebreno.Provider
{
    public partial class ProviderPage : System.Web.UI.Page
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
            string ServicePackAction = Request.QueryString["ServicePackAction"];
            if (ServicePackAction == "Add")
            {
                LabelActionStatus.Text = "Service Package Sucessfully Added!";
            }

        }


        //Declare the Select Methods used in the controls like (DropDownList)
        public IQueryable GetEventTypes()
        {
            var _db = new Celebreno.Models.ServicePackContext();
            IQueryable query = _db.EventTypes;
            return query;
        }

        public IQueryable GetServicePacks()
        {
            var _db = new Celebreno.Models.ServicePackContext();
            IQueryable query = _db.ServicePacks;
            return query;
        }


        //for the View Button: to display the data from the DB, and with respect to its category also (eventType), The select Method
        public IQueryable<ServicePack> GetServicePacksView([QueryString("id")] int? eventtypeId)
        {
            var _db = new Celebreno.Models.ServicePackContext();
            IQueryable<ServicePack> query = _db.ServicePacks;
            if (eventtypeId.HasValue && eventtypeId > 0)
            {
                query = query.Where(p => p.EventTypeID == eventtypeId);
            }
            return query;
        }


        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            MultiViewAdmin.ActiveViewIndex = 0;
        }


        protected void BtnView_Click(object sender, EventArgs e)
        {
            MultiViewAdmin.ActiveViewIndex = 1;
        }

        //declare function to add a new service package
        public bool AddServicePack(string ProductName, string ProductDesc, string ProductPrice, string ProductCategory)
        {
            var myProduct = new ServicePack();


            myProduct.Provider = ProductName;
            myProduct.Description = ProductDesc;
            myProduct.UnitPrice = Convert.ToDouble(ProductPrice);
          
            myProduct.EventTypeID = Convert.ToInt32(ProductCategory);

            using (ServicePackContext _db = new ServicePackContext())
            {
                // Add product to DB.
                _db.ServicePacks.Add(myProduct);
                _db.SaveChanges();
            }
            // if it is Success.
            return true;
        }

        //handle click event of the add button to insert a new item into the DB
        protected void BtnAddService_Click(object sender, EventArgs e)
        {
           
                // Call the Add fucntion()
                bool addSuccess = AddServicePack(AddServicePackName.Text, TxtAddDesc.Text, AddProductPrice.Text, DropDownAddEventType.SelectedValue);
                if (addSuccess)
                {
                    // Reload the page.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?ServicePackAction=Add");
                    //LabelActionStatus.Text = "Service Package Sucessfully Removed!";
                }
                else
                {
                    LabelActionStatus.Text = "Unable to add the new service package to the database.";
                }
            
        }

    }
}