using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace fixit.Models
{
    public class Customer
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CustomerId { get; set; }

        public string PlateNumber { get; set; }

        public string Email {get;set;}
        
        public string PhoneNum {get;set;}

        //public string Category { get; set; }

       // public int InitialPrice { get; set; }

        //public int IntermediatePrice { get; set; }

        //public int AdvancedPrice { get; set; }

        // public DateTime AddedTime {get;set;}




    }

}