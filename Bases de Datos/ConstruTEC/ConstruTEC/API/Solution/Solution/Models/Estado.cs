using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web;

namespace ConstruTEC.Models
{
    public class Estado : SQLExecutable
    {
        string commAllEstado = "getAllEstado";
        string commGetEstado = "getEstado";
        string commDelete = "deleteEstado";
        string commCreateEstado = "createEstado";
        public HttpStatusCode estadoHttpStatus { get; set; }
        [Required]
        public int ID { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string Descripcion { get; set; }

        /**
       * Metodo que ejecuta la funcion con el nombre de la variable commCreateEstado y agrega una estado
       * @params void
       * @return string con formato json que genera el SQLExecutable
       * **/
        public string createEstado()
        {
            this.bindDataParameter();
            if (ExecReader(commCreateEstado, paramList).Contains("OK"))
            {
                estadoHttpStatus = HttpStatusCode.OK;
                return "{\"Create\" \"OK\"}";
            }
            else
            {
                estadoHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"Los datos ingresados no son validos. \"}";
            }
        }

        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commAllEstado y retorna todos los estados
        * @params void
        * @return string con formato json que genera el SQLExecutable
        **/
        public string getAllEstados()
        {
            return ExecReader(commAllEstado);
        }

        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commGetEstado y retorna un estado.
        * @params pID el ID del estado
        * @return string con formato json que genera el SQLExecutable.
        * **/
        public string getByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            paramList.Add(newParam);
            return ExecReader(commGetEstado, paramList);
        }

        /**
        *Metodo que elimina el estado al que corresponda el ID ingresado.
        * @params pCod el ID del estado.
        * @return string con formato json que genera el SQLExecutable.
        **/
        public string deleteByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            if (ExecReader(commDelete, paramList).Contains("OK"))
            {
                estadoHttpStatus = HttpStatusCode.OK;
                return "{\"Delete\" \"OK\"}";
            }
            else
            {
                estadoHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"El estado no existe. \"}";
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
            paramList.Add(createPameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, ID, 0));
            paramList.Add(createPameter("State", NpgsqlTypes.NpgsqlDbType.Varchar, State , 20));
            paramList.Add(createPameter("Descripcion", NpgsqlTypes.NpgsqlDbType.Varchar, Descripcion, 100));

        }

    }
}