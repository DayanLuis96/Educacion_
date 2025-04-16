using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;

namespace Educacion
{
    public partial class Registro : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlDataReader leer = null;
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarioSMTP();

                CargarTIPOPERSONA();
            }
        }

        public void CargarTIPOPERSONA()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_TERCEROS_P_N]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["NOMBRE"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txttipoPersona.DataSource = dt;
            txttipoPersona.DataValueField = "ID";
            txttipoPersona.DataTextField = "NOMBRE";
            txttipoPersona.DataBind();
            conn.Close();
        }

        protected void txttipopersona_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTIPODOCUMENTO();
            if (txttipoPersona.SelectedValue == "1")
            {
                txttipoIdentificacion.Enabled = true;
                txtdigitoverificacion.Enabled = false;
                txttipoIdentificacion.SelectedItem.Text = "Seleccione";
                PanelDv.Visible = false;
            }
            else
            {
                txttipoIdentificacion.SelectedValue = "2";
                txtdigitoverificacion.Enabled = true;
                PanelDv.Visible = true;

            }


        }

        public void CargarTIPODOCUMENTO()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_TERCEROS_P_N]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (txttipoPersona.SelectedValue == "1")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 21;
            }
            else
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["CODIGO"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txttipoIdentificacion.DataSource = dt;
            txttipoIdentificacion.DataValueField = "ID";
            txttipoIdentificacion.DataTextField = "CODIGO";
            txttipoIdentificacion.DataBind();
            conn.Close();
        }


        public static class DATOS_EMAIL
        {
            public static string SERVIDOR_SMTP;
            public static string PUERTO;
            public static string USUARIO_SMTP;
            public static string CLAVE;
        }
        public void CargarUsuarioSMTP()
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
                string sql = ("select SERVIDOR_SMTP,PUERTO,USUARIO_SMTP,CLAVE from [Administracion].[TP_ENVIO_AUTORIZACIONES]");

                cmd = new SqlCommand(sql, conn);
                leer = cmd.ExecuteReader();
                if (leer.Read())
                {
                    DATOS_EMAIL.SERVIDOR_SMTP = leer.GetString(0);
                    DATOS_EMAIL.PUERTO = leer.GetString(1);
                    DATOS_EMAIL.USUARIO_SMTP = leer.GetString(2);
                    DATOS_EMAIL.CLAVE = leer.GetString(3);
                }
                conn.Close();
                leer.Close();

            }
            catch (Exception error)
            {

            }
        }

        public void validarexistencia()
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
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@USUARIO", SqlDbType.NVarChar).Value = txtusuario.Text;
                cmd.Parameters.Add("@CORREO", SqlDbType.NVarChar).Value = txtcorreo.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 16;

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    ViewState["ID_USUARIO_CLIENTE"] = leer.GetInt32(0);
                }
                conn.Close();
                leer.Close();
            }
            catch (Exception ERROR)
            {
                throw ERROR;
            }
        }

        protected void btnregistro_Click1(object sender, EventArgs e)
        {
            ViewState["ID_USUARIO_CLIENTE"] = null;
            try
            {
                validarexistencia();
                if (txttipoPersona.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor seleccione un tipo de persona!', 'info');", true);
                    return;
                }

                if (txttipoIdentificacion.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor seleccione el tipo de identificación!', 'info');", true);
                    return;
                }

                if (txtnumeroIdentificacion.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese su numero de Identificación!', 'info');", true);
                    return;
                }

                if (txttipoPersona.SelectedValue != "1")
                {
                    if (txtdigitoverificacion.Text == "")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese dig. Verificación!', 'info');", true);
                        return;
                    }
                }

                if (txtnombres.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese nombre completo!', 'info');", true);
                    return;
                }
                if (txttelefono.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese numero de telefono!', 'info');", true);
                    return;
                }
                if (txtcorreo.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese correo electronico!', 'info');", true);
                    return;
                }
                if (txtusuario.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese usuario!', 'info');", true);
                    return;
                }
                if (txtclave.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor ingrese la contraseña!', 'error');", true);
                    txtclave.Focus();
                    return;
                }
                if (txtrepclave.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Por favor repetir contraseña!', 'error');", true);
                    txtrepclave.Focus();
                    return;
                }
                if (txtclave.Text != txtrepclave.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas ingresadas no coinciden, por favor verifique!', 'error');", true);
                    return;
                }
                if (ViewState["ID_USUARIO_CLIENTE"] != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Existe un usuario registrado con las mismas credenciales, intenta con otro usuario y/o contraseña!', 'error');", true);
                    return;
                }

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ID_TIPO_PERSONA", SqlDbType.Int).Value = txttipoPersona.SelectedValue;
                cmd.Parameters.Add("@ID_TIPO_IDENTIFICACION", SqlDbType.Int).Value = txttipoIdentificacion.SelectedValue;
                cmd.Parameters.Add("@NUMERO_IDENTIFICACION", SqlDbType.NVarChar).Value = txtnumeroIdentificacion.Text;
                if (txttipoPersona.SelectedValue != "1")
                {
                    cmd.Parameters.Add("@DIGITO_VERIFICACION", SqlDbType.NVarChar).Value = txtdigitoverificacion.Text;
                }
                cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = txtnombres.Text;
                cmd.Parameters.Add("@USER_NAME", SqlDbType.NVarChar).Value = txtusuario.Text;
                cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar).Value = txtclave.Text;
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = true;
                cmd.Parameters.Add("@TELEFONO", SqlDbType.NVarChar).Value = txttelefono.Text;
                cmd.Parameters.Add("@CORREO", SqlDbType.NVarChar).Value = txtcorreo.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 10;
                int Resultado = cmd.ExecuteNonQuery();


                if (Resultado != 0)
                {
                    Response.Redirect("Login.aspx?Creado=1");
                    // EnviarCorreo();

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Error de registro', 'info');", true);
                }
                conn.Close();
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Error de registro', 'info');", true);
            }
        }

        public void EnviarCorreo()
        {
            bool enviado = true;
            try
            {
                string to = txtcorreo.Text;
                string msn = " " + "Gracias por registrarte" + " \n\n" +
                    "Apreciado paciente, gracias por registrarte en nuestro sistema, le informamos que de ahora en adelante contará con acceso a la plataforma TOTAL QUALITY (Gestión pacientes)," +
                    " en la cual tendra disponible ordenes medicas, resultados, autorizaciones y solicitud de citas, a continuación le recordamos su usuario y contraseña." + ". \n\n" +
                    "Usuario: " + "" + txtusuario.Text + "" + " \n\n" +
                    "Contraseña: " + "" + txtclave.Text + "" + " \n\n" +
                    "Correo enviado automaticamente por Total Quality";
                string asunto = "Creación de usuario";

                //new Emails().enviarcorreo(to, msn, asunto);
            }
            catch (Exception error)
            {
                enviado = false;
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'El email esta mal diligenciado, comuniquese con su soporte tecnico', 'error');", true);
                return;
            }

        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}