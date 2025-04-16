using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Metodos
{
    public partial class Metodos : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;


        private int _ID_ARTICULO_X_METODO
        {
            get
            {
                if (Session["_ID_ARTICULO_X_METODO"] == null)
                {
                    Session["_ID_ARTICULO_X_METODO"] = 0;
                }
                return (int)Session["_ID_ARTICULO_X_METODO"];
            }
            set
            {
                Session["_ID_ARTICULO_X_METODO"] = value;
            }
        }


        private int _ID_DETALLE_X_METODO_MUESTRAS
        {
            get
            {
                if (Session["_ID_DETALLE_X_METODO_MUESTRAS"] == null)
                {
                    Session["_ID_DETALLE_X_METODO_MUESTRAS"] = 0;
                }
                return (int)Session["_ID_DETALLE_X_METODO_MUESTRAS"];
            }
            set
            {
                Session["_ID_DETALLE_X_METODO_MUESTRAS"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMetodos();
            }
        }

        public void CargarMetodos()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_METODOS_PROCESAMIENTO_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                RepeterMetodos.DataSource = dt;
                RepeterMetodos.DataBind();
                conn.Close();



            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);

            }

        }


        protected void BtnNuevo_Click(object sender, EventArgs e)
        {
            divConsultarMetodos.Visible = false;
            divNuevoMetodo.Visible = true;
            BtnNuevo.Visible = false;
            btnAtras.Visible = true;
            LIMPIAR();
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            divConsultarMetodos.Visible = true;
            divNuevoMetodo.Visible = false;
            BtnNuevo.Visible = true;
            btnAtras.Visible = false;
            LIMPIAR();
        }

        public void LIMPIAR()
        {
            txtnombreMetodo.Text = "";
            txtobservaciones.Text = "";
            ChecTermico.Checked = false;
        }

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {
            ViewState["ID_METODO_GUARDADO"]= Convert.ToInt32(e.CommandArgument.ToString());
            CARGARDATOS(Convert.ToInt32(ViewState["ID_METODO_GUARDADO"]));

            
            divConsultarMetodos.Visible = false;
            divNuevoMetodo.Visible = true;
            BtnNuevo.Visible = false;
            btnAtras.Visible = true;
            CargarAdjuntosCOnfigurados(Convert.ToInt32(ViewState["ID_METODO_GUARDADO"]));

        }


        public void CARGARDATOS(int ID_METODO)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_METODOS_PROCESAMIENTO_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ID_METODO;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                   
                    txtnombreMetodo.Text = leer.GetString(1);
                    txtobservaciones.Text = leer.GetString(2);
                    checActivo.Checked=  leer.GetBoolean(3);
                    ChecTermico.Checked=  leer.GetBoolean(4);

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }
        }


        public void CargarAdjuntosCOnfigurados(int ID_METODO)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_PROTOCOLO_PDF_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@ID_METODO", SqlDbType.Int).Value = ID_METODO;

            cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            AdjuntosRepeter.DataSource = dt;
            AdjuntosRepeter.DataBind();
            conn.Close();

            if (AdjuntosRepeter.Items.Count > 0)
            {
                divAdjuntos.Visible = true;
            }
        }

        protected void Btnguardar_Click(object sender, EventArgs e) //Guardar Metodos
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[Educacion].[STP_METODOS_PROCESAMIENTO_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_METODO"];
                cmd.Parameters.Add("@METODO", SqlDbType.NVarChar).Value = txtnombreMetodo.Text;
                cmd.Parameters.Add("@OBSERVACIONES", SqlDbType.NVarChar).Value = txtobservaciones.Text;
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = checActivo.Checked;
                cmd.Parameters.Add("@PERFILTERMICO", SqlDbType.Bit).Value = ChecTermico.Checked;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                leer = cmd.ExecuteReader();
                if (leer.Read())
                {
                    ViewState["ID_METODO_GUARDADO"] = leer.GetInt32(0);
                }
                leer.Close();
                conn.Close();

                if (cmd != null)
                {
                  
                    datosFile(Convert.ToInt32(ViewState["ID_METODO_GUARDADO"]));
                    CargarMetodos();
                    divConsultarMetodos.Visible = true;
                    divNuevoMetodo.Visible = false;
                    BtnNuevo.Visible = true;
                    btnAtras.Visible = false;
                    LIMPIAR();
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Guardado con Éxito!', 'success');", true);
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }

        }



        private void datosFile(int Idmetodo)
        {
            var nombreArchivo = "";
            var extensionArchivo = "";
            var realname = "";

            if (files.HasFile)
            {
                ///Nuevos datos
                int bandera = 0;
                foreach (HttpPostedFile uploadedFile in files.PostedFiles)
                {

                    nombreArchivo = Path.GetFileNameWithoutExtension(files.PostedFiles[bandera].FileName);
                    extensionArchivo = Path.GetExtension(files.PostedFiles[bandera].FileName);
                    realname = Path.GetFileName(files.PostedFiles[bandera].FileName);
                    int Tamanio = files.PostedFiles[bandera].ContentLength;

                    var Archivo = new byte[Tamanio];
                    Stream myStream = files.PostedFiles[bandera].InputStream;
                    using (MemoryStream ms = new MemoryStream())
                    {
                        myStream.CopyTo(ms);
                        Archivo = ms.ToArray();

                        GuardarProtolos(Idmetodo, nombreArchivo, extensionArchivo, realname, Archivo);
                    }

                    bandera++;

                }

            }


        }


        /// <param name="Idmetodo_"></param>
        /// <param name="nombreArchivo"></param>
        /// <param name="extensionArchivo"></param>
        /// <param name="realname"></param>
        /// <param name="ArchivoDoc"></param>
        private void GuardarProtolos(int Idmetodo_, string nombreArchivo, string extensionArchivo, string realname, byte[] ArchivoDoc)
        {
            //GUARDA PLANTILLA
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_PROTOCOLO_PDF_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@ID_METODO", SqlDbType.Int).Value = Idmetodo_;
            cmd.Parameters.Add("@nombreArchivo", SqlDbType.VarChar).Value = nombreArchivo;
            cmd.Parameters.Add("@extensionArchivo", SqlDbType.VarChar).Value = extensionArchivo;
            cmd.Parameters.Add("@realname", SqlDbType.VarChar).Value = realname;
            cmd.Parameters.Add("@ArchivoDoc", SqlDbType.VarBinary).Value = ArchivoDoc;
            cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];

            cmd.ExecuteReader();

            conn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Cargados!', 'Adjuntos guardados con exito!', 'success');", true);

        }

        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            ELiminarAdjunto(RowNum);
            CargarAdjuntosCOnfigurados( Convert.ToInt32(ViewState["ID_METODO_GUARDADO"]));

        }


        protected void ELiminarAdjunto(int IdAjunto)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_PROTOCOLO_PDF_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = IdAjunto;

            cmd.ExecuteNonQuery();
            if (cmd != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Eliminado!', 'Eliminado con éxito!', 'success');", true);
            }

        }

        #region CONfiguracionMetodo_Artucylos

       
        /// <summary>
        /// /
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAsociarArtoculo_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            _ID_DETALLE_X_METODO_MUESTRAS = RowNum;
            banerLateral.Attributes.Add("class", "demo_changer right-sidebar active");
            banerLateral.Attributes.Add("style", "right: 0px;");
            divBotonCerrar.Visible = true;
            banerLateral.Visible = true;
            validarNombreDetalleServicio(_ID_DETALLE_X_METODO_MUESTRAS);
            CargarTablaArticulos();
            CargarTablaArticulosConfigurados(_ID_DETALLE_X_METODO_MUESTRAS);
            LimpiarCampos();
        }


        protected void btnCerrarBaner_Click(object sender, EventArgs e)
        {
            banerLateral.Attributes.Add("class", "demo_changer right-sidebar");
            banerLateral.Attributes.Add("style", "right: -1090px;");
            divBotonCerrar.Visible = false;
            banerLateral.Visible = false;
            LimpiarCampos();
        }


        protected void LimpiarCampos()
        {
            txtCantidad.Text = "";
            lblNombreArticulo.Text = "No se ha seleccionado un Artículo";
        }

        protected void btnAtrasDetalle_Click(object sender, EventArgs e)
        {
            banerLateral.Attributes.Add("class", "demo_changer right-sidebar");
            banerLateral.Attributes.Add("style", "right: -1090px;");
            divBotonCerrar.Visible = false;
            banerLateral.Visible = false;


            //if (!ClientScript.IsClientScriptBlockRegistered("key"))
            //{
            //    CargarDetalleServicios();
            //    CargarUNIDADMEDIDA();
            //    ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);
            //}
        }

        private void guardarArticulo(int IDArticuloGuardado)
        {

            if (IsValid)
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ID_METODO", SqlDbType.Int).Value = _ID_DETALLE_X_METODO_MUESTRAS;
                cmd.Parameters.Add("@ID_ARTICULO", SqlDbType.Int).Value = _ID_ARTICULO_X_METODO;
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = true;
                cmd.Parameters.Add("@CANTIDAD", SqlDbType.Decimal).Value = Convert.ToDecimal(txtCantidad.Text);

                cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();


                if (IDArticuloGuardado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado!', 'Artículo Editado con éxito!', 'success');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Creado', 'Artículo Asociado con éxito!', 'success');", true);

                }


                CargarTablaArticulosConfigurados(_ID_DETALLE_X_METODO_MUESTRAS);
                LimpiarCampos();


            }

        }

        public void CargarTablaArticulos()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_Educacion]", conn);
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                tbArticulos.DataSource = dt;
                tbArticulos.DataBind();
                conn.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        public void CargarTablaArticulosConfigurados(int IdDetalleServicio)
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@ID_METODO", SqlDbType.Int).Value = IdDetalleServicio;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                RepeaterArticulos.DataSource = dt;
                RepeaterArticulos.DataBind();
                conn.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            int iDvALIDADO = validarID_GUARDADO();
            if (iDvALIDADO != 0)
            {
                guardarArticulo(iDvALIDADO);
            }
            else
            {
                guardarArticulo(0);
            }

        }


        protected void lbn_EstadoT_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            var Bool = validarestadoItemsMenuPrincipal(RowNum);
            updateEstadoArticulo(RowNum, Bool);
            CargarTablaArticulosConfigurados(_ID_DETALLE_X_METODO_MUESTRAS);
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Modificado', 'La opción se ha modificado con éxito!', 'success');", true);


        }


        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            _ID_ARTICULO_X_METODO = RowNum;
            validarNombreArticulo(RowNum);
        }


        public void validarNombreArticulo(int id)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    lblNombreArticulo.Text = leer.GetString(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        public void validarNombreDetalleServicio(int id)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    lblNombreDetalleServicio.Text = leer.GetString(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        public bool validarestadoItemsMenuPrincipal(int id)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
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

        public void updateEstadoArticulo(int id, bool EstadoItems)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = !EstadoItems;
                cmd.ExecuteNonQuery();

                conn.Close();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }



        protected void btnEditar_Command_(object sender, CommandEventArgs e)
        {
            int RowNum = Convert.ToInt32(e.CommandArgument.ToString());
            CargarDatosArticulo(RowNum);
            validarNombreArticulo(_ID_ARTICULO_X_METODO);

        }


        public void CargarDatosArticulo(int ArticuloID)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ArticuloID;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    _ID_DETALLE_X_METODO_MUESTRAS = leer.GetInt32(0);
                    _ID_ARTICULO_X_METODO = leer.GetInt32(1);
                    txtCantidad.Text = leer.GetDecimal(2).ToString();


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        public int validarID_GUARDADO()
        {
            int idItems = 0;
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ARTICULOS_REQUERIDOS_MUESTRAS_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
                cmd.Parameters.Add("@ID_METODO", SqlDbType.Int).Value = _ID_DETALLE_X_METODO_MUESTRAS;
                cmd.Parameters.Add("@ID_ARTICULO", SqlDbType.Int).Value = _ID_ARTICULO_X_METODO;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();

                if (leer.Read() != false)
                {
                    idItems = leer.GetInt32(0);


                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

            return idItems;
        }


        #endregion
    }
}