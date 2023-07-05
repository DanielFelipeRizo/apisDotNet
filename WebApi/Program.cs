using WebApi;
using WebApi.Middlewares;
using WebApi.Services;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//configurar entity framework
builder.Services.AddSqlServer<TareasContext>(builder.Configuration.GetConnectionString("conn1"));

//inyectar dependencia de la carpeta services(inyector)
//builder.Services.AddScoped<IHelloWorldService, HelloWorldService>();
//otra forma de inyectar la dependencia
builder.Services.AddScoped<IHelloWorldService>(p => new HelloWorldService());
builder.Services.AddScoped<ICategoriaService, CategoriaService>();
builder.Services.AddScoped<ITareaService, TareaService>();
builder.Services.AddScoped<IUsuarioService, UsuarioService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

//middleware de pagina de inicio de la api
//app.UseWelcomePage();

//middleware que agrega la hora en los json
//app.UseTimeMiddleware();

app.MapControllers();

app.Run();

//comandos migraciones EF
//nombre de la migracion: dotnet ef migrations add nombreMigracion
//ejecutar migracion en la DB: dotnet ef database update

