using Azure.Core;
using Microsoft.EntityFrameworkCore;
using WebApi.Models;

namespace WebApi.Services
{
    public class TareaService : ITareaService
    {
        TareasContext context;
        public TareaService(TareasContext dbcontext)
        {
            context = dbcontext;
        }
        public IEnumerable<Tarea> Get()
        {
            return context.Tareas;
        }

        public async Task Save(Tarea tareas)
        {
            await context.AddAsync(tareas);
            context.SaveChanges();
        }

        public async Task Update(Guid id, Tarea tareaBody)
        {
            var tareaActual = context.Tareas.Find(id);

//            Console.WriteLine(tareaBody.Titulo, tareaBody.Descripcion, tareaBody.PrioridadTarea);
//           Console.WriteLine(tareaBody.CategoriaId);

            if (tareaActual != null && tareaBody != null)
            {
                tareaActual.CategoriaId = tareaBody.CategoriaId;
                tareaActual.Titulo = tareaBody.Titulo;
                tareaActual.Descripcion = tareaBody.Descripcion;
                tareaActual.PrioridadTarea = tareaBody.PrioridadTarea;
                tareaActual.FechaCreacion = tareaBody.FechaCreacion;
                tareaActual.Resumen = tareaBody.Resumen;

                context.SaveChanges();
            }
            else
            {
                await context.SaveChangesAsync();

            }
        }

        public async Task Delete(Guid id)
        {
            var tareaActual = context.Tareas.Find(id);
            if (tareaActual != null)
            {
                context.Remove(tareaActual);
                context.SaveChanges();
            }
            else
            {
                await context.SaveChangesAsync();
            }
        }
    }

    public interface ITareaService
    {
        IEnumerable<Tarea> Get();
        Task Save(Tarea tareas);
        Task Update(Guid id, Tarea tarea);
        Task Delete(Guid id);
    }
}
