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
    public class Material : SQLExecutable
    {
        string commAllMaterial = "getAlMaterial";
        string commGetMaterial = "getMaterial";
        string commDelete = "deleteMaterial";
        string commCreateMaterial = "createMaterial";
        List<NpgsqlParameter> paramList;
        public HttpStatusCode estadoHttpStatus { get; set; }
        [Required]
        public int ID { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public int Precio { get; set; }
        /**
           * Metodo que ejecuta la funcion con el nombre de la variable commAllMaterial y agrega una Naterial.
           * @params void
           * @return string con formato json que genera el SQLExecutable
           * **/
        private string createMaterial()
        {
            this.bindDataParameter();
            if (ExecReader(commCreateMaterial, paramList).Contains("OK"))
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
         * Metodo para obtener los materiales de la api Epatec.
         * @params NONE
         * @return void
         **/
        public bool retrieve() {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("http://localhostt:59401/");
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("api/Producto").Result;
            if (response.IsSuccessStatusCode)
            {
                var materiales = response.Content.ReadAsAsync<IEnumerable<Material>>().Result;
                foreach (var material in materiales)
                {
                    material.bindDataParameter();
                    material.createMaterial();
                }
                return true;
            }
            else
            {
                return false;
            }
        }


        /**
           * Metodo que ejecuta la funcion con el nombre de la variable commAllMaterial y retorna todos los Materiales.
           * @params void
           * @return string con formato json que genera el SQLExecutable.
           **/
        public string getAllMateriales()
        {
            if (retrieve())
            {
                return ExecReader(commAllMaterial);
            }
            else
            {
                estadoHttpStatus = HttpStatusCode.BadRequest;
                return "{\"Error\" \"Error al conectarse a la api Epatec. \"}";
            }
        }

        /**
       * Metodo que ejecuta la funcion con el nombre de la variable commGetMaterial y retorna un Material.
       * @params pID el ID del Material
       * @return string con formato json que genera el SQLExecutable.
       * **/
        public string getByID(int pID)
        {
            paramList = new List<NpgsqlParameter>();
            NpgsqlParameter newParam = new NpgsqlParameter("ID", NpgsqlTypes.NpgsqlDbType.Integer, pID);
            paramList.Add(newParam);
            return ExecReader(commGetMaterial, paramList);
        }

        /**
        *Metodo que elimina el Material al que corresponda el ID ingresado.
        * @params pCod el ID del Material.
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
                return "{\"Error\" \"El Material no existe. \"}";
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
            paramList.Add(createPameter("Precio", NpgsqlTypes.NpgsqlDbType.Integer, Precio, 0));
        }
    }
}