using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.HttpHelper;


namespace Solution.Controllers
{
    public class RolUsuarioController : HelperController
    {

        // POST: api/RolUsuario
        [HttpPost]
        public string addRolUsuario(Rol_Usuario newRolUsuario)
        {
            if (ModelState.IsValid && newRolUsuario!=null)
            {
                return  newRolUsuario.agregarRolUsuario();
            }
            else {
                return newRolUsuario.agregarRolUsuario();
            }
        }

        // PUT: api/RolUsuario/5
        public HttpResponseMessage getRolUsuario(Usuario newUsuario)
        {
            if (ModelState.IsValid && newUsuario != null)
            {
                Rol_Usuario tempRolUser = new Rol_Usuario();                
                return newHttpResponse(tempRolUser.getRolUsuario(newUsuario), HttpStatusCode.OK);
            }
            else
            {
                return newHttpResponse("{\"Error\" \"Porfavor revisar los datos proporcionados\"}", HttpStatusCode.BadRequest);
            }
        }

        // DELETE: api/RolUsuario/5
        public void quitarRolUsuario(int id)
        {
        }
    }
}
