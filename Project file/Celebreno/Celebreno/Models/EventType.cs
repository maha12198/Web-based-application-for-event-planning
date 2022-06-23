using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Celebreno.Models
{
    public class EventType
    {

        [ScaffoldColumn(false)]
        public int EventTypeID { get; set; }

        [Required, StringLength(100), Display(Name = "Event Type Name")]
        public string EventTypeName { get; set; }

        [Display(Name = "Services Provided")]
        public string Description { get; set; }

        //the link attt
        public virtual ICollection<ServicePack> ServicePacks { get; set; }


    }
}