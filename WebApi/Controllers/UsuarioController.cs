using Microsoft.AspNetCore.Mvc;
using WebApi.Services;
using WebApi.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApi.Controllers
{
    [Route("api/[Controller]")]
    public class UsuarioController: ControllerBase
    {
        private readonly TareasContext context;
        IUsuarioService usuarioService;

        public UsuarioController(TareasContext contextC, IUsuarioService usuarioServiceC)
        {
            context= contextC;
            usuarioService= usuarioServiceC;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(usuarioService.GetAll());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid? id)
        {
            var userById = await context.Usuarios.FirstOrDefaultAsync(m => m.UsuarioId == id);
            if (id == null || context.Usuarios == null || userById == null)
            {
                return NotFound("No encontrado");
            }
            return Ok(userById);
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
