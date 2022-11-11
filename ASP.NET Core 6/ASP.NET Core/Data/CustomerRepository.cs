using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using fixit.Models;


namespace fixit.Data
{
    public class CustomerRepository : CustomerIRepository<Customer>
    {
        private readonly DataContext _context;
        public CustomerRepository(DataContext context)
        {
            _context = context;
        }
        // Delete Service objects
        public async Task<bool> DeleteData(Customer customer)
        {
            Console.WriteLine("Delete method invoked");
            _context.Customers.Remove(customer);
            await _context.SaveChangesAsync();
            return true;
        }


        // Get all service objects
        public async Task<List<Customer>> GetData()
        {
            //    Getting database data here
            var model = await _context.Customers.ToListAsync();
            return model;

        }
        // Get Service by  id
        public async Task<Customer> GetDataById(int id)
        {
            return await _context.Customers.FirstOrDefaultAsync(x => x.CustomerId == id);
        }
        public Task<Customer> PutJob(Customer job)
        {
            throw new NotImplementedException();
        }

        // Update and crete new service objects
        public async Task<Customer> InsertData(Customer service)
        {

            Console.WriteLine("Create data  method invoked");
            _context.Customers.Add(service);

            await _context.SaveChangesAsync();
            return service;
        }

        public async Task<Customer> UpdateData(Customer service)
        {




            Console.WriteLine("Update method  invoked");



            _context.Update(service).Property(x => x.CustomerId).IsModified = false;
            _context.SaveChanges();

            return service;
        }
    }

    

}