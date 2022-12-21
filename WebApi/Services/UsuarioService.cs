using Microsoft.AspNetCore.Mvc;
using WebApi.Models;

namespace WebApi.Services
{
    public class UsuarioService: IUsuarioService
    {
        TareasContext context;

        public UsuarioService(TareasContext dbcontext)
        {
            context = dbcontext;
        }

        public IEnumerable<Usuario> GetAll()
        {
            return context.Usuarios;
        }

        public async Task Save(Usuario usuario)
        {
            try
            {
                await context.AddAsync(usuario);
                context.SaveChanges();
            }
            catch (Exception)
            {
                Console.WriteLine("error");

            }
        }

        public async Task Update(Guid id, Usuario usuarioBody)
        {
            var usuarioActual = context.Usuarios.Find(id);
            if (usuarioActual != null && usuarioBody != null)
            {
                usuarioActual.nombre = usuarioBody.nombre;
                usuarioActual.apellido = usuarioBody.apellido;
                usuarioActual.FechaCreacion = usuarioBody.FechaCreacion;

                context.SaveChanges();
            }
            else
            {
                await context.SaveChangesAsync();
            }
        }

        public async Task Delete(Guid id)
        {
            var usuarioActual = context.Usuarios.Find(id);
            if(usuarioActual != null)
            {
                context.Remove(usuarioActual);
                context.SaveChanges();
            }
            else
            {
                await context.SaveChangesAsync();
            }
        }
    }

    public interface IUsuarioService
    {

        IEnumerable<Usuario> GetAll();
        Task Save(Usuario usuario);
        Task Update(Guid id, Usuario usuario);
        Task Delete(Guid id);
    }
}
