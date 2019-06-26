using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.IO;
using Newtonsoft.Json;
using ConstruTEC.Controllers;
using System.Net;

namespace ConstruTEC.Models
{ /**
     * Clase padre que permite la interaccion de los modelos con la base de datos Postgres
     * Utiliza como dependencia el Nutget Npgsql 2.2.7 (NO  COMPATIBLE CON LA VERSION 3.+)
     * @version 1.0
     * 25/10/2016
     **/
    public class SQLExecutable :   IDisposable
        
    {
        public List<NpgsqlParameter> paramList { get; set; }
        public HttpStatusCode httpStatus { get; set; }

        private string resultado = "";
        /**
         * funcion principal de ejecucion que recibe el nombre del procedimiento almacenado por recibir asi como sus parametros en caso de ser necesarios
         * @param string newStringCommand corresponde al nombre del procedimiento almacenado
         * @param List<NpgsqlParameter> paramList Lista de parametros OPCIONAL para la ejecucion del PA
         * @return string Retorna un set de informacion unico que es la respuesta del la funcion Postgres
         * **/
        protected string ExecReader(string newStringCommand, List<NpgsqlParameter> paramList = null)
        {
            try
            {/**
              * Apertura de la conexion utilizando el ConnectionString de Web.config
              **/
                NpgsqlConnection conn = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ConstruTEC-DB"].ConnectionString);
                conn.Open();
                NpgsqlTransaction newTransac = conn.BeginTransaction();
                NpgsqlCommand command = new NpgsqlCommand(newStringCommand, conn);
                command.CommandType = CommandType.StoredProcedure;
            /**
             * Se llama a la funcion que mapea la lista de parametros y la agrega al commando a ejecutar
             **/
                addParameters(ref command, ref paramList);
                NpgsqlDataReader readerResult = command.ExecuteReader();
            /**
             * Se llama a la funcion ReaderToString que lee la informacion resultante del procedimiento y lo ordena en un json
             **/
                resultado = readerToJson(ref readerResult);
                newTransac.Commit();
                conn.Close();
                return resultado;
            }
            catch
            {
                return resultado;
            }
        }/**
          *Funcion de mapeo para los parametros de los procedimientos almacenados
          * @param ref newCommand refencia al comando que se se va a ejecutar
          * @param ref newParams referencia a la lista y los parametros que se desean agregar
          **/
        protected void addParameters(ref NpgsqlCommand newCommand, ref List<NpgsqlParameter> newParams)
        {
            if (newParams != null)
            {
                for (int i = 0; i < newParams.Count; i++)
                {
                    newCommand.Parameters.Add(newParams[i]);
                }
            }
        }
        /***
         * Creado para leer los datos que vienen de la respuesta del procedimiento almacenado y los transforma en una lista de objetos json segun el nombre de las columnas
         * @param ref newReader Reader de npgsql que contiene la respuesta del procedimiento almacenado 
         * @return string con la respuesta en formato JSON
         * **/
        private string readerToJson(ref NpgsqlDataReader newReader) {

            StringBuilder newSBuilder = new StringBuilder();
            StringWriter newSWriter = new StringWriter(newSBuilder);
            JsonWriter jsonWriter = new JsonTextWriter(newSWriter);
            jsonWriter.WriteStartArray();
            while (newReader.Read())
            {
                int fieldcount = newReader.FieldCount; // count how many columns are in the row
                object[] values = new object[fieldcount]; // storage for column values
                newReader.GetValues(values); // extract the values in each column

                jsonWriter.WriteStartObject();
                for (int index = 0; index < fieldcount; index++)
                { // iterate through all columns

                    jsonWriter.WritePropertyName(newReader.GetName(index)); // column name
                    jsonWriter.WriteValue(values[index]); // value in column
                }
                jsonWriter.WriteEndObject();
            }
            jsonWriter.WriteEndArray();
            return newSBuilder.ToString();
        }
        protected NpgsqlParameter createPameter(string paramName, NpgsqlTypes.NpgsqlDbType paramType, Object newValue, int newParamSize)
        {
            NpgsqlParameter newParam = new NpgsqlParameter(paramName, paramType, newParamSize);
            newParam.Value = newValue;

            return newParam;
        }
        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~SQLExecutable() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        void IDisposable.Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }
        #endregion


    }


}