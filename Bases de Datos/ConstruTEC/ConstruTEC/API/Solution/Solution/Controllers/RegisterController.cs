using ConstruTEC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.HttpHelper;

namespace Solution.Controllers
{
    public class RegisterController : HelperController
    {
        // POST: api/Register
        public HttpResponseMessage Post(UsuarioPersona newUsuario)
        {
            if (ModelState.IsValid && newUsuario != null)
            {
                if (newUsuario.usuario.Rol != null)
                {
                    return newHttpResponse(newUsuario.createUsuarioPersona(), newUsuario.httpStatus);
                }
                else
                {
                    return newHttpResponse("{\"Error\" \"Porfavor revisar el rol de usuario\"}", HttpStatusCode.BadRequest);

                }
            }
            else
            {
                return newHttpResponse("{\"Error\" \"Porfavor revisar los datos proporcionados\"}", HttpStatusCode.BadRequest);
            }
        }

    }
}
