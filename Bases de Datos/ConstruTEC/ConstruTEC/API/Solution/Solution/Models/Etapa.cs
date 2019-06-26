using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web;


namespace ConstruTEC.Models
{
    public class Etapa : SQLExecutable
    {
        string commAllEtapa = "getAllEtapa";
        string commGetEtapa = "getEtapa";
        string commDelete = "deleteEtapa";
        string commCreateEtapa = "createEtapa";
        public HttpStatusCode etapaHttpStatus { get; set; }
        [Required]
        public int ID { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Descripcion { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        public int Costo { get; set; }
        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commAllEtapa y retorna todas las etapas
        * @params void
        * @return string con formato json que genera el SQLExecutable
        **/
        public string getAllEtapas()
        {
            return ExecReader(commAllEtapa);
        }

        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commGetEtapa y retorna una etapa.
        * @params pID el ID de la etapa
        * @return string con formato json que genera el SQLExecutable.
        * **/
        public string getByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            paramList.Add(newParam);
            return ExecReader(commGetEtapa, paramList);
        }

        /**
         *Metodo que elimina la etapa a la que corresponda el ID ingresado.
         * @params pCod el ID de la etapa.
         * @return string con formato json que genera el SQLExecutable.
         **/
        public string deleteByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            if (ExecReader(commDelete, paramList).Contains("OK"))
            {
                etapaHttpStatus = HttpStatusCode.OK;
                return "{\"Delete\" \"OK\"}";
            }
            else
            {
                etapaHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"La etapa no existe. \"}";
            }
        }

        /**
       * Metodo que ejecuta la funcion con el nombre de la variable commCreateEtapa y agrega una etapa
       * @params void
       * @return string con formato json que genera el SQLExecutable
       * **/
        public string createEtapa()
        {
            this.bindDataParameter();
            if (ExecReader(commCreateEtapa, paramList).Contains("OK"))
            {
                etapaHttpStatus = HttpStatusCode.OK;
                return "{\"Create\" \"OK\"}";
            }
            else
            {
                etapaHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"Los datos ingresados no son validos. \"}";
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
            paramList.Add(createPameter("Nombre", NpgsqlTypes.NpgsqlDbType.Varchar, Nombre, 20));
            paramList.Add(createPameter("Descripcion", NpgsqlTypes.NpgsqlDbType.Varchar, Descripcion, 100));
            paramList.Add(createPameter("Costo", NpgsqlTypes.NpgsqlDbType.Integer, Costo, 0));
            
        }
    }
}