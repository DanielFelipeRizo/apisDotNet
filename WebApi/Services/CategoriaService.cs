using Microsoft.EntityFrameworkCore;
using WebApi.Models;

namespace WebApi.Services
{
    public class CategoriaService: ICategoriaService
    {
        TareasContext context;

        public CategoriaService(TareasContext dbcontext)
        {
            context = dbcontext;
        }

        public IEnumerable<Categoria> Get()
        {
            return context.Categorias;
        }

        public async Task Save(Categoria categoria)
        {
            await context.Categorias.AddAsync(categoria);
            context.SaveChanges();
        }

        public async Task Update(Guid id, Categoria categoriaBody)
        {
            var categoriaActual = context.Categorias.Find(id);
            if(categoriaActual != null && categoriaBody != null)
            {
                categoriaActual.Nombre= categoriaBody.Nombre;
                categoriaActual.Descripcion = categoriaBody.Descripcion;
                categoriaActual.Peso = categoriaBody.Peso;

                context.SaveChanges();
            }
            else
            {
                await context.SaveChangesAsync();
            }
        }

        public async Task Delete(Guid id)
        {
            var categoriaActual = context.Categorias.Find(id);
            if (categoriaActual != null)
            {
                context.Remove(categoriaActual);
                context.SaveChanges();
            }
        }
    }

    public interface ICategoriaService
    {
        IEnumerable<Categoria> Get();
        Task Save(Categoria categoria);
        Task Update(Guid id, Categoria categoria);
        Task Delete(Guid id);
    }
}
