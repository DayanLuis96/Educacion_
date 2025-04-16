using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Perfiles
{
    public partial class Perfil : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlDataReader leer = null;
        SqlCommand cmd = null;



        #region Parametros
        private int _IDROL_GENERAL
        {
            get
            {
                if (ViewState["_IDROL_GENERAL"] == null)
                {
                    ViewState["_IDROL_GENERAL"] = 0;
                }
                return (int)ViewState["_IDROL_GENERAL"];
            }
            set
            {
                ViewState["_IDROL_GENERAL"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["OPCION_MENU"] = "Configurar Perfiles";
                CargarPerfiles();
            }


        }
        public void CargarPerfiles()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERFILES_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;

            cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            tablaconsultar.DataSource = dt;
            tablaconsultar.DataBind();
            conn.Close();


        }

        protected void tablaconsultar_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ViewState["ID_PERFIL_EDITAR"] = (((Label)(tablaconsultar.Rows[e.RowIndex].FindControl("txtid"))).Text);
            txtnombre.Text = (tablaconsultar.Rows[e.RowIndex].Cells[1].Text);
            checActivo.Checked = (((CheckBox)(tablaconsultar.Rows[e.RowIndex].FindControl("txtestado"))).Checked);
        }

        protected void tablaconsultar_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["ID_PERFIL"] = (((Label)(tablaconsultar.Rows[tablaconsultar.SelectedRow.RowIndex].FindControl("txtid"))).Text);

        }

        protected void Btnguardar_Click(object sender, EventArgs e)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERFILES_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = txtnombre.Text;
            cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = checActivo.Checked;
            cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = Session["ID_USUARIO"];
            if (Convert.ToInt32(ViewState["ID_PERFIL_EDITAR"]) != 0)
            {
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_PERFIL_EDITAR"];
            }

            cmd.ExecuteReader();

            conn.Close();
            if (cmd != null)
            {

                if (Convert.ToInt32(ViewState["ID_PERFIL_EDITAR"]) != 0)
                {
                    CargarPerfiles();
                    txtnombre.Text = "";
                    ViewState["ID_PERFIL_EDITAR"] = 0;
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Datos Actualizados con exito!', 'success');", true);
                }
                else
                {
                    CargarPerfiles();
                    txtnombre.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Datos guardados con exito!', 'success');", true);

                }

            }
        }

        /// <summary>
        /// Metodos que permiten el control total del Menu lateral, segun los roles
        /// Desarrollo LM- U.Nacional 28-01-2023
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region AdminstradorPermisosROL

     
        protected void btnPermisos_Command(object sender, CommandEventArgs e)
        {
            PanelPrincipal.Visible = false;
            PanelPermisosMenu.Visible = true;
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            _IDROL_GENERAL = RowNum;
            CargarOpcionesMenuPrincipal(_IDROL_GENERAL);
            NombrePerfil(_IDROL_GENERAL);
        }

        /// <summary>
        /// Este metodo carga los Items padres de toda la App
        /// </summary>
        /// <param name="idROL"></param>
        public void CargarOpcionesMenuPrincipal(int idROL)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[QRY_CONFIGURAR_PERMISOS_PERFILES_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = idROL;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                DetalleMenu.DataSource = dt;
                DetalleMenu.DataBind();
                conn.Close();



            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        /// <summary>
        /// Permite el acceso a los Items dependientes segun los permisos asigandos
        /// </summary>
        /// <param name="idROL"></param>
        /// <param name="idMENU"></param>
        public void CargarOpcionesMenuPrincipalHijos(int idROL, int idMENU)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[QRY_CONFIGURAR_PERMISOS_PERFILES_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL_opciones_hijo", SqlDbType.Int).Value = idMENU;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                RepeaterHijosLateral.DataSource = dt;
                RepeaterHijosLateral.DataBind();
                conn.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        /// <summary>
        /// Permite el acceso a los Items dependientes segun los permisos asigandos para el nivel2
        /// </summary>
        /// <param name="idROL"></param>
        /// <param name="idMENU"></param>
        public void CargarOpcionesMenuPrincipalHijosNivel2Padre(int idROL, int idMENU)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }


                foreach (RepeaterItem row in RepeaterHijosLateral.Items)
                {
                    //int IdMenuLateral = Convert.ToInt32(((Label)(row.FindControl("txtID"))).Text);

                    SqlCommand cmd2 = new SqlCommand("[Educacion].[QRY_CONFIGURAR_PERMISOS_PERFILES_Educacion]", conn);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                    cmd2.Parameters.Add("@IDLATERAL", SqlDbType.Int).Value = idMENU;
                    cmd2.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = idROL;
                    cmd2.ExecuteNonQuery();

                    SqlDataAdapter adapter2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    adapter2.Fill(dt2);

                    //Enlazo mis datos obtenidos en el DataTable con el grid
                    (((Repeater)(row.FindControl("RepeaterHijosLateralPadre")))).DataSource = dt2;
                    (((Repeater)(row.FindControl("RepeaterHijosLateralPadre")))).DataBind();

                    if ((((Repeater)(row.FindControl("RepeaterHijosLateralPadre")))).Items.Count > 0)
                    {
                        Panel panel = (((Panel)(row.FindControl("panelHijo"))));
                        panel.Visible = true;
                    }


                }
                conn.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        /// <summary>
        /// Permite mostrar un Hijo del primer nivel... pero a su vez es la llave para el Nivel2
        /// </summary>
        /// <param name="idROL"></param>
        /// <param name="idMENU"></param>
        public void CargarOpcionesMenuPrincipalHijosNivel2(int idROL, int idMENU)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[QRY_CONFIGURAR_PERMISOS_PERFILES_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDLATERALPADRE", SqlDbType.Int).Value = idMENU;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                RepeaterHijosLateralNivel2.DataSource = dt;
                RepeaterHijosLateralNivel2.DataBind();
                conn.Close();

                if (RepeaterHijosLateralNivel2.Items.Count > 0)
                {

                    panelHijoNivel2.Visible = true;
                }
                else
                {
                    panelHijoNivel2.Visible = false;
                }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        protected void btnAtrasDetalle_Click(object sender, EventArgs e)
        {
            PanelPrincipal.Visible = true;
            PanelPermisosMenu.Visible = false;
            panelHijoNivel2.Visible = false;
            limpiarTablas();

        }

        protected void limpiarTablas()
        {
            DetalleMenu.DataBind();
            RepeaterHijosLateral.DataBind();
        }

        protected void lbn_HijosT_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            CargarOpcionesMenuPrincipalHijos(_IDROL_GENERAL, RowNum);
            CargarOpcionesMenuPrincipalHijosNivel2Padre(_IDROL_GENERAL, RowNum);
            panelHijoNivel2.Visible = false;

        }

        protected void lbn_HijosTP_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            CargarOpcionesMenuPrincipalHijosNivel2(_IDROL_GENERAL, RowNum);
        }

        protected void lbn_EstadoT_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            var Bool = validarestadoItemsMenuPrincipal(_IDROL_GENERAL, RowNum);
            updateITEMSMenuPrincipal(_IDROL_GENERAL, RowNum, Bool);
            limpiarTablas();
            CargarOpcionesMenuPrincipal(_IDROL_GENERAL);
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado', 'La opción se ha modificado con éxito!', 'success');", true);


        }


        public void updateITEMSMenuPrincipal(int idROL, int idMENU, bool EstadoItems)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL", SqlDbType.Int).Value = idMENU;
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = !EstadoItems;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        public bool validarestadoItemsMenuPrincipal(int idROL, int idMENU)
        {
            bool EstadoItems = false;
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL", SqlDbType.Int).Value = idMENU;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
           
                if (leer.Read() != false)
                {
                    EstadoItems = leer.GetBoolean(0);
                 

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

            return EstadoItems;
        }

        protected void lbn_EstadoTHijoNivel1_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            var Bool = validarestadoItemsMenuPrincipalHijosNivel1(_IDROL_GENERAL, RowNum);
            updateITEMSMenuPrincipalHijosNivel1(_IDROL_GENERAL, RowNum, Bool);
            limpiarTablas();
            CargarOpcionesMenuPrincipal(_IDROL_GENERAL);
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado', 'La opción se ha modificado con éxito!', 'success');", true);

        }


        public void updateITEMSMenuPrincipalHijosNivel1(int idROL, int idMENU, bool EstadoItems)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_OPCIONES_HIJO_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL_opciones_hijo", SqlDbType.Int).Value = idMENU;
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = !EstadoItems;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        public void NombrePerfil(int idROL)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[QRY_CONFIGURAR_PERMISOS_PERFILES_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = idROL;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    nombrePerfilSpan.InnerText = leer.GetString(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        public bool validarestadoItemsMenuPrincipalHijosNivel1(int idROL, int idMENU)
        {
            bool EstadoItems = false;
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_OPCIONES_HIJO_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL_opciones_hijo", SqlDbType.Int).Value = idMENU;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    EstadoItems = leer.GetBoolean(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

            return EstadoItems;
        }

        protected void lbn_EstadoTPadree_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            var Bool = validarestadoItemsMenuPadreSegundoNivel(_IDROL_GENERAL, RowNum);
            updateITEMSMenuPadreSegundoNivel(_IDROL_GENERAL, RowNum, Bool);
            limpiarTablas();
            CargarOpcionesMenuPrincipal(_IDROL_GENERAL);
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado', 'La opción se ha modificado con éxito!', 'success');", true);


        }

        public void updateITEMSMenuPadreSegundoNivel(int idROL, int idMENU, bool EstadoItems)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_PADRE_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL_PADRE", SqlDbType.Int).Value = idMENU;
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = !EstadoItems;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        public bool validarestadoItemsMenuPadreSegundoNivel(int idROL, int idMENU)
        {
            bool EstadoItems = false;
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_PADRE_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_LATERAL_PADRE", SqlDbType.Int).Value = idMENU;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    EstadoItems = leer.GetBoolean(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

            return EstadoItems;
        }

        protected void lbn_EstadoTNivel2_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            var Bool = validarestadoItemsMenuPrincipalHijosNivel2(_IDROL_GENERAL, RowNum);
            updateITEMSMenuPrincipalHijosNivel2(_IDROL_GENERAL, RowNum, Bool);
            limpiarTablas();
            CargarOpcionesMenuPrincipal(_IDROL_GENERAL);
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado', 'La opción se ha modificado con éxito!', 'success');", true);

        }


        public void updateITEMSMenuPrincipalHijosNivel2(int idROL, int idMENU, bool EstadoItems)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_OPCIONES_HIJO_NIVEL2_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_HIJO_NIVEL2", SqlDbType.Int).Value = idMENU;
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = !EstadoItems;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        public bool validarestadoItemsMenuPrincipalHijosNivel2(int idROL, int idMENU)
        {
            bool EstadoItems = false;
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STR_PERMISOS_MENU_LATERAL_OPCIONES_HIJO_NIVEL2_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@IDROL", SqlDbType.Int).Value = idROL;
                cmd.Parameters.Add("@IDMENU_HIJO_NIVEL2", SqlDbType.Int).Value = idMENU;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    EstadoItems = leer.GetBoolean(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

            return EstadoItems;
        }

        #endregion
    }
}