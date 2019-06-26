using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ConstruTEC.Models
{
    public class Rol_Usuario : SQLExecutable
    {
        string commAgregarRolUsuario = "";
        string commBorrarRolUsuario = "";
        string commCheckRolUsuario = "";
        string commGetRolUsuario = "";

        //  public int ID { get; set; }
        [Required]
        public Rol tempRol { get; set; }
        [Required]
        public Usuario tempUsuario { get; set; }

        public string agregarRolUsuario()
        {
            tempUsuario.checkUser();
            tempRol.checkRol();
            if (tempUsuario.isValid && tempRol.isValid)
            {
                bindDataParameter();
                ExecReader(commAgregarRolUsuario, paramList);
                httpStatus = System.Net.HttpStatusCode.OK;
                return "{\"Create\" \"Rol asignado al usuario\"}";
            }
            else
            {
                httpStatus= System.Net.HttpStatusCode.BadRequest;
                return "{\"Error\" \"Datos proporcionados no validos, no se pudo agregar el RolUsuario\"}";
            }
        }

        public string getRolUsuario(Usuario newUsuario) {
            newUsuario.checkUser();

            if (newUsuario.isValid)
            {
                paramList.Add(createPameter("Nombre", NpgsqlTypes.NpgsqlDbType.Varchar, newUsuario.Nombre, 100));
                return ExecReader(commGetRolUsuario,paramList);
            }
            return "{\"Error\" \"Usuario no valido\"}";

        }
        public string borrarRolUsuario()
        {
            tempUsuario.checkUser();
            tempRol.checkRol();
            if (tempUsuario.isValid && tempRol.isValid)
            {
                if (checkRolUsuario().Contains("OK")) { }
                bindDataParameter();
                ExecReader(commBorrarRolUsuario, paramList);
                httpStatus = System.Net.HttpStatusCode.OK;
                return "{\"Delete\" \"Rol eliminado del usuario\"}";
            }
            httpStatus = System.Net.HttpStatusCode.BadRequest;
            return "{\"Error\" \"Datos del RolUsuario proporcionados no validos, no se pudo eliminar\"}";
        }
        public string checkRolUsuario()
        {
            tempUsuario.checkUser();
            tempRol.checkRol();

            if (tempUsuario.isValid && tempRol.isValid)
            {
                if (ExecReader(commCheckRolUsuario, paramList).Contains("OK"))
                {
                    httpStatus = System.Net.HttpStatusCode.OK;

                    return "{\"Check\" \"OK\"}";
                }
            }
            httpStatus = System.Net.HttpStatusCode.BadRequest;

            return "{\"Error\" \"Datos del RolUsuario proporcionados no validos, no existe tal RolUsuario\"}";

        }
        public void bindDataParameter()
        {
            paramList = new List<NpgsqlParameter>();
            paramList.Add(createPameter("ROL", NpgsqlTypes.NpgsqlDbType.Varchar, tempRol.ROL, 100));
            paramList.Add(createPameter("Nombre", NpgsqlTypes.NpgsqlDbType.Varchar, tempUsuario.Nombre, 100));

        }
    }
}