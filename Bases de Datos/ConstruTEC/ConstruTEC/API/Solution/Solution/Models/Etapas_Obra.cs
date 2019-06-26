using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web;

namespace ConstruTEC.Models
{
    public class Etapas_Obra : SQLExecutable
    {
        string commAllEO = "getAllEO";
        string commGetEO = "getEO";
        string commGetEOD = "getEOD";
        string commDelete = "deleteEO";
        string commCreateEO = "createEO";
        public HttpStatusCode EOHttpStatus { get; set; }
        [Required]
        public int ID { get; set; }
        [Required]
        public int CodObra { get; set; }
        [Required]
        public int IDEtapa { get; set; }
        [Required]
        public int IDEstado { get; set; }
        [Required]
        public int Costo { get; set; }
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime Inicio { get; set; }
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime Fin { get; set; }
        /**
       * Metodo que ejecuta la funcion con el nombre de la variable commCreateEO y agrega una Etapa_Obra
       * @params void
       * @return string con formato json que genera el SQLExecutable
       * **/
        public string createEtapaObra()
        {
            this.bindDataParameter();
            if (ExecReader(commCreateEO, paramList).Contains("OK"))
            {
                EOHttpStatus = HttpStatusCode.OK;
                return "{\"Create\" \"OK\"}";
            }
            else
            {
                EOHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"Los datos ingresados no son validos. \"}";
            }
        }

        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commAllEO y retorna todos los registros Etapa_Obra
        * @params void
        * @return string con formato json que genera el SQLExecutable
        **/
        public string getAllEtapasObras()
        {
            return ExecReader(commAllEO);
        }


        /**
        * Metodo que ejecuta la funcion con el nombre de la variable commGetEstado y retorna un registro etapas_obra.
        * @params pCod el codigo de la obra
        * @return string con formato json que genera el SQLExecutable.
        * **/
        public string getByObra(int pCod)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("CodObra", NpgsqlTypes.NpgsqlDbType.Integer, pCod);
            paramList.Add(newParam);
            return ExecReader(commGetEOD, paramList);
        }

        /**
       * Metodo que ejecuta la funcion con el nombre de la variable commGetEstado y retorna un registro etapas_obra.
       * @params pID el ID del registro etapas_obra.
       * @return string con formato json que genera el SQLExecutable.
       * **/
        public string getByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            paramList.Add(newParam);
            return ExecReader(commGetEO, paramList);
        }

        /**
        *Metodo que elimina el registro etapas_obra al que corresponda el ID ingresado.
        * @params pCod el ID del registro etapas_obra.
        * @return string con formato json que genera el SQLExecutable.
        **/
        public string deleteByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("Codigo", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            if (ExecReader(commDelete, paramList).Contains("OK"))
            {
                EOHttpStatus = HttpStatusCode.OK;
                return "{\"Delete\" \"OK\"}";
            }
            else
            {
                EOHttpStatus = HttpStatusCode.BadRequest;
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
            paramList.Add(createPameter("CodObra", NpgsqlTypes.NpgsqlDbType.Integer, CodObra, 0));
            paramList.Add(createPameter("IDEtapa", NpgsqlTypes.NpgsqlDbType.Varchar, IDEtapa, 0));
            paramList.Add(createPameter("IDEstado", NpgsqlTypes.NpgsqlDbType.Integer, IDEstado, 0));
            paramList.Add(createPameter("Costo", NpgsqlTypes.NpgsqlDbType.Integer, Costo, 0));
            paramList.Add(createPameter("Inicio", NpgsqlTypes.NpgsqlDbType.Date, Inicio, 0));
            paramList.Add(createPameter("Fin", NpgsqlTypes.NpgsqlDbType.Date, Fin, 0));
        }
    }
}