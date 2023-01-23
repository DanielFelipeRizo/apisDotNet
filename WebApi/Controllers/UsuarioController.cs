using Microsoft.AspNetCore.Mvc;
using WebApi.Services;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[Controller]")]
    public class UsuarioController: ControllerBase
    {
        IUsuarioService usuarioService;

        public UsuarioController(IUsuarioService service)
        {
            usuarioService = service;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(usuarioService.GetAll());
        }

        [HttpPost]
        public IActionResult Save([FromBody] Usuario usuario)
        {
            usuarioService.Save(usuario);

            return Ok("insercion exitosa");
        }

        [HttpPut("{id}")]
        public IActionResult Put(Guid id, [FromBody] Usuario usuario)
        {
            usuarioService.Update(id, usuario);
            return Ok("Actualizacion exitosa");
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(Guid id)
        {
            usuarioService.Delete(id);
            return Ok("usuario eliminado exitosamente");
        }
    }
}
