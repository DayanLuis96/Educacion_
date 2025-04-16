using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Security.AntiXss;

namespace Educacion.Educacion.Aplicacion.Pagina.Configuracion.Servicios
{
    public partial class Servicios : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlDataReader leer = null;
        SqlCommand cmd = null;

        #region Parametros
       

        private int _ID_servicio
        {
            get
            {
                if (ViewState["_ID_servicio"] == null)
                {
                    ViewState["_ID_servicio"] = 0;
                }
                return (int)ViewState["_ID_servicio"];
            }
            set
            {
                ViewState["_ID_servicio"] = value;
            }
        }
        #endregion

        private string[] archivosPermitidos = { ".xlsx" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["OPCION_MENU"] = "Configurar Servicios";

                CargarServicios();
                CargarAnexosPlantilla();
            }
        }

        public void CargarServicios()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_SERVICIO]", conn);
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

        protected void Btnguardar_Click(object sender, EventArgs e)
        {
            //GUARDA SERVICIO
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = txtnombre.Text;
            cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = checActivo.Checked;
            cmd.Parameters.Add("@ID_USUARIO", SqlDbType.Int).Value = Session["ID_USUARIO"];
            if (Convert.ToInt32(ViewState["ID_SERVICIO_EDITAR"]) != 0)
            {
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_SERVICIO_EDITAR"];
            }

            cmd.ExecuteReader();

            conn.Close();
            if (cmd != null)
            {

                if (Convert.ToInt32(ViewState["ID_SERVICIO_EDITAR"]) != 0)
                {
                    CargarServicios();
                    txtnombre.Text = "";
                    ViewState["ID_SERVICIO_EDITAR"] = 0;
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Datos Actualizados con exito!', 'success');", true);
                }
                else
                {
                    CargarServicios();
                    txtnombre.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Datos guardados con exito!', 'success');", true);

                }

            }
        }

        public void ELIMINARSERVICIO()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_SERVICIO"];
            cmd.ExecuteReader();
            conn.Close();
            if (cmd != null)
            {
                CargarServicios();
                txtnombre.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Servicio eliminado con exito!', 'success');", true);
            }
        }

        protected void tablaconsultar_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DETALLE
            ViewState["ID_SERVICIO"] = (((Label)(tablaconsultar.Rows[tablaconsultar.SelectedRow.RowIndex].FindControl("txtid"))).Text);
            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                CargarDetalleServicios();
                CargarUNIDADMEDIDA();
                ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);
                InactivarComponentes();
                Crekplantillas_CheckedChanged(sender, e);
            }
        }

        protected void tablaconsultar_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //ELIMINAR
            ViewState["ID_SERVICIO"] = (((Label)(tablaconsultar.Rows[e.RowIndex].FindControl("txtid"))).Text);
            ELIMINARSERVICIO();
        }

        protected void tablaconsultar_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //ACTUALIZAR
            ViewState["ID_SERVICIO_EDITAR"] = (((Label)(tablaconsultar.Rows[e.RowIndex].FindControl("txtid"))).Text);
            txtnombre.Text = HttpUtility.HtmlDecode((tablaconsultar.Rows[e.RowIndex].Cells[1].Text));
            checActivo.Checked = (((CheckBox)(tablaconsultar.Rows[e.RowIndex].FindControl("txtestado"))).Checked);

        }

        public void CargarDetalleServicios()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DETALLE_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@ID_SERVICIO", SqlDbType.Int).Value = ViewState["ID_SERVICIO"];
            cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            tabladetalle.DataSource = dt;
            tabladetalle.DataBind();
            conn.Close();

        }

        public void CargarUNIDADMEDIDA()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DETALLE_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["UNIDAD_MEDIDA"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txtunidadmedida.DataSource = dt;
            txtunidadmedida.DataValueField = "ID";
            txtunidadmedida.DataTextField = "UNIDAD_MEDIDA";
            txtunidadmedida.DataBind();
            conn.Close();
        }


        public void CargarMetodosServicios()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DETALLE_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);


            ddl_Metodo.DataSource = dt;
            ddl_Metodo.DataValueField = "ID";
            ddl_Metodo.DataTextField = "METODO";
            ddl_Metodo.DataBind();
            conn.Close();
        }
        public void CargarAnexosPlantilla()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DETALLE_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);


            ddl_anexos.DataSource = dt;
            ddl_anexos.DataValueField = "ID";
            ddl_anexos.DataTextField = "NOMBRE";
            ddl_anexos.DataBind();
            ddl_anexos.Items.Insert(0, new ListItem("Seleccione", "0"));
            conn.Close();
        }


        public void CargarMetodosConfigurados(int IdDetalle)
        {



            if (leer != null)
            {
                leer.Close();
            }
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }


            SqlCommand cmd = new SqlCommand("[Educacion].[sTP_METODO_DETALLE_SERVICIO_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@ID_DETALLE_SERVICIO", SqlDbType.Int).Value = IdDetalle;

            cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //List<DataRow> list = dt.AsEnumerable().ToList();
            List<string[]> results = dt.Select().Select(dr =>dr.ItemArray.Select(x => x.ToString()).ToArray()).ToList();
            List<string> flattenedList = results.SelectMany(x => x).ToList();

            conn.Close();


            foreach (ListItem item in ddl_Metodo.Items)
            {
                bool select = flattenedList.Any(x => x.ToString() == item.Value);
                if (select)
                {
                    item.Selected = true;
                }
            }



        }


        protected void tabladetalle_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CargarMetodosServicios();
            InactivarComponentes();
            ViewState["ID_DETALLE_EDITAR"] = (((Label)(tabladetalle.Rows[e.RowIndex].FindControl("txtiddet"))).Text);
            txtDetalleservicio.Text = HttpUtility.HtmlDecode((tabladetalle.Rows[e.RowIndex].Cells[1].Text));
            txtvalorunitario.Text = Convert.ToDouble((tabladetalle.Rows[e.RowIndex].Cells[2].Text)).ToString();
            txtunidadmedida.SelectedValue = (((Label)(tabladetalle.Rows[e.RowIndex].FindControl("txtidunidad"))).Text);
            ddl_anexos.SelectedValue = (((Label)(tabladetalle.Rows[e.RowIndex].FindControl("lblAnexoID"))).Text);
            CrekdetActivo_.Checked = (((CheckBox)(tabladetalle.Rows[e.RowIndex].FindControl("txtestadodep"))).Checked);
            Crekplantillas.Checked = (((CheckBox)(tabladetalle.Rows[e.RowIndex].FindControl("txtplantilladep"))).Checked);
            divFilePlantilla.Visible = false;
            CargarNombreArchivo(Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]));
            CargarMetodosConfigurados(Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]));
            Crekplantillas_CheckedChanged(sender, e);
        }

        protected void tabladetalle_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState["ID_DETALLE_ELIMINAR"] = (((Label)(tabladetalle.Rows[e.RowIndex].FindControl("txtiddet"))).Text);
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DETALLE_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_DETALLE_ELIMINAR"];
            cmd.ExecuteReader();
            conn.Close();
            if (cmd != null)
            {
                CargarDetalleServicios();
                txtnombre.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Detalle eliminado con exito!', 'success');", true);
            }
        }

        protected void btnguardarDetalle_Click(object sender, EventArgs e)
        {


            if (Page.IsValid)
            {

                int IdDetalle = Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]);

                if (divFilePlantilla.Visible == true)
                {

                    if (!ArchivoExcel.HasFile)
                    {
                        if (IdDetalle == 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Seleccione una plantilla!', 'warning');", true);
                            ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);

                            return;
                        }
                        else
                        {
                            if (ArchivoExcel.HasFile)
                            {
                                var extensionArchivo = Path.GetExtension(ArchivoExcel.FileName);
                                if (!archivosPermitidos.Contains(extensionArchivo))
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Formato Invalido!', 'warning');", true);
                                    ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);

                                    return;
                                }
                            }
                        }

                    }
                    else
                    {

                        var extensionArchivo = Path.GetExtension(ArchivoExcel.FileName);
                        if (!archivosPermitidos.Contains(extensionArchivo))
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Formato Invalido!', 'warning');", true);
                            ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);

                            return;
                        }
                    }
                }

                DeleteMetodos(IdDetalle);
                GuardarMetodos(IdDetalle);


                if (IsValid)
                {


                    //GUARDA SERVICIO
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("[Educacion].[STP_DETALLE_SERVICIO]", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                    cmd.Parameters.Add("@NOMBRE_UNIDAD", SqlDbType.NVarChar).Value = txtDetalleservicio.Text;
                    cmd.Parameters.Add("@TIPO_UNIDAD", SqlDbType.Int).Value = txtunidadmedida.SelectedValue;
                    cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = CrekdetActivo_.Checked;

                    if (CrekdetActivo_.Checked)
                    {
                        cmd.Parameters.Add("@ID_ANEXO", SqlDbType.Int).Value = ddl_anexos.SelectedValue;

                    }

                    cmd.Parameters.Add("@PLANTILLA", SqlDbType.Bit).Value = Crekplantillas.Checked;
                    if (txtvalorunitario.Text != "")
                    {
                        cmd.Parameters.Add("@VALOR_UNITARIO", SqlDbType.Money).Value = txtvalorunitario.Text;
                    }
                    cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];
                    cmd.Parameters.Add("@ID_SERVICIO", SqlDbType.Int).Value = ViewState["ID_SERVICIO"];
                    if (Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]) != 0)
                    {
                        int ID_Detalle1 = 0;
                        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_DETALLE_EDITAR"];

                        ID_Detalle1 = Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]);
                        if (divFilePlantilla.Visible == true)
                        {
                            datosFile(ID_Detalle1);

                        }
                    }

                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    cmd.ExecuteReader();

                    conn.Close();



                    if (divFilePlantilla.Visible == true)
                    {
                        if (Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]) == 0)
                        {
                            ConsultarIDDETALLE();
                        }
                    }


                    if (cmd != null)
                    {

                        if (Convert.ToInt32(ViewState["ID_DETALLE_EDITAR"]) != 0)
                        {
                            CargarDetalleServicios();
                            ViewState["ID_DETALLE_EDITAR"] = 0;
                            txtDetalleservicio.Text = "";
                            txtvalorunitario.Text = "";
                            CargarUNIDADMEDIDA();
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Datos Actualizados con exito!', 'success');", true);
                        }
                        else
                        {
                            CargarDetalleServicios();
                            txtDetalleservicio.Text = "";
                            CargarUNIDADMEDIDA();
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Datos guardados con exito!', 'success');", true);

                        }

                    }
                    InactivarComponentes();
                    Crekplantillas_CheckedChanged(sender, e);


                }
                ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "Modaldetalle()", true);

            }
        }

        private void InactivarComponentes()
        {
            CrekdetActivo_.Checked = false;
            Crekplantillas.Checked = false;
            divFilePlantilla.Visible = false;
            divNombrePlantilla.Visible = false;
            ddl_anexos.SelectedValue = "0";
            txtnombre.Text = "";
            txtDetalleservicio.Text = "";
        }
        private void ConsultarIDDETALLE()
        {
            int ID_Detalle = 0;

            if (leer != null)
            {
                leer.Close();
            }

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            string sql1 = ("DECLARE @ID_MAXIMO INT = (select MAX(ID)" +
                " FROM [Educacion].[TP_DETALLE_SERVICIO]  WHERE USUARIO = '" + Session["USUARIO"] + "' )  " +
                "SELECT ID FROM [Educacion].[TP_DETALLE_SERVICIO]  WHERE ID = @ID_MAXIMO");
            cmd = new SqlCommand(sql1, conn);
            leer = cmd.ExecuteReader();
            if (leer.Read())
            {
                ViewState["ID_DETALLE_GUARDA"] = leer.GetInt32(0);
            }
            conn.Close();
            leer.Close();

            ID_Detalle = Convert.ToInt32(ViewState["ID_DETALLE_GUARDA"]);
            datosFile(ID_Detalle);
        }

        /// <summary>
        /// Metodo para Capturar valores del FILE seleccionado
        /// LM - 25-01-2023
        /// </summary>
        /// <param name="IdDetalleServicio"></param>
        private void datosFile(int IdDetalleServicio)
        {
            var nombreArchivo = "";
            var extensionArchivo = "";
            var realname = "";

            if (ArchivoExcel.HasFile)
            {

                nombreArchivo = Path.GetFileNameWithoutExtension(ArchivoExcel.FileName);
                extensionArchivo = Path.GetExtension(ArchivoExcel.FileName);
                realname = Path.GetFileName(ArchivoExcel.FileName);
                int Tamanio = ArchivoExcel.PostedFile.ContentLength;

                var Archivo = new byte[Tamanio];
                Stream myStream = ArchivoExcel.PostedFile.InputStream;
                using (MemoryStream ms = new MemoryStream())
                {
                    myStream.CopyTo(ms);
                    Archivo = ms.ToArray();

                    GuardarPlantilla(IdDetalleServicio, nombreArchivo, extensionArchivo, realname, Archivo);
                }
            }


        }
        /// <summary>
        /// Metodo que guarda la plantilla segun el Detalle del Servicio
        /// LM- Desarrollo Universidad-Nacional
        /// </summary>
        /// <param name="IdDetalle"></param>
        /// <param name="nombreArchivo"></param>
        /// <param name="extensionArchivo"></param>
        /// <param name="realname"></param>
        /// <param name="ArchivoDoc"></param>
        private void GuardarPlantilla(int IdDetalle, string nombreArchivo, string extensionArchivo, string realname, byte[] ArchivoDoc)
        {
            //GUARDA PLANTILLA
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[sTP_PLANTILLA_DETALLE_SERVICIO_Educacion]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@ID_DETALLE_SERVICIO", SqlDbType.Int).Value = IdDetalle;
            cmd.Parameters.Add("@nombreArchivo", SqlDbType.VarChar).Value = nombreArchivo;
            cmd.Parameters.Add("@extensionArchivo", SqlDbType.VarChar).Value = extensionArchivo;
            cmd.Parameters.Add("@realname", SqlDbType.VarChar).Value = realname;
            cmd.Parameters.Add("@ArchivoDoc", SqlDbType.VarBinary).Value = ArchivoDoc;
            cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];

            cmd.ExecuteReader();

            conn.Close();
        }


        private void GuardarMetodos(int IdDetalle)
        {
            var Metodos_ = ddl_Metodo.Items.Cast<ListItem>().Where(item => item.Selected).Select(x => x.Value).ToArray();

            if (Metodos_.Any())
            {
                List<int> MetodosID_ = new List<int>(Array.ConvertAll(Metodos_, int.Parse));

                foreach (int item in MetodosID_)
                {
                    //GUARDA METODOS
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmdz = new SqlCommand("[Educacion].[sTP_METODO_DETALLE_SERVICIO_Educacion]", conn);
                    cmdz.CommandType = CommandType.StoredProcedure;
                    cmdz.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                    cmdz.Parameters.Add("@ID_DETALLE_SERVICIO", SqlDbType.Int).Value = IdDetalle;
                    cmdz.Parameters.Add("@ID_METODO", SqlDbType.Int).Value = item;
                    cmdz.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];
                    cmdz.ExecuteReader();

                    conn.Close();
                }

            }


        }


        private void DeleteMetodos(int IdDetalle)
        {


            //GUARDA METODOS
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmdz = new SqlCommand("[Educacion].[sTP_METODO_DETALLE_SERVICIO_Educacion]", conn);
            cmdz.CommandType = CommandType.StoredProcedure;
            cmdz.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            cmdz.Parameters.Add("@ID_DETALLE_SERVICIO", SqlDbType.Int).Value = IdDetalle;

            cmdz.ExecuteReader();

            conn.Close();



        }


        protected void Crekplantillas_CheckedChanged(object sender, EventArgs e)
        {
            if (Crekplantillas.Checked)
            {
                divFilePlantilla.Visible = true;
                divNombreDetalle.Attributes.Add("class", "col-md-4");
                divAnexo.Attributes.Add("class", "col-md-2");
                divAnexo.Visible = true;
            }
            else
            {
                divFilePlantilla.Visible = false;
                divNombreDetalle.Attributes.Add("class", "col-md-6");
                divAnexo.Visible = false;
            }
        }

        public void CargarNombreArchivo(int IdDetalle)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[sTP_PLANTILLA_DETALLE_SERVICIO_Educacion]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@ID_DETALLE_SERVICIO", SqlDbType.Int).Value = IdDetalle;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    NombreArchivoAdjunto.Text = leer.GetString(0);
                    divNombrePlantilla.Visible = true;

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }


        protected void btnAsociarProtocolo_Command(object sender, CommandEventArgs e)
        {
            txb_Texto.Text = "";
            _ID_servicio = Convert.ToInt32(e.CommandArgument.ToString());
            CargarProtocoloServicio(_ID_servicio);
            CargarNombreServicio(_ID_servicio);
            ClientScript.RegisterStartupScript(this.GetType(), "key", "ModaldetalleProcolo()", true);
        }

        public void CargarNombreServicio(int ArticuloID)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_Educacion_PROTOCOLO_SERVICIO]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.Parameters.Add("@ID_SERVICIO", SqlDbType.Int).Value = ArticuloID;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    NombreServicio.InnerText = HttpUtility.HtmlDecode(leer.GetString(0));

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }
        public void CargarProtocoloServicio(int ArticuloID)
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
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_Educacion_PROTOCOLO_SERVICIO]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@ID_SERVICIO", SqlDbType.Int).Value = ArticuloID;
                cmd.ExecuteNonQuery();

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    txb_Texto.Text = HttpUtility.HtmlDecode(leer.GetString(2));

                }
                conn.Close();
                leer.Close();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Error de Comandos!', 'error');", true);
            }

        }

        private void guardarProtocolo(int IDServicio)
        {

            if (IsValid)
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_Educacion_PROTOCOLO_SERVICIO]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ID_SERVICIO", SqlDbType.Int).Value = IDServicio;
                cmd.Parameters.Add("@PROTOCOLO", SqlDbType.VarChar).Value = AntiXssEncoder.HtmlEncode(txb_Texto.Text, true);
                cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Éxitoso!', 'Protocolo Configurado!', 'success');", true);
                txb_Texto.Text = "";

            }

        }

        protected void BtnGuardarProtoccolo_Click(object sender, EventArgs e)
        {
            guardarProtocolo(_ID_servicio);
        }

        protected void btnPdf_Command(object sender, CommandEventArgs e)
        {
            _ID_servicio = Convert.ToInt32(e.CommandArgument.ToString());
            ClientScript.RegisterStartupScript(this.GetType(), "key", "ModaldetallePDF()", true);
        }

        protected void BtnGuardarPdf_Click(object sender, EventArgs e)
        {
            if (ArchivoPdf.HasFile)
            {
                ///Nuevos datos
                int bandera = 0;
                foreach (HttpPostedFile uploadedFile in ArchivoPdf.PostedFiles)
                {


                    int Tamanio = ArchivoPdf.PostedFiles[bandera].ContentLength;

                    var Archivo = new byte[Tamanio];
                    Stream myStream = ArchivoPdf.PostedFiles[bandera].InputStream;
                    using (MemoryStream ms = new MemoryStream())
                    {
                        myStream.CopyTo(ms);
                        Archivo = ms.ToArray();

                        GuardarPDF(Archivo);
                    }

                    bandera++;

                }

            }
        }

        public void GuardarPDF(byte[] PDF)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_Educacion_PROTOCOLO_SERVICIO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ID_SERVICIO", SqlDbType.Int).Value = _ID_servicio;
            cmd.Parameters.Add("@PDF", SqlDbType.VarBinary).Value = PDF;
            cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar).Value = Session["USUARIO"];
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.ExecuteNonQuery();

            if (cmd != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Éxitoso!', 'Protocolo Configurado!', 'success');", true);

            }

            conn.Close();
        }

        protected void Unnamed_Command(object sender, CommandEventArgs e) //CARGAR PDF
        {

        }
    }
}