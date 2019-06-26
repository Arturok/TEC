using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web;

namespace ConstruTEC.Models
{/**
       *Clase que modela una obra de la aplicacion y hereda de SQLExecutable
       * define en nombre de los procedimientos almacenados 
       * las variables "comm" definen el nombre del procedimiento almacenado que se desea ejecutar
       * @version 1.0
       * 25/10/2016 
        **/
    public class Obra : SQLExecutable
    {
        string commAllObras = "getAllObras";
        string commGetObra = "getObra";
        string commDelete = "deleteObra";
        string commCreateObra = "createObra";
        [Required]
        public int Codigo { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Direccion { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        public int Costo { get; set; }
        public HttpStatusCode obraHttpStatus { get; set; }

        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commAllObras y retorna todos los obras de un usuario
        * @params pNomb el nombre de usuario
        * @return string con formato json que genera el SQLExecutable
        * **/
        public string getAllObras(string pNomb)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("Nombre", NpgsqlTypes.NpgsqlDbType.Varchar, 20);
            newParam.Value = pNomb;
            paramList.Add(newParam);
            return ExecReader("obraporusuario", paramList);
        }

        /**
       * Metodo que ejecuta la funcion con el nombre de la variable commCreateObra y agrega una obra
       * @params void
       * @return string con formato json que genera el SQLExecutable
       * **/
        public string createObra()
        {
            this.bindDataParameter();
            if (ExecReader(commCreateObra, paramList).Contains("OK"))
            {
                obraHttpStatus = HttpStatusCode.OK;
                return "{\"Create\" \"OK\"}";
            }
            else
            {
                obraHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"Los datos ingresados no son validos. \"}";
            }
        }

        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commGetObra y retorna una obra.
        * @params pCod el codigo de la obra
        * @return string con formato json que genera el SQLExecutable.
        * **/
        public string getByID(int pCod)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("Codigo", NpgsqlTypes.NpgsqlDbType.Integer, pCod);
            paramList.Add(newParam);
            return ExecReader(commGetObra, paramList);
        }

        /**
         *Metodo que elimina la obra a la que corresponda el codigo ingresado.
         * @params pCod el codigo de la obra
         * @return string con formato json que genera el SQLExecutable.
         **/
        public string deleteByID(int pCod)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("Codigo", NpgsqlTypes.NpgsqlDbType.Integer, pCod);
            if (ExecReader(commDelete, paramList).Contains("OK"))
            {
                obraHttpStatus = HttpStatusCode.OK;
                return "{\"Delete\" \"OK\"}";
            }
            else
            {
                obraHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"La obra no existe. \"}";
            } 
        }


        /**
         * Metodo que une los parametros de la funcion
         * @params void
         * @return void
         **/
        public void bindDataParameter()
        {
            paramList = new List<NpgsqlParameter>();
            paramList.Add(createPameter("Codigo", NpgsqlTypes.NpgsqlDbType.Integer, Codigo, 0));
            paramList.Add(createPameter("Nombre", NpgsqlTypes.NpgsqlDbType.Varchar, Nombre, 100));
            paramList.Add(createPameter("Direccion", NpgsqlTypes.NpgsqlDbType.Varchar, Direccion, 100));
            paramList.Add(createPameter("Costo", NpgsqlTypes.NpgsqlDbType.Integer, Costo, 0));
        }
    }
}