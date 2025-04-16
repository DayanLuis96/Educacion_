using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security.AntiXss;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Plantilla
{
    public partial class Notificacion : System.Web.UI.Page
    {
        private int _ID_Plantilla
        {
            get
            {
                if (ViewState["_ID_Plantilla"] == null)
                {
                    ViewState["_ID_Plantilla"] = 0;
                }
                return (int)ViewState["_ID_Plantilla"];
            }
            set
            {
                ViewState["_ID_Plantilla"] = value;
            }
        }
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListas();
            }
        }

        protected void ddl_Notificación_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool V_Notificacion = int.TryParse(ddl_Notificacion.SelectedValue, out int Notificacion);

            if (V_Notificacion && Notificacion > 0)
            {
                _ID_Plantilla = Notificacion;
                CargarPlantillaConfigurada(_ID_Plantilla);
                BtnGuardarPlantilla.Visible = true;

            }
            else
            {
                txb_Texto.Text = "";
                BtnGuardarPlantilla.Visible = false;
            }

        }

        public void CargarListas()
        {

            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STR_PLANTILLA_NOTIFICACIONES_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);


            ddl_Notificacion.DataSource = dt;
            ddl_Notificacion.DataValueField = "ID";
            ddl_Notificacion.DataTextField = "NOMBRE";
            ddl_Notificacion.DataBind();
            ddl_Notificacion.Items.Insert(0, new ListItem("Seleccione", "0"));
            conn.Close();
        }

        public void CargarPlantillaConfigurada(int pLANTILLAID)
        {
            try
            {
                if (leer != null)
                {
                    leer.Close();
                }
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PLANTILLA_NOTIFICACIONES_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = pLANTILLAID;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    txb_Texto.Text = leer.GetString(0) == null ? "" : HttpUtility.HtmlDecode(leer.GetString(0));

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        private void guardarPlantilla(int ID_Plantilla)
        {

            if (IsValid)
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PLANTILLA_NOTIFICACIONES_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID_Plantilla;
                cmd.Parameters.Add("@MENSAJE", SqlDbType.VarChar).Value = AntiXssEncoder.HtmlEncode(txb_Texto.Text, true);
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Éxitoso!', 'Plantilla Configurada!', 'success');", true);
                txb_Texto.Text = "";
                ddl_Notificacion.Text = "0";

            }

        }

        protected void BtnGuardarPlantilla_Click(object sender, EventArgs e)
        {
            guardarPlantilla(_ID_Plantilla);
        }
    }
}