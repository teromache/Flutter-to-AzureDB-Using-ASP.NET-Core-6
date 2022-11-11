
using fixit.Models;
using Microsoft.EntityFrameworkCore;

namespace fixit.Data

{
    
    public class DataContext : DbContext
    {
        public DataContext() { }
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

            public DbSet<Service> Parking { get; set; }

            public DbSet<Customer> Customers { get; set; }

            public DbSet<Money> Money {get; set;}
        
        }
}

