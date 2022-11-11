using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using fixit.Data;
using fixit.DTO;
using Microsoft.AspNetCore.Mvc;
using fixit.Models;
using Microsoft.EntityFrameworkCore;

namespace money.Controllers
{
    [ApiController]
    [Route("api/money")]
    public class MoneyController : Controller
    {
        private DataContext _context;

        public MoneyController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("")]

        public async Task<ActionResult<List<Money>>> GetAction([FromServices] DataContext context)
        {
            var money = await context.Money.ToListAsync();
            return money;
        }

        [HttpPost]
        [Route("")]

        public async Task<ActionResult<Money>> Post([FromServices] DataContext context,[FromBody] Money model)
        {
            if(!ModelState.IsValid) {return BadRequest(ModelState);}

            context.Money.Add(model);
            await context.SaveChangesAsync();
            return model;
        } 
            
        
    }
}