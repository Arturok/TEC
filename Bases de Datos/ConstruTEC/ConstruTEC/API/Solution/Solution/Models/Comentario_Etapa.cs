using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConstruTEC.Models
{
    public class Comentario_Etapa
    {
        public int ID { get; set; }
        public int IDEtapa { get; set; }
        public int IDComentario { get; set; }
    }
}