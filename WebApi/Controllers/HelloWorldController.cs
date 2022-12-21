//utilizar la inyeccion definida en program.cs
using Microsoft.AspNetCore.Mvc;
using WebApi.Services;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HelloWorldController : ControllerBase
    {
        //recibir dependencia de helloWorldService(Servicio de helloWorld inyectado)
        IHelloWorldService helloWorldService;

        //comprobar si la BD esta creada
        TareasContext dbcontext;

        //creacion de logger para este controlador
        private readonly ILogger<HelloWorldController> _logger;


        //recibir la instancia que el inyector a creado a traves del contructor
        public HelloWorldController(IHelloWorldService helloWorld, ILogger<HelloWorldController> logger, TareasContext db)
        {

            _logger = logger;
            //se le asigna el valor a la propiedad helloWorldService
            helloWorldService = helloWorld;

            //comprobar si la BD esta creada
            dbcontext = db;
        }

        [HttpGet]
        public IActionResult Get()
        {
            _logger.LogInformation("retornando codigo de respuesta y mensaje");
            return Ok(helloWorldService.GetHelloWorld());
        }

        //comprobar si la BD esta creada
        [HttpGet]
        [Route("createdb")]
        public IActionResult CreateDatabase()
        {
            dbcontext.Database.EnsureCreated();
            return Ok();
        }
    }
}
