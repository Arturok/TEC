using System;
using System.Collections.Generic;
using ConstruTEC.Models;
using System.Data.SqlClient;
using System.Data;
using System.Web.Mvc;
using System.Web.Http;
using ConstruTEC.HttpHelper;


namespace ConstruTEC.Controllers
{
    [System.Web.Http.RoutePrefix("Rol")]
    public class RolController : HelperController
    {
        // GET api/Rol
        [System.Web.Http.HttpGet]
        /**
         * Method to get all the Rols in a Json format list.
         * @returns a json with all the Rols
         **/
        public void Get()
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Select * from Rol";
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
            List<Rol> Roles = new List<Rol>();
            while (reader.HasRows)
            {
                while (reader.Read())
                {
                    Rol rol = new Rol();
                    rol.ID = Convert.ToInt32(reader.GetValue(0));
                    rol.ROL = reader.GetValue(1).ToString();
                    rol.Descripcion = reader.GetValue(2).ToString();
                    Roles.Add(rol);
                }
            }
            myConnection.Close();
           // return Json(Roles, JsonRequestBehavior.AllowGet);
        }

        // GET api/Rol/Get
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("Get")]
        /**
         * Method to get one of the Rols in Json format.
         * @param id and int with the identification number of the rol, is entered in the url.
         * @returns a json with the Rol.
         **/
        public void Get([FromUri]int pId)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Select * from Rol where ID = " + pId.ToString();
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            try
            {
                reader = sqlCmd.ExecuteReader();
            }
            catch
            {
                myConnection.Close();
          //      return Json("Null", JsonRequestBehavior.AllowGet);
            }
            List<Rol> Roles = new List<Rol>();
            while (reader.HasRows)
            {
                while (reader.Read())
                {
                    Rol rol = new Rol();
                    rol.ID = Convert.ToInt32(reader.GetValue(0));
                    rol.ROL = reader.GetValue(1).ToString();
                    rol.Descripcion = reader.GetValue(2).ToString();
                    Roles.Add(rol);
                }
            }
            myConnection.Close();
          //  return Json(Roles, JsonRequestBehavior.AllowGet);
        }


        // POST api/Rol/add
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("add")]
        /**
         * Method to add a new Rol.
         * @param pRol a class with the new rol (it's casted from the Json formated body of the request).
         * @returns a confirmation code in the IHttpActionResult format.
         **/
        public IHttpActionResult Post([FromBody]Rol pRol)
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
            String sql = "Insert into Rol(ID, ROL, Descripcion)" +
                "values (" + pRol.ID + ",'" + pRol.ROL + "','" + pRol.Descripcion + "');" ;
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

        // POST api/Rol/update
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("update")]
        /**
         * Method to update a Rol.
         * @param pRol a class with the new rol (it's casted from the Json formated body of the request).
         * @returns a confirmation code in the IHttpActionResult format.
         **/
        public IHttpActionResult Put([FromBody]Rol pRol)
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
            String sql = "Update Rol set ROL ='"+ pRol.ROL+" ,Descripcion ='"+pRol.Descripcion+"' Where ID ="+ pRol.ID +";";
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


        // DELETE api/Rol/Del
        [System.Web.Http.HttpDelete]
        [System.Web.Http.Route("Del")]
        /**
         * Method to delete a  Rol.
         * @param pId and int with the identification number of the rol, is entered in the url.
         * @returns a confirmation code in the IHttpActionResult format.
         **/
        public IHttpActionResult Delete([FromUri]int pId)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = "Driver ={ PostgreSQL UNICODE}; Server = 127.0.0.1; Port = 5432; Database = dbname; Uid = name; Pwd = password; ";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "Delete from Rol where ID = '" +pId + "';";
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
 