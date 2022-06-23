namespace Celebreno.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Celebreno.Models.ServicePackContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "Celebreno.Models.ServicePackContext";
        }

        protected override void Seed(Celebreno.Models.ServicePackContext context)
        {

        }
    }
}
