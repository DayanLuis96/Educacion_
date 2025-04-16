using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Usuarios
{
    public partial class ConsultaUsuario : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;



        #region Parametros
        private int _IDusuer
        {
            get
            {
                if (ViewState["_IDusuer"] == null)
                {
                    ViewState["_IDusuer"] = 0;
                }
                return (int)ViewState["_IDusuer"];
            }
            set
            {
                ViewState["_IDusuer"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPersonal();
                CargarUsuarioSMTP();

                CargarTIPOPERSONA();
                CargarPerfil();
            }
        }


        public void CargarPersonal()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                UsuariosRepeter.DataSource = dt;
                UsuariosRepeter.DataBind();
                conn.Close();



            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);

            }

        }

        protected void lbn_EstadoT_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            var Bool = validarestadoUsuario(RowNum);
            updateEstadoUser(RowNum, Bool);
            CargarPersonal();
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado', 'Usuario se ha modificado con éxito!', 'success');", true);


        }


        public void updateEstadoUser(int idUser, bool EstadoItems)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idUser;
                cmd.Parameters.Add("@ID_ACTIVO", SqlDbType.Bit).Value = !EstadoItems;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        public bool validarestadoUsuario(int idUser)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idUser;
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


        public void CargarPerfil()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("select ID,NOMBRE from [Educacion].[TR_PERFILES_Educacion]", conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            leer = cmd.ExecuteReader();

            while (leer.Read() != false)
            {
                DropDownrol.DataSource = dt;
                DropDownrol.DataTextField = "NOMBRE";
                DropDownrol.DataValueField = "ID";
                DropDownrol.DataBind();


                ddlPerfil.DataSource = dt;
                ddlPerfil.DataTextField = "NOMBRE";
                ddlPerfil.DataValueField = "ID";
                ddlPerfil.DataBind();
            }
            conn.Close();
            leer.Close();
        }


        protected void btnCredenciales_Command(object sender, CommandEventArgs e)
        {
            _IDusuer = Convert.ToInt32(e.CommandArgument.ToString());

            CargarPerfil();

            CargarDatosUsuarios(_IDusuer);

            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar2()", true);

            }
        }


        public static byte[] ImagenOriginal = null;
        public static byte[] ImagenOriginalfirma = null;
        protected void btnadjuntarfoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (filefotousuario.FileName.Equals("") == false)
                {
                    int Tamanio = filefotousuario.PostedFile.ContentLength;
                    ImagenOriginal = new byte[Tamanio];

                    filefotousuario.PostedFile.InputStream.Read(ImagenOriginal, 0, Tamanio);
                    Bitmap ImagenOriginalBinaria = new Bitmap(filefotousuario.PostedFile.InputStream);

                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);

                    imgpaciente.ImageUrl = ImagenDataUrl64;

                    if (!ClientScript.IsClientScriptBlockRegistered("key"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar2()", true);

                    }
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC!', 'error');", true);
            }
        }


        protected void btnadjuntarfirma_Click(object sender, EventArgs e)
        {
            try
            {
                if (filefirma.FileName.Equals("") == false)
                {
                    int Tamanio = filefirma.PostedFile.ContentLength;
                    ImagenOriginalfirma = new byte[Tamanio];

                    filefirma.PostedFile.InputStream.Read(ImagenOriginalfirma, 0, Tamanio);
                    Bitmap ImagenOriginalBinaria = new Bitmap(filefirma.PostedFile.InputStream);

                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginalfirma);

                    imgfirma.ImageUrl = ImagenDataUrl64;

                    if (!ClientScript.IsClientScriptBlockRegistered("key"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar2()", true);

                    }
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC!', 'error');", true);

            }


        }


        byte[] datos = new byte[0];
        byte[] datosfirma = new byte[0];
        public void CargarDatosUsuarios(int _IDusuer)
        {

            try
            {
                Boolean Existe_Usuario = false;
                int existe_foto = 0;
                int existe_firma = 0;
                if (leer != null)
                {
                    leer.Close();
                }
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = _IDusuer;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    Existe_Usuario = true;
                    //txtusuario.Text = leer.GetString(0);
                    //txtconfirmeusuario.Text = leer.GetString(0);
                    //checactivo.Checked = leer.GetBoolean(1);
                    DropDownrol.SelectedValue = leer.GetInt32(2).ToString();
                    existe_foto = leer.GetInt32(4);
                    existe_firma = leer.GetInt32(6);
                    if (existe_foto == 1)
                    {
                        ImagenOriginal = (byte[])leer["FOTO"];
                    }
                    if (existe_firma == 1)
                    {
                        ImagenOriginalfirma = (byte[])leer["FIRMA"];
                    }


                }
                conn.Close();
                leer.Close();

                if (Existe_Usuario == true)
                {

                    btnresetearclave.Visible = true;

                    if (existe_foto == 1)
                    {
                        string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                        imgpaciente.ImageUrl = ImagenDataUrl64;
                    }
                    if (existe_firma == 1)
                    {
                        string ImagenDataUrl64_FIRMA = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginalfirma);
                        imgfirma.ImageUrl = ImagenDataUrl64_FIRMA;
                    }
                }
                else
                {
                    btnresetearclave.Visible = false;

                }

            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }
        }


        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {


            GuardarUsuario();
            CargarPersonal();
        }


        public void GuardarUsuario()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = _IDusuer;

                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = Convert.ToInt32(DropDownrol.SelectedValue);
                cmd.Parameters.Add("@ID_ACTIVO", SqlDbType.Bit).Value = true;

                if (ImagenOriginal != null)
                {
                    cmd.Parameters.Add("@FOTO", SqlDbType.Image).Value = ImagenOriginal;
                }

                if (ImagenOriginalfirma != null)
                {
                    cmd.Parameters.Add("@FIRMA", SqlDbType.Image).Value = ImagenOriginalfirma;
                }

                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Guardado con Éxito!', 'success');", true);
                }

            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }
        }


        protected void btnguardarrest_Click(object sender, EventArgs e)
        {
            if (txtnuevaclave.Text == "" | txtconfirmenuevaclave.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas no pueden ser vacias, verifique', 'info');", true);
                return;
            }
            if (txtnuevaclave.Text != txtconfirmenuevaclave.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas no coinciden, verifique', 'info');", true);
                return;
            }


            CambiarClave();
        }


        public void CambiarClave()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = _IDusuer;
                cmd.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = txtnuevaclave.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Contraseña Reestablecida con éxito', 'success');", true);
                }

            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
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
            if (leer != null)
            {
                leer.Close();
            }
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
                if (_IDusuer == 0)
                {
                    validarexistencia();
                }

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

                if (_IDusuer == 0)
                {



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

                }


                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                string qry = "";
                int Operacion = 0;
                if (_IDusuer != 0)
                {
                    qry = "[Educacion].[STP_USUARIOS_Educacion]";
                    Operacion = 9;

                }
                else
                {
                    qry = "[CONFIGURACION].[STP_USUARIOS_Educacion]";
                    Operacion = 10;
                }

                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (_IDusuer != 0)
                {
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = _IDusuer;


                }
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
                if (_IDusuer == 0)
                {
                    cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = true;

                }
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value = ddlPerfil.SelectedValue;

                cmd.Parameters.Add("@TELEFONO", SqlDbType.NVarChar).Value = txttelefono.Text;
                cmd.Parameters.Add("@CORREO", SqlDbType.NVarChar).Value = txtcorreo.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = Operacion;
                int Resultado = cmd.ExecuteNonQuery();


                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Guardado con Éxito!', 'success');", true);
                    btnAtrasDetalle.Visible = false;
                    lbn_NuevoUsuario.Visible = true;
                    divUsuarios.Visible = true;
                    panelNuevoUsuario.Visible = false;
                    CargarPersonal();

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

        protected void lbn_NuevoUsuario_Click(object sender, EventArgs e)
        {
            btnAtrasDetalle.Visible = true;
            lbn_NuevoUsuario.Visible = false;
            divUsuarios.Visible = false;
            panelNuevoUsuario.Visible = true;
            divConfirContrasena.Visible = true;
            divContrasena.Visible = true;
            txtusuario.Enabled = true;
            limpiarData();

        }

        protected void btnAtrasDetalle_Click(object sender, EventArgs e)
        {
            btnAtrasDetalle.Visible = false;
            lbn_NuevoUsuario.Visible = true;
            divUsuarios.Visible = true;
            panelNuevoUsuario.Visible = false;
        }

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {
            btnRegistro.Text = "Editar Usuario";
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            btnAtrasDetalle.Visible = true;
            lbn_NuevoUsuario.Visible = false;
            divUsuarios.Visible = false;
            panelNuevoUsuario.Visible = true;
            CargarDatosusuario(RowNum, sender, e);
        }


        protected void limpiarData()
        {
            _IDusuer = 0;

            txtnumeroIdentificacion.Text = "";
            txtdigitoverificacion.Text = "";

            txtnombres.Text = "";
            txttelefono.Text = "";
            txtcorreo.Text = "";
            txtusuario.Text = "";
        }

        public void CargarDatosusuario(int usuarioID, object sender, CommandEventArgs e)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_USUARIOS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = usuarioID;
                cmd.ExecuteNonQuery();
                string Identifi = "";
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    _IDusuer = leer.GetInt32(0);
                    txttipoPersona.SelectedValue = leer.GetInt32(1).ToString();
                    Identifi = leer.GetInt32(2).ToString();
                    txtnumeroIdentificacion.Text = leer.GetString(3);
                    if (txttipoPersona.SelectedValue == "2")
                    {
                        txtdigitoverificacion.Text = leer.GetString(4);

                    }
                    txtnombres.Text = leer.GetString(5);
                    txttelefono.Text = leer.GetString(6);
                    txtcorreo.Text = leer.GetString(7);
                    txtusuario.Text = leer.GetString(8);
                    ddlPerfil.SelectedValue = leer.GetInt32(10).ToString();

                    divConfirContrasena.Visible = false;
                    divContrasena.Visible = false;
                    txtusuario.Enabled = false;
                }
                conn.Close();
                leer.Close();

                txttipopersona_SelectedIndexChanged(sender, e);
                txttipoIdentificacion.SelectedValue = Identifi;


            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }
    }
}