using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web;

namespace ConstruTEC.Models
{
    public class Persona : SQLExecutable
    {
        
        string commCheckPersona = "loginUser2";
        string commCreatePersona = "";
        public bool existsPersona { get; set; }

        [Required]
        public string Cedula { get; set; }
        [Required]
        public int CodigoArquitecto { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string PrimerApellido { get; set; }
        [Required]
        public string SegundoApellido { get; set; }
        [Required]
        public string Direccion { get; set; }
        [Required]
        public DateTime FechaNacimiento { get; set; }
        [Required]
        public string Telefono { get; set; }


        public void bindDataParameter()
        {
            paramList = new List<NpgsqlParameter>();
            paramList.Add(createPameter("newCedula", NpgsqlTypes.NpgsqlDbType.Varchar, Cedula, 50));
            paramList.Add(createPameter("newNombrePersona", NpgsqlTypes.NpgsqlDbType.Varchar, Nombre, 100));
            paramList.Add(createPameter("apellido1", NpgsqlTypes.NpgsqlDbType.Varchar, PrimerApellido, 100));
            paramList.Add(createPameter("apellido2", NpgsqlTypes.NpgsqlDbType.Varchar, SegundoApellido, 100));
            paramList.Add(createPameter("direccion", NpgsqlTypes.NpgsqlDbType.Varchar, Direccion, 100));
            paramList.Add(createPameter("telefono", NpgsqlTypes.NpgsqlDbType.Varchar, Telefono, 100));
            paramList.Add(createPameter("fecha", NpgsqlTypes.NpgsqlDbType.Date, FechaNacimiento, 100));
            paramList.Add(createPameter("codigo", NpgsqlTypes.NpgsqlDbType.Integer, CodigoArquitecto, 100));
            
        }

    }
}