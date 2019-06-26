using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using ConstruTEC.Controllers;
using ConstruTEC.HttpHelper;

namespace Solution.Controllers
{
    public class LoginController : HelperController
    {

        // POST: api/Login
        public HttpResponseMessage Post(Usuario newUsuario)
        {
            newUsuario.checkUser();

            if (ModelState.IsValid && newUsuario != null)
            {
                return newHttpResponse(newUsuario.checkUser(), newUsuario.httpStatus);
            }
            else
            {
                return newHttpResponse("{\"Error\" \"Porfavor revisar los datos proporcionados\"}", HttpStatusCode.BadRequest);
            }

        }


    }
}
