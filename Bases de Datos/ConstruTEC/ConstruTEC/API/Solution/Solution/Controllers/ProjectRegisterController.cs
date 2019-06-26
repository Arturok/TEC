using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.Controllers;
using ConstruTEC.HttpHelper;

namespace ConstruTEC.Controllers
{

    [RoutePrefix("ProjectRegister")]
    public class ProjectRegisterController : HelperController
    {
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