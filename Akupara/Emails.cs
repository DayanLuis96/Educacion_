using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace Educacion
{
    public class Emails
    {
        MailMessage message = new MailMessage();
        SmtpClient Smtp = new SmtpClient();



        //public bool enviarcorreo(string to, string mesaje, string asunto)
        //{
        //    try
        //    {
        //        message.From = new MailAddress(PaginaInicial.DATOS_EMAIL.USUARIO_SMTP);
        //        message.To.Add(new MailAddress(to));
        //        message.IsBodyHtml = true;
        //        message.Body = mesaje;
        //        message.Subject = asunto;
        //        Smtp.Host = PaginaInicial.DATOS_EMAIL.SERVIDOR_SMTP;
        //        Smtp.Port = Convert.ToInt32(PaginaInicial.DATOS_EMAIL.PUERTO);
        //        Smtp.Credentials = new NetworkCredential(PaginaInicial.DATOS_EMAIL.USUARIO_SMTP, PaginaInicial.DATOS_EMAIL.CLAVE);
        //        //   message.Attachments.Add(new Attachment(@"C:\inetpub\prueba.pdf"));
        //        Smtp.EnableSsl = true;
        //        Smtp.Send(message);

        //        return true;
        //    }
        //    catch (Exception error)
        //    {
        //        throw error;
        //    }
        //}

        //public bool EnviarCorreoFinal(string to, string mesaje, string asunto)
        //{
        //    try
        //    {
        //        message.From = new MailAddress(PaginaInicial.DATOS_EMAIL.USUARIO_SMTP);
        //        message.To.Add(new MailAddress(to));
        //        message.Body = mesaje;
        //        message.Subject = asunto;
        //        Smtp.Host = PaginaInicial.DATOS_EMAIL.SERVIDOR_SMTP;
        //        Smtp.Port = Convert.ToInt32(PaginaInicial.DATOS_EMAIL.PUERTO);
        //        Smtp.Credentials = new NetworkCredential(PaginaInicial.DATOS_EMAIL.USUARIO_SMTP, PaginaInicial.DATOS_EMAIL.CLAVE);
        //        //   message.Attachments.Add(new Attachment(@"C:\inetpub\prueba.pdf"));
        //        Smtp.EnableSsl = true;
        //        Smtp.Send(message);

        //        return true;
        //    }
        //    catch (Exception error)
        //    {
        //        throw error;
        //    }
        //}
    }
}