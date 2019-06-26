using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.HttpHelper;

namespace ConstruTEC.Controllers
{
    [RoutePrefix("Etapa")]
    public class EtapaController : HelperController
    {
        /**
        * Funcion que retorna todas las etapas template.
        *responde con la lista completa de etapas disponibles.
        * @params void
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases
        **/
        [HttpGet]
        public HttpResponseMessage Get()
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            using (Etapa tempEtapa = new Etapa())
            {
                httpResponse.Content = new StringContent(tempEtapa.getAllEtapas(), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que obtiene una Etapa a partir del ID.
         * @params pCod el codigo de la obra a recuperar.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpGet]
        public HttpResponseMessage Get([FromUri]int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Etapa tempEtapa = new Etapa())
            {
                httpResponse.Content = new StringContent(tempEtapa.getByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
        * Metodo que elimina una etapa a partir del ID.
        * @params pID el ID de la etapa a eliminar.
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
        **/
        [HttpDelete]
        public HttpResponseMessage Delete([FromUri] int pCod)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Etapa tempEtapa = new Etapa())
            {
                httpResponse.Content = new StringContent(tempEtapa.deleteByID(pCod), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que agrega una Etapa.
         * @params pObra es la Etapa a agregar a la base de datos.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpPost]
        public HttpResponseMessage Create([FromBody]Etapa pEtapa)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage httpResponse = new HttpResponseMessage();
                httpResponse.Content = new StringContent(pEtapa.createEtapa(), System.Text.Encoding.UTF8, "application/json");
                return httpResponse;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Por favor revisar los datos proporcionados.");
            }
        }

    }
}