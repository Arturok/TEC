using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConstruTEC.Models
{
    public class Rol: SQLExecutable
    {
        string commCheckRol = "";
        public bool isValid=false;
        public int ID { get; set; }
        [required]
        public string ROL { get; set; }
        public string Descripcion { get; set; }

        public void checkRol() {
            Npgsql.NpgsqlParameter tempParameter = new Npgsql.NpgsqlParameter();
            bindDataParameter();
            if (ExecReader(commCheckRol, paramList).Contains("OK")) {
                isValid = true;
            }

        }

        public void bindDataParameter()
        {
            paramList = new List<NpgsqlParameter>();
            paramList.Add(createPameter("ROL", NpgsqlTypes.NpgsqlDbType.Varchar, ROL, 100));

        }
    }
}
