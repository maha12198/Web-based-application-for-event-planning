using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Celebreno.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Celebreno.Cart
{
    internal class RoleActions
    {

        internal void AddAdminRole()
        {

            Models.ServicePackContext contextAdmin = new ServicePackContext();
            IdentityResult ID_AdminRole_Result;
            IdentityResult ID_AdminUser_Result;

            var AdminRoleStore = new RoleStore<IdentityRole>(contextAdmin);

            var AdminRoleMgr = new RoleManager<IdentityRole>(AdminRoleStore);

            if (!AdminRoleMgr.RoleExists("AdmincanEdit"))
            {
                ID_AdminRole_Result = AdminRoleMgr.Create(new IdentityRole { Name = "AdmincanEdit" });
            }

            var AdminUserMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(contextAdmin));
            var AdminAppUser = new ApplicationUser

            {
                UserName = "Admin",
                Email = "Admin@Celebreno.com"
            };
            ID_AdminUser_Result = AdminUserMgr.Create(AdminAppUser, "Pa$$wordAdmin");

            if (!AdminUserMgr.IsInRole(AdminUserMgr.FindByEmail("Admin@Celebreno.com").Id, "AdmincanEdit"))
            {
                ID_AdminUser_Result = AdminUserMgr.AddToRole(AdminUserMgr.FindByEmail("Admin@Celebreno.com").Id, "AdmincanEdit");
            }

        }





        internal void AddProviderRole()
        {

            Models.ServicePackContext contextProvider = new ServicePackContext();
            IdentityResult ID_ProviderRole_Result;
            IdentityResult ID_ProviderUser_Result;


            var ProviderRoleStore = new RoleStore<IdentityRole>(contextProvider);


            var ProviderRoleMgr = new RoleManager<IdentityRole>(ProviderRoleStore);

        
            if (!ProviderRoleMgr.RoleExists("ProviderCanAdd"))
            {
                ID_ProviderRole_Result = ProviderRoleMgr.Create(new IdentityRole { Name = "ProviderCanAdd" });
            }


            var ProviderUserMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(contextProvider));
            var ProviderAppUser = new ApplicationUser

            {
                UserName = "Provider",
                Email = "Provider@Celebreno.com"
            };

            ID_ProviderUser_Result = ProviderUserMgr.Create(ProviderAppUser, "Pa$$wordProvider");

            if (!ProviderUserMgr.IsInRole(ProviderUserMgr.FindByEmail("Provider@Celebreno.com").Id, "ProviderCanAdd"))
            {
                ID_ProviderUser_Result = ProviderUserMgr.AddToRole(ProviderUserMgr.FindByEmail("Provider@Celebreno.com").Id, "ProviderCanAdd");
            }

        }
    }
}