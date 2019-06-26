using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.HttpHelper;


namespace ConstruTEC.Controllers 
{
    [RoutePrefix("Obra/Etapa")]
    public class Etapas_ObraController : HelperController
    {
        /**
          * Metodo que agrega un registro Etapa_Obra.
          * @params pEO es el registro Etapa_Obra a agregar a la base de datos.
          * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
          **/
        [HttpPost]
        public HttpResponseMessage Create([FromBody]Etapas_Obra pEO)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage httpResponse = new HttpResponseMessage();
                httpResponse.Content = new StringContent(pEO.createEtapaObra(), System.Text.Encoding.UTF8, "application/json");
                return httpResponse;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Por favor revisar los datos proporcionados.");
            }
        }

        /**
        *Funcion get para el controlador del modelo etapas_obra
        *responde con la lista completa de etapas_obra disponibles.
        * @params void
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases
        **/
        [HttpGet]
        public HttpResponseMessage Get()
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            using (Etapas_Obra tempEO = new Etapas_Obra())
            {
                httpResponse.Content = new StringContent(tempEO.getAllEtapasObras(), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que obtiene un registro etapas_obra a partir del ID.
         * @params pID el identificador del registro etapas_obra a recuperar.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpGet]
        public HttpResponseMessage Get([FromUri]int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Etapas_Obra tempEO = new Etapas_Obra())
            {
                httpResponse.Content = new StringContent(tempEO.getByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que obtiene un registro etapas_obra a partir del codigo de obra.
         * @params pCod el codigo de la obra del registro etapas_obra a recuperar.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpGet]
        [Route("byObra")]
        public HttpResponseMessage Get([FromUri]int pCod, int otro=0)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Etapas_Obra tempEO = new Etapas_Obra())
            {
                httpResponse.Content = new StringContent(tempEO.getByObra(pCod), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
        * Metodo que elimina un registro etapas_obra a partir del ID.
        * @params pID el ID del registro etapas_obra a eliminar.
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
        **/
        [HttpDelete]
        public HttpResponseMessage Delete([FromUri] int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Etapas_Obra tempEO = new Etapas_Obra())
            {
                httpResponse.Content = new StringContent(tempEO.deleteByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }


    }
}