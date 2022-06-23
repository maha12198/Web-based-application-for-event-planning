namespace Celebreno.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class newfields : DbMigration
    {
        public override void Up()
        {

            CreateTable(
               "dbo.AspNetUsers_2",
               c => new
               {
                   Id = c.String(nullable: false, maxLength: 128),
                   FirstName = c.String(),
                   LastName = c.String(),
                   Email = c.String(maxLength: 256),
                   EmailConfirmed = c.Boolean(nullable: false),
                   PasswordHash = c.String(),
                   SecurityStamp = c.String(),
                   PhoneNumber = c.String(),
                   PhoneNumberConfirmed = c.Boolean(nullable: false),
                   TwoFactorEnabled = c.Boolean(nullable: false),
                   LockoutEndDateUtc = c.DateTime(),
                   LockoutEnabled = c.Boolean(nullable: false),
                   AccessFailedCount = c.Int(nullable: false),
                   UserName = c.String(nullable: false, maxLength: 256),
               })
               .PrimaryKey(t => t.Id)
               .Index(t => t.UserName, unique: true, name: "UserNameIndex");



        }
        
        public override void Down()
        {

            DropForeignKey("dbo.AspNetUserRoles", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserLogins", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserClaims", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserRoles", "RoleId", "dbo.AspNetRoles");
            DropForeignKey("dbo.ItemsInCarts", "ServicePackId", "dbo.ServicePacks");
            DropForeignKey("dbo.ServicePacks", "EventTypeID", "dbo.EventTypes");
            DropIndex("dbo.AspNetUserLogins", new[] { "UserId" });
            DropIndex("dbo.AspNetUserClaims", new[] { "UserId" });
            DropIndex("dbo.AspNetUsers", "UserNameIndex");
            DropIndex("dbo.AspNetUserRoles", new[] { "RoleId" });
            DropIndex("dbo.AspNetUserRoles", new[] { "UserId" });
            DropIndex("dbo.AspNetRoles", "RoleNameIndex");
            DropIndex("dbo.ServicePacks", new[] { "EventTypeID" });
            DropIndex("dbo.ItemsInCarts", new[] { "ServicePackId" });
            DropTable("dbo.AspNetUserLogins");
            DropTable("dbo.AspNetUserClaims");
            DropTable("dbo.AspNetUsers");
            DropTable("dbo.AspNetUserRoles");
            DropTable("dbo.AspNetRoles");
            DropTable("dbo.EventTypes");
            DropTable("dbo.ServicePacks");
            DropTable("dbo.ItemsInCarts");
        }
    }
}
