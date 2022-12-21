using Microsoft.AspNetCore.Mvc;
using WebApi.Services;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[Controller]")]
    public class CategoriaController : ControllerBase
    {
        //recibir el servicio
        ICategoriaService categoriaService;

        public CategoriaController(ICategoriaService service)
        {
            categoriaService = service;
        }

        //endpoins
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(categoriaService.Get());
        }

        [HttpPost]
        public IActionResult post([FromBody] Categoria categoria)
        {
            categoriaService.Save(categoria);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult put(Guid id, [FromBody] Categoria categoriaBody)
        {
            categoriaService.Update(id, categoriaBody);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult delete(Guid id)
        {
            categoriaService.Delete(id);
            return Ok();
        }
    }
}
