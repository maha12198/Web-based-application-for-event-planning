using System.Collections.Generic;
using System.Data.Entity;


namespace Celebreno.Models
{

    //note: maybe changed to DropCreateDatabaseIfModelChanges
   
    public class ServicePackDatabaseInitializer : DropCreateDatabaseAlways<ServicePackContext>
    {

        protected override void Seed(ServicePackContext context)
        {
            GetEventTypes().ForEach(c => context.EventTypes.Add(c)); 
            GetServicePacks().ForEach(p => context.ServicePacks.Add(p));
        }


        private static List<EventType> GetEventTypes()
        {

            //note: eventtypes var used in Context.ServicePacks.Add()
            var eventTypes = new List<EventType>
            {
                new EventType
                {
                    EventTypeID = 1,
                    EventTypeName = "Social Events"
                },

                new EventType
                {
                    EventTypeID = 2,
                    EventTypeName = "Wedding Events"
                },
            };

            return eventTypes;
        }


        private static List<ServicePack> GetServicePacks()
        {
            var ServicePacks = new List<ServicePack>
            {
                new ServicePack
                {
                    ID = 1,
                    Description = "Booking Venue, "+"Food Arrangement, "
                    +"Coordination of Transportation, "+"Supervsion at the Site",

                  // ImagePath ="calendar.png",
                    UnitPrice = 240,
                    EventTypeID=1, //social
                    Rate= 3.5,
                   Provider= "Al Wesal"
                },

                new ServicePack
                {
                    ID = 2,
                    Description = "Booking a Venue, "+"Food Arrangement, "
                    +"Coordination of Activities, "+"Selection and Coordination of Speakers",
           
                  //  ImagePath ="calendar.png",
                    UnitPrice = 350,
                    EventTypeID=1, //social
                    Rate= 4,
                   Provider= "Ibn Khaldun"
                },

                new ServicePack
                {
                    ID = 3,
                    Description = "Booking a Venue, "+"Creating a Guest List, "
                    +"Supervision at the Site, "+"Sending of Invitations",
                    
                  //  ImagePath ="calendar.png",
                    UnitPrice = 400,
                    EventTypeID=2, //wedding
                    Rate= 4.5,
                    Provider= "Nesto"
                },

                new ServicePack
                {
                    ID = 4,
                    Description = "Food Arrangement, "+"Venu Decoration, "
                    +"Sending of Invitations, "+"Arrangement for the equipment and facilities",
                   
                   // ImagePath ="calendar.png",
                    UnitPrice = 200,
                    EventTypeID=2, //wedding
                    Rate= 3,
                    Provider= "Hi5 Center"
                },

            };

            return ServicePacks;
        }
    }
}