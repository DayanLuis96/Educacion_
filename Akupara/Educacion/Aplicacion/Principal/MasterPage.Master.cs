using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;
using static Educacion.Educacion.Aplicacion.Pagina.Configuracion.Plantilla.Emails;
using System.Web.UI.WebControls;

namespace Educacion.Educacion.Aplicacion.Principal
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;

        #region Parametros
        private int _ID_ROL
        {
            get
            {
                if (Session["ID_ROL"] == null)
                {
                    Session["ID_ROL"] = 0;
                }
                return (int)Session["ID_ROL"];
            }
            set
            {
                Session["ID_ROL"] = value;
            }
        }

        private int _ID_USUARIO
        {
            get
            {
                if (Session["ID_USUARIO"] == null)
                {
                    Session["ID_USUARIO"] = 0;
                }
                return (int)Session["ID_USUARIO"];
            }
            set
            {
                Session["ID_USUARIO"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                CargarUsuarioSMTP();
                if (Session["NOMBRE"] != null)
                {
                    txtopcionmenu.Text = Session["OPCION_MENU"].ToString();
                    txtnombreusuario.Text = Session["NOMBRE"].ToString();
                    h6nomresposiv.InnerText = Session["NOMBRE"].ToString();
                    h1usuario.InnerText = Session["NOMBRE"].ToString();
                    txtrol.Text = Session["ROL"].ToString();
                    spamRolrespov.InnerText = Session["ROL"].ToString();
                    SpanUsuario.InnerText = Session["ROL"].ToString();

                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }




                CargarMenuLateral();
                CargarhIJOSLateral();
                CargaroPCIONEShIJOSLateral();
                CargaroPCIONESpadre();
                CargaroPCIONEShIJOSnIVEL2Lateral();

                //cargamosestados laterales
                CargarEstadosRecientes();
                CargarEstadoAprobadas();
                CargarEstadoCompletadas();
                CargarEstadoAnuladas();


            }

            CargarNotificaciones();
        }

        protected void Unnamed_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Educacion/Aplicacion/Pagina/Inicial.aspx");
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }


        /// <summary>
        /// Opciones Para cargar menu.
        /// U_Nacional - LM - Desarrollo
        /// 24-01-2023  - 
        /// </summary>
        #region Metodos_MenuLateral

        public void CargarMenuLateral()
        {


            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[sTR_MENU_LATERAL_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = _ID_ROL;
                //cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListaMenu.DataSource = dt;
                ListaMenu.DataBind();
                conn.Close();

            }
            catch (Exception)
            {
            }

        }

        public void CargarhIJOSLateral()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }


                foreach (System.Web.UI.WebControls.ListViewItem item in ListaMenu.Items)
                {
                    int IDmENU = Convert.ToInt32((((System.Web.UI.WebControls.Label)(item.FindControl("txtDespliega")))).Text);
                    SqlCommand cmd = new SqlCommand("[Educacion].[sTR_MENU_LATERAL_Educacion]", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                    cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = _ID_ROL;
                    //cmd.ExecuteNonQuery();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    //Enlazo mis datos obtenidos en el DataTable con el grid
                    ListHijoMenu.DataSource = dt;
                    ListHijoMenu.DataBind();

                }


                conn.Close();

            }
            catch (Exception ex)
            {
            }

        }

        public void CargaroPCIONEShIJOSLateral()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }


                foreach (System.Web.UI.WebControls.ListViewItem item in ListHijoMenu.Items)
                {

                    int IDmENU = Convert.ToInt32((((System.Web.UI.WebControls.Label)(item.FindControl("txtDespliega2")))).Text);
                    SqlCommand cmd = new SqlCommand("[Educacion].[sTR_MENU_LATERAL_Educacion]", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                    cmd.Parameters.Add("@IDLATERALHIJO", SqlDbType.Int).Value = IDmENU;
                    cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = _ID_ROL;

                    //cmd.ExecuteNonQuery();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    //Enlazo mis datos obtenidos en el DataTable con el grid
                    (((System.Web.UI.WebControls.ListView)(item.FindControl("ListaSubMenu")))).DataSource = dt;
                    (((System.Web.UI.WebControls.ListView)(item.FindControl("ListaSubMenu")))).DataBind();

                }


                conn.Close();

            }
            catch (Exception)
            {
            }

        }

        public void CargaroPCIONESpadre()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }


                foreach (System.Web.UI.WebControls.ListViewItem item in ListHijoMenu.Items)
                {

                    int IDmENU = Convert.ToInt32((((System.Web.UI.WebControls.Label)(item.FindControl("txtDespliega2")))).Text);
                    SqlCommand cmd = new SqlCommand("[Educacion].[sTR_MENU_LATERAL_Educacion]", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                    cmd.Parameters.Add("@IDLATERALHIJO", SqlDbType.Int).Value = IDmENU;
                    cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = _ID_ROL;

                    cmd.ExecuteNonQuery();

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    //Enlazo mis datos obtenidos en el DataTable con el grid
                    (((System.Web.UI.WebControls.ListView)(item.FindControl("ListaSubMenuPADRE")))).DataSource = dt;
                    (((System.Web.UI.WebControls.ListView)(item.FindControl("ListaSubMenuPADRE")))).DataBind();

                }


                conn.Close();

            }
            catch (Exception)
            {
            }

        }

        public void CargaroPCIONEShIJOSnIVEL2Lateral()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }


                foreach (System.Web.UI.WebControls.ListViewItem item in ListHijoMenu.Items)
                {
                    foreach (System.Web.UI.WebControls.ListViewItem item2 in (((System.Web.UI.WebControls.ListView)(item.FindControl("ListaSubMenuPADRE")))).Items)
                    {
                        int IDmENU = Convert.ToInt32((((System.Web.UI.WebControls.Label)(item2.FindControl("txtDespliega2")))).Text);
                        SqlCommand cmd = new SqlCommand("[Educacion].[sTR_MENU_LATERAL_Educacion]", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
                        cmd.Parameters.Add("@IDLATERALPADRE", SqlDbType.Int).Value = IDmENU;
                        cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = _ID_ROL;

                        cmd.ExecuteNonQuery();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        //Enlazo mis datos obtenidos en el DataTable con el grid
                        (((System.Web.UI.WebControls.ListView)(item2.FindControl("ListaSubMenuHijos")))).DataSource = dt;
                        (((System.Web.UI.WebControls.ListView)(item2.FindControl("ListaSubMenuHijos")))).DataBind();
                    }
                }


                conn.Close();

            }
            catch (Exception)
            {
            }

        }

        public string CargarUrl(int SolicitudID, bool nivelNieto)
        {
            string url = "";

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
                SqlCommand cmd = new SqlCommand("[Educacion].[sTR_MENU_LATERAL_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if (nivelNieto)
                {

                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
                }
                else
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                }
                cmd.Parameters.Add("@ID_opcion", SqlDbType.Int).Value = SolicitudID;
                cmd.ExecuteNonQuery();
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    url = leer.GetString(0);


                }
                conn.Close();
                leer.Close();


            }
            catch (Exception)
            {
            }
            return url;

        }

        protected void LinkButton3_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            string UrlFinal = CargarUrl(RowNum, false);

            if (!string.IsNullOrEmpty(UrlFinal))
            {

                Response.Redirect(UrlFinal);
            }
        }

        protected void LinkButton4_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            string UrlFinal = CargarUrl(RowNum, true);

            if (!string.IsNullOrEmpty(UrlFinal))
            {

                Response.Redirect(UrlFinal);
            }
        }

        #endregion

        /// <summary>
        /// Metodos para Cargar estados en Modal_lateral
        /// LD - Desarrollo -26-01-2023
        /// U_Nacional
        /// </summary>
        #region MetodosEstadoServicio

        public void CargarEstadosRecientes()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Akupara].[QRY_Estados_SERVICIOs]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (_ID_ROL != 1)
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                    cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = _ID_USUARIO;
                }
                else
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                }

                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListViewRecientes.DataSource = dt;
                ListViewRecientes.DataBind();
                conn.Close();


            }
            catch (Exception eR)
            {
                throw eR;
                // ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }
        public void CargarEstadoAprobadas()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Akupara].[QRY_Estados_SERVICIOs]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (_ID_ROL != 1)
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                    cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = _ID_USUARIO;
                }
                else
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
                }

                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListViewAprobadas.DataSource = dt;
                ListViewAprobadas.DataBind();
                conn.Close();


            }
            catch (Exception eR)
            {
                throw eR;
                // ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }
        public void CargarEstadoCompletadas()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Akupara].[QRY_Estados_SERVICIOs]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (_ID_ROL != 1)
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                    cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = _ID_USUARIO;
                }
                else
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
                }

                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListViewCompletadas.DataSource = dt;
                ListViewCompletadas.DataBind();
                conn.Close();


            }
            catch (Exception eR)
            {
                throw eR;
                // ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }
        public void CargarEstadoAnuladas()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Akupara].[QRY_Estados_SERVICIOs]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (_ID_ROL != 1)
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                    cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = _ID_USUARIO;
                }
                else
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
                }

                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListViewAnuladas.DataSource = dt;
                ListViewAnuladas.DataBind();
                conn.Close();


            }
            catch (Exception eR)
            {
                throw eR;
                // ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        #endregion

        #region NotificacionesMuestrasRechazadas


        public int VALIDAR_USUARIO_REVISOR(int ID_USUARIO)
        {
            int ID_ID__USER_NOTIFICACION = 0;
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Akupara].[STP_Akupara_NOTIFICACION_USUARIO_DETALLE_SERVICIO]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = ID_USUARIO;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 12;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    ID_ID__USER_NOTIFICACION = leer.GetInt32(0);

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception eR)
            {
                throw eR;
                // ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

            return ID_ID__USER_NOTIFICACION;
        }

        public void CargarNotificaciones()
        {

            int ES_SERVISOR = VALIDAR_USUARIO_REVISOR(_ID_USUARIO);
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Akupara].[STP_Akupara_NOTIFICACION_USUARIO_DETALLE_SERVICIO]", conn);
                cmd.CommandType = CommandType.StoredProcedure;



                if (_ID_ROL != 1)
                {


                    if (ES_SERVISOR != 0)
                    {
                        cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 11;
                        LinkButton1.Visible = false;
                        btnVerTodo.Visible = false;
                    }
                    else
                    {

                        cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                    }
                    cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = _ID_USUARIO;
                }
                else
                {
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                    Session["ESadmin"] = true;
                    LinkButton1.Visible = false;
                    btnVerTodo.Visible = false;
                }



                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListViewNotificaciones.DataSource = dt;
                ListViewNotificaciones.DataBind();

                ListViewNotificacionMovil.DataSource = dt;
                ListViewNotificacionMovil.DataBind();
                conn.Close();

                int contador = 0;
                foreach (var item in ListViewNotificaciones.Items)
                {
                    contador++;
                }

                ContMensajes.InnerText = contador.ToString();
                ConNoti2.InnerText = contador.ToString();

            }
            catch (Exception eR)
            {
                throw eR;
                // ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }
        #endregion

        protected void btnAlerta_Command(object sender, CommandEventArgs e)
        {
            string[] Ids = ((LinkButton)sender).CommandArgument.Split(';');
            bool IdRegistroCargue = int.TryParse(Ids[0], out int RowNumID_SOLICITUD);
            bool ESadmin = Convert.ToBoolean(Ids[1]);
            bool IdRegistro = int.TryParse(Ids[2], out int IDNotificado);
            bool ESRevisor = Convert.ToBoolean(Ids[3]);
            Session["ESadmin"] = ESadmin;

            if (ESadmin && !ESRevisor)
            {
                Response.Redirect("~/Educacion/Aplicacion/Pagina/Muestras/Revision/Asinar_revisor?SoId=" + RowNumID_SOLICITUD + "&Not=" + IDNotificado);
            }
            else
            {
                if (ESRevisor)
                {
                    Response.Redirect("~/Educacion/Aplicacion/Pagina/Muestras/Revision/Revision_Muestras");

                }
                else
                {
                    Response.Redirect("~/Educacion/Aplicacion/Pagina/Solicitudes/Mis_solicitudes?SoId=" + RowNumID_SOLICITUD);

                }
            }

        }

        protected void btnVerTodo_Click(object sender, EventArgs e)
        {

            if (Convert.ToBoolean(Session["ESadmin"]))
            {
                Response.Redirect("~/Educacion/Aplicacion/Pagina/Muestras/Revision/Asinar_revisor?SoId=" + 0);
            }
            else
            {

                Response.Redirect("~/Educacion/Aplicacion/Pagina/Solicitudes/Mis_solicitudes?SoId=" + 0);
            }
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
                MessageBox.Show(error.Message + error.StackTrace);
            }
        }

        protected void Btnperfil_Click(object sender, EventArgs e)
        {

        }
    }
}