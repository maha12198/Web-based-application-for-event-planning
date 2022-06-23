using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celebreno.Models;
using System.Web.ModelBinding;

using System.Web.Routing;

using Celebreno.Cart;

namespace Celebreno
{
    public partial class ServicePackList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //before implementing routing

        //to display the data from the DB, and with respect to its category also (eventType) 
        //public IQueryable<ServicePack> GetServicePacks([QueryString("id")] int? eventtypeId)
        //{
        //var _db = new Celebreno.Models.ServicePackContext();
        //IQueryable<ServicePack> query = _db.ServicePacks;

        //if (eventtypeId.HasValue && eventtypeId > 0)
        //{
        // query = query.Where(p => p.EventTypeID == eventtypeId);
        //}

        //  return query;
        //}


        //after implmenting routing
        //to display the data from the DB, and with respect to its category (eventType) 
        public IQueryable<ServicePack> GetServicePacks([QueryString("id")] int? eventtypeId, [RouteData] string eventtypeName)
        {
            var _db = new Celebreno.Models.ServicePackContext();
            IQueryable<ServicePack> query = _db.ServicePacks;

            if (eventtypeId.HasValue && eventtypeId > 0)
            {
                query = query.Where(p => p.EventTypeID == eventtypeId);
                
            }

            if (!String.IsNullOrEmpty(eventtypeName))
            {
                query = query.Where(p =>
                    String.Compare(p.EventType.EventTypeName,
                    eventtypeName) == 0);
            }
            return query;
        }








        //add the GetEventTypes method for linking the DB
        public IQueryable<EventType> GetEventTypes()
        {
            var _db = new Celebreno.Models.ServicePackContext();
            IQueryable<EventType> query = _db.EventTypes;
            return query;
        }



      


           

            //protected void EventTypeList_ItemCommand(object sender, DataListCommandEventArgs e)
            //{
            //  if (e.CommandName == "ViewDetails")
            //{
            //  Response.Redirect("CartAdd.aspx?ID=" + e.CommandArgument.ToString());
            //}

            //}
        }
}