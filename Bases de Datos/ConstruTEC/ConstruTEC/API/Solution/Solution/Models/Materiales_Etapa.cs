using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Web;
using System.Net.Http;

namespace ConstruTEC.Models
{
    public class Materiales_Etapa : SQLExecutable
    {
        string commAllMaterialE = "getAlMaterial_Etapa";
        string commGetMaterialE = "getMaterial_Etapa";
        string commDelete = "deleteMaterial_Etapa";
        string commCreateMaterialE = "createMaterial_Etapa";
        List<NpgsqlParameter> paramList;
        public HttpStatusCode estadoHttpStatus { get; set; }
        [Required]
        public int ID { get; set; }
        [Required]
        public int IDEtapaObra { get; set; }
        [Required]
        public int IDMaterial { get; set; }
        [Required]
        public int Cantidad { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        public int PrecioActual { get; set; }
        /**
          * Metodo que ejecuta la funcion con el nombre de la variable commAllMaterialE y agrega una estado
          * @params void
          * @return string con formato json que genera el SQLExecutable
          **/
        public string createMaterialEt()
        {
            this.bindDataParameter();
            if (ExecReader(commAllMaterialE, paramList).Contains("OK"))
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
           * Metodo que ejecuta la funcion con el nombre de la variable commAllMaterialE y retorna todos los registros Materiales_Etapa.
           * @params void
           * @return string con formato json que genera el SQLExecutable.
           **/
        public string getAllMaterialesEtapa()
        {
            return ExecReader(commAllMaterialE);
        }

        /**
          * Metodo que ejecuta la funcion con el nombre de la variable commGetMaterialE y retorna un registro Materiales_Etapa.
          * @params pID el ID del registro Materiales_Etapa.
          * @return string con formato json que genera el SQLExecutable.
          * **/
        public string getByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            paramList.Add(newParam);
            return ExecReader(commGetMaterialE, paramList);
        }

        /**
          * Metodo que hace el pedido a la otra api.
          * @params void.
          * @return void.
          * **/
        public void pedido()
        {
        /*   HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("http://localhostt:59401/");
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.PostAsync("api/Pedido", ).Result;
            if (response.IsSuccessStatusCode)
            {
                estadoHttpStatus = HttpStatusCode.OK;
                return "{\"Delete\" \"OK\"}";   
            }
            else
            {
                estadoHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"No se pudo comunicar con la Api Epatec. \"}";
            }*/
        }
        


        /**
        * Metodo que elimina el registro Material_Etapa al que corresponda el ID ingresado.
        * @params pCod el ID del registro Material_Etapa.
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
                return "{\"Error\" \"El registro Material_Etapa no existe. \"}";
            }
        }

        /**
         * Metodo que une los parametros de la funcion.
         * @params void
         * @return void
         **/
        public void bindDataParameter()
        {
            paramList = new List<NpgsqlParameter>();
            paramList.Add(createPameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, ID, 0));
            paramList.Add(createPameter("IDEtapaObra", NpgsqlTypes.NpgsqlDbType.Integer, IDEtapaObra, 0));
            paramList.Add(createPameter("IDMaterial", NpgsqlTypes.NpgsqlDbType.Integer, IDMaterial, 0));
            paramList.Add(createPameter("Cantidad", NpgsqlTypes.NpgsqlDbType.Integer, Cantidad, 0));
            paramList.Add(createPameter("PrecioActual", NpgsqlTypes.NpgsqlDbType.Integer, PrecioActual, 0));
        }
    }
}