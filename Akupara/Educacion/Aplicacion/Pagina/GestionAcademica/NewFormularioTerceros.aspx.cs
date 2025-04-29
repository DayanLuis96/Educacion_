using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Educacion;


namespace Akupara.Educacion.Aplicacion.Pagina.GestionAcademica
{
    public partial class NewFormularioTerceros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListas("TipoIdentificacion");
                CargarListas("Estratos");
                CargarListas("Municipios");
            }
        }
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;

        public void CargarListas(String Movimiento)
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_CREAR_TERCEROS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Movimiento == "TipoIdentificacion")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
            }
            if (Movimiento == "Estratos")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
            }
            if (Movimiento == "Municipios")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (Movimiento == "TipoIdentificacion")
            {
                txttipodocumento.DataSource = dt;
                txttipodocumento.DataValueField = "ID";
                txttipodocumento.DataTextField = "NOMBRE";
                txttipodocumento.DataBind();
            }
            if (Movimiento == "Estratos")
            {
                txtestrato.DataSource = dt;
                txtestrato.DataValueField = "ID";
                txtestrato.DataTextField = "NOMBRE";
                txtestrato.DataBind();
            }
            if (Movimiento == "Municipios")
            {
                txtmunicipio.DataSource = dt;
                txtmunicipio.DataValueField = "ID";
                txtmunicipio.DataTextField = "NOMBRE";
                txtmunicipio.DataBind();
            }


            conn.Close();
        }
    }
}