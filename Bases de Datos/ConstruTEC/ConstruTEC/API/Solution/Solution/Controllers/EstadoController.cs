using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.Controllers;
using ConstruTEC.HttpHelper;


namespace ConstruTEC.Controllers
{
    [RoutePrefix("Estado")]
    public class EstadoController : HelperController
    {
        /**
          * Metodo que agrega un estado.
          * @params pEstado es el estado a agregar a la base de datos.
          * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
          **/
        [HttpPost]
        public HttpResponseMessage Create([FromBody]Estado pEstado)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage httpResponse = new HttpResponseMessage();
                httpResponse.Content = new StringContent(pEstado.createEstado(), System.Text.Encoding.UTF8, "application/json");
                return httpResponse;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Por favor revisar los datos proporcionados.");
            }
        }
        /**
        *Funcion get para el controlador del modelo estado
        *responde con la lista completa de estados disponibles.
        * @params void
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases
        **/
        [HttpGet]
        public HttpResponseMessage Get()
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            using (Estado tempEstado = new Estado())
            {
                httpResponse.Content = new StringContent(tempEstado.getAllEstados(), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que obtiene un Estado a partir del ID.
         * @params pCod el codigo del estado a recuperar.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpGet]
        public HttpResponseMessage Get([FromUri]int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Estado tempEstado = new Estado())
            {
                httpResponse.Content = new StringContent(tempEstado.getByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
        * Metodo que elimina un estado a partir del ID.
        * @params pID el ID del estado a eliminar.
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
        **/
        [HttpDelete]
        public HttpResponseMessage Delete([FromUri] int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Estado tempEstado = new Estado())
            {
                httpResponse.Content = new StringContent(tempEstado.deleteByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }
    }
}