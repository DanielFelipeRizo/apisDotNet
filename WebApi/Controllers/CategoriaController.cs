using Microsoft.AspNetCore.Mvc;
using WebApi.Services;
using WebApi.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApi.Controllers
{
    [Route("api/[Controller]")]
    public class CategoriaController : ControllerBase
    {
        //recibir el servicio y el contexto
        private readonly TareasContext context;
        ICategoriaService categoriaService;
        public CategoriaController(TareasContext contextC, ICategoriaService CategoriaServiceC)
        {
            context = contextC;
            categoriaService = CategoriaServiceC;
        }
        //endpoins
        [HttpGet]
        public IActionResult Get()
        {
            if(categoriaService.Get() == null)
            {
                return NotFound();
            }
            return Ok(categoriaService.Get());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid? id)
        {
            var categoryById = await context.Categorias.FirstOrDefaultAsync(m => m.CategoriaId == id);
            if (id == null || context.Categorias == null || categoryById == null)
            {
                return NotFound("No encontrado");
            }
            return Ok(categoryById);
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
