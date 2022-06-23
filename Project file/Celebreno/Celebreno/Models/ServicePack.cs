using System.ComponentModel.DataAnnotations;

namespace Celebreno.Models
{
    public class ServicePack
    {

        [ScaffoldColumn(false)]
        public int ID { get; set; }

        [Required, StringLength(10000), Display(Name = "Services Provided"), DataType(DataType.MultilineText)]
        public string Description { get; set; }

        public string ImagePath { get; set; }

        [Display(Name = "Price")]
        public double? UnitPrice { get; set; }

        public int? EventTypeID { get; set; }

      
        public virtual EventType EventType { get; set; }

        [Display(Name = "Rate")]
        public double? Rate { get; set; }


        [StringLength(100), Display(Name = "Provider")]
        public string Provider { get; set; }


    }
}