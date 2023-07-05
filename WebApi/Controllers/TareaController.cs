using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApi.Models;
using WebApi.Services;

namespace WebApi.Controllers
{
    [Route("api/[Controller]")]

    public class TareaController : ControllerBase
    {
        //recibir el contexto y servicio
        private readonly TareasContext context;
        ITareaService tareaService;
        public TareaController(TareasContext contextC, ITareaService tareaServiceC)
        {
            context = contextC;
            tareaService = tareaServiceC;
        }

        [HttpGet]
        public IActionResult Get()
        {
            //return Ok(tareaService.GetService());
            return tareaService.GetService() != null ?
                Ok(tareaService.GetService()) :
                NotFound();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid? id)
        {
            var taskById = await context.Tareas.FirstOrDefaultAsync(m => m.TareaId == id);

            return (id == null || context.Tareas == null || taskById == null) ?
                NotFound("No encontrado") : Ok(taskById);

        }

        [HttpPost]
        public IActionResult Post([FromBody] Tarea tarea)
        {
            tareaService.SaveService(tarea);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult put(Guid id, [FromBody] Tarea tareaBody)
        {
            tareaService.UpdateService(id, tareaBody);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult delete(Guid id)
        {
            tareaService.DeleteService(id);
            return Ok();
        }
    }
}
