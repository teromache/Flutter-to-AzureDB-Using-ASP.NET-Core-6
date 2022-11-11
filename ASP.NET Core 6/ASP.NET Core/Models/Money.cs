using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace fixit.Models
{
    public class Money
    {
        [Key]
        public int CustomerId { get; set; }

        public string amount { get; set; }


    }

}