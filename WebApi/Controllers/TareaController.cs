using Microsoft.AspNetCore.Mvc;
using WebApi.Models;
using WebApi.Services;

namespace WebApi.Controllers
{
    [Route("api/[Controller]")]

    public class TareaController : ControllerBase
    {
        ITareaService tareaService;

        public TareaController(ITareaService service)
        {
            tareaService = service;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(tareaService.Get());
        }

        [HttpPost]
        public IActionResult Post([FromBody] Tarea tarea)
        {
            tareaService.Save(tarea);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult put(Guid id, [FromBody] Tarea tareaBody)
        {
            tareaService.Update(id, tareaBody);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult delete(Guid id)
        {
            tareaService.Delete(id);
            return Ok();
        }
    }
}
