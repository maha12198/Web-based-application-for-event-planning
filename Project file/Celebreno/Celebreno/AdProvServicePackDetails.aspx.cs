using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celebreno.Models;
using System.Web.ModelBinding;

namespace Celebreno
{
    public partial class AdProvServicePackDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ServicePack> GetServicePack(
                        [QueryString("id")] int? servicepackId
                        , [RouteData] string servicepackProvider)
        {
            var _db = new Celebreno.Models.ServicePackContext();
            IQueryable<ServicePack> query = _db.ServicePacks;
 
            if (servicepackId.HasValue && servicepackId > 0)
            {
                query = query.Where(p => p.ID == servicepackId);
            }

            //for routing
            else if (!String.IsNullOrEmpty(servicepackProvider))
            {
                query = query.Where(s =>
                          String.Compare(s.Provider, servicepackProvider) == 0);
            }
            else
            {
                query = null;
            }
            return query;
        }
    }
}