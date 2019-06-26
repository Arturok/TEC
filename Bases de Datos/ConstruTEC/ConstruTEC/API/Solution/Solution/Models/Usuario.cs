using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;


namespace ConstruTEC.Models
{/**
       *Clase que modela un susuario de la aplicacion y hereda de SQLExecutable
       * define en nombre de los procedimientos almacenados 
       * las variables "comm" definen el nombre del procedimiento almacenado que se desea ejecutar
       * @version 1.0
       * 25/10/2016 
        **/
    public class Usuario : SQLExecutable
    {
        string commAllUsers = "getAllUsers";
        string commCheckUser = "loginUser2";
        string commCreateUSer = "";
        public bool isValid = false;
        [Required]
        public string Nombre { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [StringLength(100, ErrorMessage = "El número de caracteres de {0} debe ser al menos {2}.", MinimumLength = 6)]
        public string Contrasena { get; set; }
        [Compare("Contrasena", ErrorMessage = "La nueva contraseña y la contraseña de confirmación no coinciden.")]
        public string confirmarContrasena { get; set; }
        public string Rol { get; set; }


        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commAllUser y retorna todos los usuarios
        * @params void
        * @return string con formato json que genera el SQLExecutable
        * **/
        public string getAllUsers()
        {
            return ExecReader(commAllUsers);
        }
        /**
        * Metodo que ejecuta la funcion con el nombre de la variable checkUSer y retorna  un booleano si cumple las condiciones
        * @params string Username contiene el nombre de usuario que se desea validar
        * @return string con formato json que genera el SQLExecutable
        * **/
        public string checkUser()
        {
            bindDataParameter();
            string test1 = ExecReader(commCheckUser, paramList);
            Debug.WriteLine(test1);
            if (test1.Contains("rol"))
            {
                httpStatus = HttpStatusCode.OK;
                isValid = true;
                return test1;
            }
            else
            {
                httpStatus = HttpStatusCode.BadRequest;
                return "[{\"error\" \"Usuario o contraseña no validas \"}]";
            }

        }
        public string createUser() {
            checkUser();
            if (isValid) {
                return "{\"Error\" \" El usuario ya se encuentra registado \"}";
            }
            else{
                ExecReader(commCreateUSer, paramList);
                isValid = true;
                return "{\"Create\" \"Usuario creado\"}";
            }
        }



        public void bindDataParameter()
        {
            paramList = new List<NpgsqlParameter>();
            paramList.Add(createPameter("newNombre", NpgsqlTypes.NpgsqlDbType.Varchar, Nombre, 100));
            paramList.Add(createPameter("newContrasena", NpgsqlTypes.NpgsqlDbType.Varchar, Contrasena, 100));

        }

        public void bindRolData() {
            paramList.Add(createPameter("newRol", NpgsqlTypes.NpgsqlDbType.Varchar, Rol, 100));
        }

    }
}