using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Security.AntiXss;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Plantilla
{
    /// <summary>
    /// Esta Clase Facilitara el envio de Notificaciones junto con todos los metodos Anclados.
    /// L.M Desarrollo Educacion 20-05-2023
    /// </summary>
    public class EnviarCorreos
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        public List<string> CargarPlantillaConfigurada(int pLANTILLAID)
        {
            List<string> vs = new List<string>();
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

                    //string Mensaje = System.Text.RegularExpressions.Regex.Replace(leer.GetString(0), "<[^>]*>", "");
                    string Mensaje = HttpUtility.HtmlDecode(leer.GetString(0));
                    string Asunto = leer.GetString(1);
                    vs.Add(Mensaje);
                    vs.Add(Asunto);
                }
                conn.Close();
                leer.Close();


            }
            catch (Exception)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }
            return vs;
        }


        public string CorreoPorUsuarios(int _USUARIOID)
        {
            string correo = "";
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
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = _USUARIOID;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    correo = leer.GetString(0);

                }
                conn.Close();
                leer.Close();


            }
            catch (Exception)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }
            return correo;
        }

        public int ConsultarIdUsuarioRevisor(int ID_SOLICTUD)
        {
            int IdSol = 0;
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
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID_SOLICTUD;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    IdSol = leer.GetInt32(0);

                }
                conn.Close();
                leer.Close();


            }
            catch (Exception)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }
            return IdSol;
        }

        public string CorreoAdministrador()
        {
            string correo = "";
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
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    correo = leer.GetString(0);

                }
                conn.Close();
                leer.Close();


            }
            catch (Exception)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }
            return correo;
        }

        public void EnviarCorreo(string Correo, string mesajeEmail, string asuntoEmal, long IDSolicitud, bool DetalleServicio = false)
        {
            string NombreCliente = NombreUsuariSolicita(IDSolicitud);

            mesajeEmail = mesajeEmail.Replace("[CAMPO_CLIENTE]", NombreCliente);

            if (DetalleServicio)
            {
                string Detalle = DetalleSolitud_PrimerMomento(IDSolicitud);
                mesajeEmail = mesajeEmail.Replace("[DETALLE_SERVICIO]", Detalle);
            }

            bool enviado = true;
            try
            {
                string to = Correo;
                string mesaje = mesajeEmail;

                string asunto = asuntoEmal;

                new Emails().enviarcorreo(to, mesaje, asunto);
            }
            catch (Exception error)
            {
                enviado = false;

            }


        }

        MailMessage message = new MailMessage();
        SmtpClient Smtp = new SmtpClient();
        public void GENERAR_INFORME(string to, string mesaje, string asunto, string NOMBRE_CARPETA)
        {
            ReportViewer reportViewer = new ReportViewer();

            try
            {
                reportViewer.ProcessingMode = ProcessingMode.Remote;
                reportViewer.ServerReport.ReportServerUrl = new Uri(Emails.DATOSCONEXIONREPORTES.SERVIDOR_REPORTES);
                reportViewer.ServerReport.ReportPath = "" + NOMBRE_CARPETA + "/Reportes TQ/Compras/InfCotizacionesProveedor";
                reportViewer.ServerReport.ReportServerCredentials = new CustomReportCredentials(Emails.DATOSCONEXIONREPORTES.USUARIO_SERVIDOR, Emails.DATOSCONEXIONREPORTES.CLAVE, "");
                List<ReportParameter> parameters = new List<ReportParameter>();

                //parameters.Add(new ReportParameter("ID_COTIZACION", ViewState["ID_COTIZACION_PEDIDO_NOTIFICAR"].ToString()));
                //parameters.Add(new ReportParameter("ID_TIPO_ARTICULO", ViewState["ID_TIPO_ARTICULO"].ToString()));
                //parameters.Add(new ReportParameter("ID_IPS", Session["ID_IPS"].ToString()));
                //parameters.Add(new ReportParameter("ID_PROVEEDOR", ViewState["ID_TERCERO_NOTIFICAR"].ToString()));
                reportViewer.ServerReport.SetParameters(parameters);
                //reportViewer.ProcessingMode = ProcessingMode.Remote;
                //ReportViewer1.ShowParameterPrompts = true;
                //ReportViewer1.ShowPromptAreaButton = true;
                reportViewer.ServerReport.Refresh();
                //ReportViewer1.ZoomMode = ZoomMode.Percent;
                //ReportViewer1.ZoomPercent = 100;
                //ReportViewer1.ShowParameterPrompts = false;

                //orden.ADJUNTO
                var bytes = reportViewer.ServerReport.Render("PDF");

                message.From = new MailAddress(Emails.DATOS_EMAIL.USUARIO_SMTP);
                message.To.Add(new MailAddress(to));
                message.Body = mesaje;
                message.Subject = asunto;
                Smtp.Host = Emails.DATOS_EMAIL.SERVIDOR_SMTP;
                Smtp.Port = Convert.ToInt32(Emails.DATOS_EMAIL.PUERTO);
                Smtp.Credentials = new NetworkCredential(Emails.DATOS_EMAIL.USUARIO_SMTP, Emails.DATOS_EMAIL.CLAVE);
                message.Attachments.Add((new Attachment(new MemoryStream(bytes), "Cotizacion evaluada.pdf")));


                Smtp.EnableSsl = true;
                Smtp.Send(message);

                return;
            }
            catch (Exception error)
            {
                throw error;
            }
        }


        public class CustomReportCredentials : Microsoft.Reporting.WebForms.IReportServerCredentials
        {

            // local variable for network credential.
            private string _UserName;
            private string _PassWord;
            private string _DomainName;

            private WindowsIdentity _ImpersonationUser;

            public CustomReportCredentials(string UserName, string PassWord, string DomainName)
            {
                _UserName = UserName;
                _PassWord = PassWord;
                _DomainName = DomainName;
                // _ImpersonationUser = ImpersonationUser;
            }
            public WindowsIdentity ImpersonationUser
            {
                get
                {
                    return null; // not use ImpersonationUser
                }
            }
            public ICredentials NetworkCredentials
            {
                get
                {

                    // use NetworkCredentials
                    return new NetworkCredential(_UserName, _PassWord, _DomainName);
                }
            }
            public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password, out string authority)
            {

                // not use FormsCredentials unless you have implements a custom autentication.
                authCookie = null;
                user = password = authority = null;
                return false;
            }



        }

        public string NombreUsuariSolicita(long _IDSolicitud)
        {
            string Nombre = "";
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
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
                cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = _IDSolicitud;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    Nombre = leer.GetString(0);

                }
                conn.Close();
                leer.Close();


            }
            catch (Exception)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }
            return Nombre;
        }

        public string DetalleSolitud_PrimerMomento(long _IDSolicitud)
        {
            string htmlTable;
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STR_PLANTILLA_NOTIFICACIONES_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = _IDSolicitud;

            cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            // Construir la tabla HTML a partir del DataTable
            StringBuilder htmlBuilder = new StringBuilder();
            htmlBuilder.Append("<table>");
            htmlBuilder.Append("<tr>");
            htmlBuilder.Append("<th>NOMBRE SERVICIO</th>");
            htmlBuilder.Append("<th>DETALLE SERVICIO</th>");
            htmlBuilder.Append("<th>CANTIDAD</th>");
            htmlBuilder.Append("</tr>");

            foreach (DataRow row in dt.Rows)
            {
                htmlBuilder.Append("<tr>");
                htmlBuilder.Append("<td>" + row["NOMBRE"] + "</td>");
                htmlBuilder.Append("<td>" + row["NOMBRE_UNIDAD"] + "</td>");
                htmlBuilder.Append("<td>" + row["CANTIDAD"] + "</td>");
                htmlBuilder.Append("</tr>");
            }

            htmlBuilder.Append("</table>");

            conn.Close();

            htmlBuilder.Append("<table class=\"my-table\">");

            // Obtener la cadena HTML final
            htmlTable = htmlBuilder.ToString();

            // Aplicar estilos CSS a la tabla y los encabezados
            htmlTable = "<style>" +
                    ".my-table { border-collapse: collapse; }" +
                    ".my-table th, .my-table td { border: 1px solid black; padding: 8px; }" +
                    ".table-header { background-color: #f2f2f2; border: 1px solid black; }" +
                    "</style>" +
                    htmlTable;

            return htmlTable;



        }

    }
}