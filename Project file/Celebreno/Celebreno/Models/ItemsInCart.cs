using System.ComponentModel.DataAnnotations;

namespace Celebreno.Models
{
    public class ItemsInCart
    {
        [Key]
        public string Item_ID { get; set; }

        public string Cart_ID { get; set; }

        public int Quantity { get; set; }

        //the data that the item has been created in 
        public System.DateTime Date { get; set; }

        public int ServicePackId { get; set; }

        public virtual ServicePack ServicePack { get; set; }


    }
}