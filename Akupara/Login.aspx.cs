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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlDataReader leer = null;
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            LimpiarVariablesSesion();
            if (!IsPostBack)
            {
                if (Request.Params["Restablecida"] != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Contraseña restablecida Con Exito', 'success');", true);
                }
                if (Request.Params["Creado"] != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Cliente registrado Con Exito', 'success');", true);
                }
                if (Request.Params["Expirado"] != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Sesión Expirada', 'info');", true);
                }
                CargarUsuarioSMTP();
            }
        }

        public void LimpiarVariablesSesion()
        {
            Session["ID_PACIENTE"] = 0;
            Session["NUMERO_IDENTIFICACION"] = null;
            Session["Nombre_COMPLETO_USUARIO"] = null;
            Session["USUARIO"] = null;
            Session["ID_SEDE"] = null;
            Session["NOMBRE_SEDE"] = null;
            Session["ID_IPS"] = null;
            Session["NOMBRE_IPS"] = null;
            Session["ID_PERFIL_USUARIO"] = null;
            Session["ID_TERCERO_EMPRESA"] = null;
            Session["TIPO_IDENTIFICACION"] = null;
            Session["EMAIL"] = null;
            Session["VALIDA_RIPS"] = null;
            Session["ID_TIPO_CONTRATO"] = null;
            Session["USUARIO_ACTIVO"] = 0;
            Session["ID_USUARIO_PACIENTE"] = 0;

        }
        public int ID_USUARIO_CONSULTA, ID_TERCERO_USUARIO_CONSULTA, ID_PERFIL_USUARIO;
        public string USER_NAME;
        public Boolean USUARIO_VALIDO = false;
        public void ValidarUsuario()
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
                cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar).Value = txtclave.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    Session["ID_USUARIO"] = leer.GetInt32(0);
                    Session["USUARIO"] = leer.GetString(1);
                    Session["ID_ROL"] = leer.GetInt32(3);
                    Session["TIENE_FOTO"] = leer.GetInt32(5);
                    if (Convert.ToInt32(Session["TIENE_FOTO"]) == 1)
                    {
                        Session["IMAGEN_USUARIO"] = (byte[])leer["FOTO"];
                    }
                    ViewState["USUARIO_VALIDO"] = true;
                    Session["ROL"] = leer.GetString(12);
                    Session["NOMBRE"] = leer.GetString(9);
                    Session["IDENTIFICACION"] = leer.GetString(10);
                    Session["D_VERIFICACION"] = leer.GetString(11);
                    Session["TELEFONO"] = leer.GetString(13);
                    Session["CORREO"] = leer.GetString(14);
                    Session["ID_TIPO_PERSONA"] = leer.GetInt32(15);
                    Session["ID_TIPO_IDENTIFICACION"] = leer.GetInt32(16);

                    if (leer.GetString(12) == "Administrador")
                    {

                        Session["ROLADMIN"] = true;
                    }
                    else
                    {
                        Session["ROLADMIN"] = false;
                    }
                }
                conn.Close();
                leer.Close();
            }
            catch (Exception ERROR)
            {
                throw ERROR;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            login();
        }
        
        public void login()
        {

            Session["TIPO_USUARIO"] = 1;

            LimpiarVariablesSesion();
            DATOSCONEXION();
            ValidarUsuario();
            if (Convert.ToInt32(ViewState["USUARIO_VALIDO"]) == 1)
            {
                //  PaginaInicial.ACITVO = true;
                Session["USUARIO_ACTIVO"] = 1;
                //CargarDatosUsuario();
                CONSULTARPARAMETROSINFORME();
                // CargarLogo();
                if (Session["ServicioSolicitado"] != null)
                {
                    Response.Redirect("Solicitar_servicio.aspx");
                }
                else
                {
                    Response.Redirect("Educacion/Aplicacion/Pagina/Inicial.aspx");
                }

                //Response.Redirect("SeleccionarSede.aspx");
                //Response.Redirect("Mainframe/Iframe.aspx");
                txtusuario.Enabled = false;
                txtclave.Enabled = false;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Usuario no encontrado, por favor verifique!', 'error');", true);
            }
        }


        public void DATOSCONEXION()
        {
            Session["NOMBRE_MAQUINA"] = Environment.MachineName;
            Session["BUSCAR_IP"] = Dns.GetHostAddresses(Dns.GetHostName());
            Session["Ip_PC"] = Convert.ToString(Session["BUSCAR_IP"]);
        }
        public static class DATOS_EMAIL
        {
            public static string SERVIDOR_SMTP;
            public static string PUERTO;
            public static string USUARIO_SMTP;
            public static string CLAVE;
        }
        public static class DATOSCONEXIONREPORTES
        {
            public static string SERVIDOR_REPORTES;
            public static string EXTENCION;
            public static string USUARIO_SERVIDOR;
            public static string DOMINIO;
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

        public void CONSULTARPARAMETROSINFORME()
        {
            try
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Administracion].[STP_SERVIDOR_INFORMES]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_IPS", SqlDbType.Int).Value = 0;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                leer = cmd.ExecuteReader();

                if (leer.Read())
                {
                    DATOSCONEXIONREPORTES.SERVIDOR_REPORTES = leer.GetString(0);
                    DATOSCONEXIONREPORTES.EXTENCION = leer.GetString(1);
                    DATOSCONEXIONREPORTES.USUARIO_SERVIDOR = leer.GetString(2);
                    DATOSCONEXIONREPORTES.DOMINIO = leer.GetString(3);
                    DATOSCONEXIONREPORTES.CLAVE = leer.GetString(4);


                    Session["SERVIDOR_REPORTES"] = leer.GetString(0);
                    Session["EXTENCION"] = leer.GetString(1);
                    Session["USUARIO_SERVIDOR"] = leer.GetString(2);
                    Session["DOMINIO"] = leer.GetString(3);
                    Session["CLAVE"] = leer.GetString(4);
                    Session["NOMBRE_CARPETA"] = leer.GetString(5);
                    Session["NOMBRE_PROYECTO"] = leer.GetString(6);
                }

            }
            catch (Exception error)
            {

            }
            conn.Close();
            leer.Close();
        }

        protected void txtclave_TextChanged(object sender, EventArgs e)
        {
            login();
        }

        protected void btnAcceder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Educacion/Aplicacion/Pagina/Inicial.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro");
        }
    }
}