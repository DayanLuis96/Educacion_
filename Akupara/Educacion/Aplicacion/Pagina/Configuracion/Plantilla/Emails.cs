using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Plantilla
{
    public class Emails
    {
        MailMessage message = new MailMessage();
        SmtpClient Smtp = new SmtpClient();

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

        public bool enviarcorreo(string to, string mesaje, string asunto)
        {
            try
            {
                message.From = new MailAddress(DATOS_EMAIL.USUARIO_SMTP);
                message.To.Add(new MailAddress(to));
                message.Body = mesaje;
                message.Subject = asunto;
                message.IsBodyHtml = true;
                Smtp.Host = DATOS_EMAIL.SERVIDOR_SMTP;
                Smtp.Port = Convert.ToInt32(DATOS_EMAIL.PUERTO);
                Smtp.Credentials = new NetworkCredential(DATOS_EMAIL.USUARIO_SMTP, DATOS_EMAIL.CLAVE);
                //   message.Attachments.Add(new Attachment(@"C:\inetpub\prueba.pdf"));
                Smtp.EnableSsl = true;
                Smtp.Send(message);

                return true;
            }
            catch (Exception error)
            {
                throw error;
            }
        }

        public bool EnviarCorreoFinal(string to, string mesaje, string asunto)
        {
            try
            {
                message.From = new MailAddress(Emails.DATOS_EMAIL.USUARIO_SMTP);
                message.To.Add(new MailAddress(to));
                message.Body = mesaje;
                message.Subject = asunto;
                Smtp.Host = Emails.DATOS_EMAIL.SERVIDOR_SMTP;
                Smtp.Port = Convert.ToInt32(Emails.DATOS_EMAIL.PUERTO);
                Smtp.Credentials = new NetworkCredential(Emails.DATOS_EMAIL.USUARIO_SMTP, Emails.DATOS_EMAIL.CLAVE);
                //   message.Attachments.Add(new Attachment(@"C:\inetpub\prueba.pdf"));
                Smtp.EnableSsl = true;
                Smtp.Send(message);

                return true;
            }
            catch (Exception error)
            {
                throw error;
            }
        }
    }
}