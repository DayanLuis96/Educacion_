using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Educacion;

namespace Akupara.Educacion.Aplicacion.Pagina.GestionAdministrativa.ActividadesCompetencias
{
    public partial class NewConsultarActividades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               if(Request.Params["Guardo"] != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje SIE', 'Datos Guardados con Exito', 'success');", true);
                }
            }
        }
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;

        public void COnsultarActividades()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_ACTIVIDADES_ACADEMICAS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"]; 
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            tablaactividades.DataSource = dt;
            tablaactividades.DataBind();
            conn.Close();
             
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            COnsultarActividades();
        }

        protected void btnnuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCrearActividadesCompetencias.aspx");
        }
    }
}