using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using p5WebApi.Data;
var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("p5WebApiContext");
builder.Services.AddDbContext<p5WebApiContext>(options =>
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));


var MyAllowSpecificOrigins = "_myAllowSpecificOrigins"; //

builder.Services.AddCors(options => 
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.WithOrigins("http://localhost:3000/",
                                              "http://localhost:3001/");
                      });
});//













// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();


app.UseCors(MyAllowSpecificOrigins); //




app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

