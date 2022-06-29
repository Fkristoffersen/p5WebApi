using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using p5WebApi.Models;

namespace p5WebApi.Data
{
    public class p5WebApiContext : DbContext
    {
        public p5WebApiContext (DbContextOptions<p5WebApiContext> options)
            : base(options)
        {
        }

        public DbSet<p5WebApi.Models.StudentModel>? StudentModel { get; set; }
    }
}
