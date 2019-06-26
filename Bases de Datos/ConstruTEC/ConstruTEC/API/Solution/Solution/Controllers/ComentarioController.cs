using System;
using System.Collections.Generic;
using ConstruTEC.Models;
using System.Data.SqlClient;
using System.Data;
using System.Web.Mvc;
using System.Web.Http;
using ConstruTEC.HttpHelper;

namespace ContruTec.Controllers
{
    [System.Web.Http.RoutePrefix("Comentario")]
    public class ComentarioController : HelperController
    {
        // GET api/Comentario
        [System.Web.Http.HttpGet]
        /**
         * Method to get all the Comentarios in a Json format list.
         * @returns a json with all the Rols
         **/
        public void Get()
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Select * from Comentario";
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
               // return Json("Null", JsonRequestBehavior.AllowGet);
            }
            List<Comentario> Comentarios = new List<Comentario>();
            while (reader.HasRows)
            {
                while (reader.Read())
                {
                    Comentario coment = new Comentario();
                    coment.ID = Convert.ToInt32(reader.GetValue(0));
                    coment.comentario = reader.GetValue(1).ToString();
                    Comentarios.Add(coment);
                }
            }
            myConnection.Close();
            // return Json(Comentarios, JsonRequestBehavior.AllowGet);
        }

        // GET api/Comentario/Get
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("Get")]
        /**
         * Method to get one of the Comentarios in Json format.
         * @param id and int with the identification number of the Comentario, is entered in the url.
         * @returns a json with the Comentario.
         **/
        public void Get([FromUri]int pId)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Select * from Comentario where ID = " + pId.ToString();
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
                myConnection.Close();
             //   return Json("Null", JsonRequestBehavior.AllowGet);
            }
            List<Comentario> Comentarios = new List<Comentario>();
            while (reader.HasRows)
            {
                while (reader.Read())
                {
                    Comentario coment = new Comentario();
                    coment.ID = Convert.ToInt32(reader.GetValue(0));
                    coment.comentario = reader.GetValue(1).ToString();
                    Comentarios.Add(coment);
                }
            }
            myConnection.Close();
          //  return Json(Comentarios, JsonRequestBehavior.AllowGet);
        }


        // POST api/Comentario/add
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("add")]
        /**
         * Method to add a new Comentario.
         * @param pComent a class with the new Comentario (it's casted from the Json formated body of the request).
         * @returns a confirmation code in the IHttpActionResult format.
         **/
        public IHttpActionResult Post([FromBody]Comentario pComent)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            String sql = "Insert into Comentario(ID, Comentario)" +
                "values (" + pComent.ID + ",'" + pComent.comentario + "');";
            System.Diagnostics.Debug.WriteLine(sql);
            sqlCmd.CommandText = sql;

            sqlCmd.Connection = myConnection;
            myConnection.Open();

            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
                myConnection.Close();
                return BadRequest();
            }
            myConnection.Close();
            return Ok();
        }

        // POST api/Comentario/update
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("update")]
        /**
         * Method to add a new Comentario.
         * @param pComent a class with the new Comentario (it's casted from the Json formated body of the request).
         * @returns a confirmation code in the IHttpActionResult format.
         **/
        public IHttpActionResult Put([FromBody]Comentario pComent)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            String sql = "Update Comentario set Comentario ='" + pComent.comentario + "' Where ID =" + pComent.ID + ";";
            System.Diagnostics.Debug.WriteLine(sql);
            sqlCmd.CommandText = sql;

            sqlCmd.Connection = myConnection;
            myConnection.Open();

            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
                myConnection.Close();
                return BadRequest();
            }
            myConnection.Close();
            return Ok();
        }


        // DELETE api/Comentario/Del
        [System.Web.Http.HttpDelete]
        [System.Web.Http.Route("Del")]
        /**
         * Method to delete a Comentario.
         * @param pId and int with the identification number of the Comentario, is entered in the url.
         * @returns a confirmation code in the IHttpActionResult format.
         **/
        public IHttpActionResult Delete([FromUri]int pId)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Delete from Comentario where ID = '" + pId+ "';";
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
                myConnection.Close();
                return BadRequest();
            }
            myConnection.Close();
            return Ok();
        }
    }
}