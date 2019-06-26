using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ConstruTEC.Models;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Diagnostics;

namespace ConstruTEC.Models
{
    public class UsuarioPersona: SQLExecutable
    {
        string commCreateUser = "createUser";
        public HttpStatusCode usuariopersonaHttpStatus { get; set; }
        [Required]
        public Persona persona { get; set; }
        [Required]
        public Usuario usuario { get; set; }
        public string createUsuarioPersona()
        {
            
            usuario.bindDataParameter();
            usuario.bindRolData();
            persona.bindDataParameter();
            paramList = new List<Npgsql.NpgsqlParameter>();
            paramList.AddRange(usuario.paramList);
            paramList.AddRange(persona.paramList);
                        string test1 = ExecReader(commCreateUser, paramList);
            Debug.WriteLine("asdfasdfsadfasdfasdf");

            Debug.WriteLine(test1);
            if (test1.Contains("error"))
            {
                httpStatus = HttpStatusCode.BadRequest;
                return test1;
            }
            else
            {
                httpStatus = HttpStatusCode.OK;
                return test1;
            }

        }

    }
}