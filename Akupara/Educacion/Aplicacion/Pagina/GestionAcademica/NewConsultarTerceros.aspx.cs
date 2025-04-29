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
    public partial class NewConsultarTerceros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            if (txtalumno.Text != "")
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[Educacion].[STP_CREAR_TERCEROS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@NOMBRE_COMPLETO", SqlDbType.NVarChar).Value = txtalumno.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                tablaconfigurados.DataSource = dt;
                tablaconfigurados.DataBind();
                conn.Close();

            }
        }

        protected void btnnuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCrearTercero.aspx");
        }

        protected void btneditar_Click()
        {

        }
    }
}