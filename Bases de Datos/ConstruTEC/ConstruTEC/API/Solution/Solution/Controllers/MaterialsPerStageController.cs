using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.Controllers;
using ConstruTEC.HttpHelper;

namespace ConstruTEC.Controllers
{
    [RoutePrefix("MaterialsPerStage")]
    public class MaterialsPerStageController : HelperController
    {
        /**
         *Funcion get para el controlador del modelo Material.
         *responde con la lista completa de Materiales disponibles.
         * @params void
         * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases
         **/
        [HttpGet]
        public HttpResponseMessage Get()
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            using (Material tempMaterial = new Material())
            {
                httpResponse.Content = new StringContent(tempMaterial.getAllMateriales(), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
        * Metodo que obtiene un Material por etapa a partir del ID de etapa obra.
        * @params pID el idenfiticador del Material a recuperar.
        * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
        **/
        [HttpGet]
        public HttpResponseMessage Get([FromUri]int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Materiales_Etapa tempMaterial = new Materiales_Etapa())
            {
                httpResponse.Content = new StringContent(tempMaterial.getByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        /**
       * Metodo que elimina un Material a partir del ID.
       * @params pID el ID del Material a eliminar.
       * @return HttpResponseMessage que encapsula la respuesta de tipo json proveniente de otra clases.
       **/
        [HttpDelete]
        public HttpResponseMessage Delete([FromUri] int pID)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            using (Materiales_Etapa tempMaterial = new Materiales_Etapa())
            {
                httpResponse.Content = new StringContent(tempMaterial.deleteByID(pID), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }
    }
}