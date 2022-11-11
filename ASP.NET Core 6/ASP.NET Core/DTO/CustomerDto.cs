using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace fixit.DTO
{
    public class CustomerDto
    {

        [Required]
        public int CustomerId { get; set; }
        [Required]
        public string PlateNumber { get; set; }
        [Required]
        public string Email {get;set;}
        [Required]
        public string PhoneNum {get;set;}
        //[Required]
        // //public string Category { get; set; }
        // //[Required]
        // public int InitialPrice { get; set; }
        // [Required]
        // public int IntermediatePrice { get; set; }
        // [Required]
        // public int AdvancedPrice { get; set; }
        // // [Required]
        // // public DateTime AddedTime { get; set; }





    }
}