using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Educacion.Properties;

namespace Educacion
{
    public class BDCOMUN
    {
        public static string ObsenerString()
        {
            return Settings.Default.Conexion;
        }
        public static SqlConnection obtenerCOnexion()
        {
            SqlConnection conn = new SqlConnection(ObsenerString());
            conn.Open();
            return conn;
        }
    }
}