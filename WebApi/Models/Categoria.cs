using System.Text.Json.Serialization;

namespace WebApi.Models
{
    public class Categoria
    {
        public Guid CategoriaId { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int Peso { get; set; }

       [JsonIgnore]
       //coleccion virtual para hacer relacion con tareas
        public virtual ICollection<Tarea> Tareas { get; set; }
    }
}
