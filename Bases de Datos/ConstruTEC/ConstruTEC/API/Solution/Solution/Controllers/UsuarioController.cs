using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ConstruTEC.Models;
using System.Data.SqlClient;
using System.Data;
using Solution.Models;
using ConstruTEC.HttpHelper;


namespace ConstruTEC.Controllers
{   /**
     * Implementacion de controlador de Usuarios
     * @version 1.0
     * 25/10/2016
     **/
    [RoutePrefix("Usuario")]
    public class UsuarioController : HelperController
    { /**
        *Funcion get para el controlador del modelo Usuario
        *responde con la lista completa de usuarios disponibles
        * @params void
        * @return HttpResponseMessage que encasula la respuesta de tipo json proveniente de otra clases
       **/
        [HttpGet]
        public HttpResponseMessage Get()
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();

            using (Usuario tempUser = new Usuario())
            {
                /** 
                 * Se llama la funcion getAllUsers de manera que retorne las filas necesarias y se encapsula su respuesta en un HttpResponse
                 **/
                httpResponse.Content = new StringContent(tempUser.getAllUsers(), System.Text.Encoding.UTF8, "application/json");
            }
            return httpResponse;
        }

        [HttpPost]
        public HttpResponseMessage loginUser(Usuario newUsuario)
        {
            if (ModelState.IsValid && newUsuario!=null)
            {
                return newHttpResponse(newUsuario.checkUser(), newUsuario.httpStatus);
            }
            else
            {
                return newHttpResponse("{\"Error\" \"Porfavor revisar los datos proporcionados\"}", HttpStatusCode.BadRequest);
            }
        }



        [HttpPost]
        public HttpResponseMessage createUser(UsuarioPersona newUsuarioPersona)
        {
            if (ModelState.IsValid)
            {
                return newHttpResponse(newUsuarioPersona.createUsuarioPersona(), newUsuarioPersona.usuariopersonaHttpStatus);
            }
            else
            {
                return newHttpResponse(newUsuarioPersona.createUsuarioPersona(), newUsuarioPersona.usuariopersonaHttpStatus);
            }

        }

        [HttpPost]
        public IHttpActionResult Login([FromBody]Usuario user)
        {

            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Server=tcp:maad2.database.windows.net;Database=EPATEC;User ID =Bases3103;Password=Maad2016;Trusted_Connection=False;Encrypt=True;";
            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Select * from Usuario Where Nombre = '" + user.Nombre + "' and Contrasena='" + user.Contrasena + "'";
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
                return BadRequest();
            }
            bool exist = (reader.HasRows);
            myConnection.Close();
            if (exist)
            {
                return Ok();
            }
            else
            {
                return NotFound();
            }

        }




    }





}