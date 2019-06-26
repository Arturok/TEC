
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.HttpHelper;


namespace ConstruTEC.Controllers
{
    [RoutePrefix("Obra")]
    public class ObraController : HelperController
    {/**
        *Funcion get para el controlador del modelo obra
        *responde con la lista completa de obras disponibles
        * @params void
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases
       **/
       [HttpGet]
        public HttpResponseMessage Get([FromUri]string pUse)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            using (Obra tempObra = new Obra())
            {
                httpResponse.Content = new StringContent(tempObra.getAllObras(pUse), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }
        /**
         * Metodo que obtiene una obra a partir del codigo.
         * @params pCod el codigo de la obra a recuperar.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpGet]
        public HttpResponseMessage Get([FromUri]int pCod)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Obra tempObra = new Obra())
            {
                httpResponse.Content = new StringContent(tempObra.getByID(pCod), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que elimina una obra a partir del codigo.
         * @params pCod el codigo de la obra a eliminar.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpDelete]
        public HttpResponseMessage Delete([FromUri] int pCod)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Obra tempObra = new Obra())
            {
                httpResponse.Content = new StringContent(tempObra.deleteByID(pCod), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
         * Metodo que agrega una obra.
         * @params pObra es la obra a agregar a la base de datos.
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
         **/
        [HttpPost]
        public HttpResponseMessage Create([FromBody]Obra pObra)
        {
            if (ModelState.IsValid)
            {
                HttpResponseMessage httpResponse = new HttpResponseMessage();
                httpResponse.Content = new StringContent(pObra.createObra(), System.Text.Encoding.UTF8, "application/json");
                return httpResponse;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Por favor revisar los datos proporcionados.");
            }
        }
    }
}