using Educacion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Akupara.Educacion.Aplicacion.Pagina.Config_Institucion
{
    public partial class Config_Institucion : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCalendario();
                CargarSector();
                CargarDepartamentos();
                CargarZona();
                CargarEditar();

                if (ViewState["ID_DETARTAMENTO"] != null)
                {
                    txtdepartamento.SelectedValue = ViewState["ID_DETARTAMENTO"].ToString();
                    CargarMunicipio();

                    txtmunicipio.SelectedValue = ViewState["ID_MUNICIPIO"].ToString();
                }

            }
        }

        public void CargarEditar()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    ViewState["ID_INSTITUCION"] = leer.GetInt32(0);
                    txtnit.Text = leer.GetString(1);
                    txtnombreInstitucion.Text = leer.GetString(2);
                    txtAbreviatura.Text = leer.GetString(3);
                    txtCodDane.Text = leer.GetString(4);
                    txtCodIcfes.Text = leer.GetString(5);
                    txtcalendario.SelectedValue = leer.GetInt32(6).ToString();
                    txtsector.SelectedValue = leer.GetInt32(7).ToString();
                    txtTelefonos.Text = leer.GetString(8).ToString();
                    txtPaginaWeb.Text = leer.GetString(9).ToString();
                    txtFax.Text = leer.GetString(10).ToString();
                    ViewState["ID_DETARTAMENTO"] = leer.GetInt32(11).ToString();
                    ViewState["ID_MUNICIPIO"] = leer.GetInt32(12).ToString();
                    txtzona.SelectedValue = leer.GetInt32(13).ToString();
                    txtdireccion.Text = leer.GetString(14).ToString();
                    txtBarrio.Text = leer.GetString(15).ToString();
                    ViewState["ESCUDO"] = (byte[])leer["ESCUDO"];
                    ViewState["BANDERA"] = (byte[])leer["BANDERA"];
                    ViewState["ID_RECTOR"] = (int)leer["ID_RECTOR"];
                    ViewState["ID_AUXILIAR"] = (int)leer["ID_AUXILIAR"];
                    txtRector.Text = (string)leer["RECTOR"];
                    txtAuxiliar.Text = (string)leer["AUXILIAR"];
                }
                conn.Close();
                leer.Close();

                if (ViewState["ESCUDO"] != null)
                {
                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])ViewState["ESCUDO"]);
                    imgEscudo.ImageUrl = ImagenDataUrl64;
                }
                if (ViewState["BANDERA"] != null)
                {
                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String((byte[])ViewState["BANDERA"]);
                    ImgBandera.ImageUrl = ImagenDataUrl64;
                }

            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Algunos datos no se cargaron correctamente!', 'info');", true);
            }
        }

        public void CargarCalendario()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["NOMBRE"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txtcalendario.DataSource = dt;
            txtcalendario.DataValueField = "ID";
            txtcalendario.DataTextField = "NOMBRE";
            txtcalendario.DataBind();
            conn.Close();
        }
        public void CargarSector()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["NOMBRE"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txtsector.DataSource = dt;
            txtsector.DataValueField = "ID";
            txtsector.DataTextField = "NOMBRE";
            txtsector.DataBind();
            conn.Close();
        }

        public void CargarDepartamentos()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["NOMBRE"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txtdepartamento.DataSource = dt;
            txtdepartamento.DataValueField = "ID";
            txtdepartamento.DataTextField = "NOMBRE";
            txtdepartamento.DataBind();
            conn.Close();
        }

        public void CargarZona()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["NOMBRE"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txtzona.DataSource = dt;
            txtzona.DataValueField = "ID";
            txtzona.DataTextField = "NOMBRE";
            txtzona.DataBind();
            conn.Close();
        }

        public void CargarMunicipio()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
            cmd.Parameters.Add("@ID_DEPARTAMENTO", SqlDbType.Int).Value = txtdepartamento.SelectedValue.ToString();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            DataRow dataRow = dt.NewRow();
            dataRow["NOMBRE"] = "Seleccione";
            dt.Rows.InsertAt(dataRow, 0);

            txtmunicipio.DataSource = dt;
            txtmunicipio.DataValueField = "ID";
            txtmunicipio.DataTextField = "NOMBRE";
            txtmunicipio.DataBind();
            conn.Close();
        }


        protected void txtdepartamento_TextChanged(object sender, EventArgs e)
        {
            if (txtdepartamento.SelectedValue != "")
            {
                CargarMunicipio();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //Guardar
            if (txtcalendario.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Por favor seleccione el calendario', 'Mensaje')", true);
                return;

            }
            if (txtdepartamento.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Por favor seleccione el departamento', 'Mensaje')", true);
                return;

            }
            if (txtmunicipio.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Por favor seleccione el municipio', 'Mensaje')", true);
                return;

            }
            if (txtzona.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Por favor seleccione la zona', 'Mensaje')", true);
                return;
            }

            try
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@NIT", SqlDbType.VarChar).Value = txtnit.Text;
                cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar).Value = txtnombreInstitucion.Text;
                cmd.Parameters.Add("@ABREVIATURA", SqlDbType.VarChar).Value = txtAbreviatura.Text;
                cmd.Parameters.Add("@CODIGO_DANE", SqlDbType.VarChar).Value = txtCodDane.Text;
                cmd.Parameters.Add("@CODIGO_ICFES", SqlDbType.VarChar).Value = txtCodIcfes.Text;
                cmd.Parameters.Add("@ID_CALENDARIO", SqlDbType.Int).Value = txtcalendario.SelectedValue;
                cmd.Parameters.Add("@ID_SECTOR", SqlDbType.Int).Value = txtsector.SelectedValue;
                cmd.Parameters.Add("@TELEFONOS", SqlDbType.VarChar).Value = txtTelefonos.Text;
                cmd.Parameters.Add("@PAGINA_WEB", SqlDbType.VarChar).Value = txtPaginaWeb.Text;
                cmd.Parameters.Add("@FAX", SqlDbType.VarChar).Value = txtFax.Text;
                cmd.Parameters.Add("@ID_DEPARTAMENTO", SqlDbType.Int).Value = txtdepartamento.SelectedValue;
                cmd.Parameters.Add("@ID_MUNICIPIO", SqlDbType.Int).Value = txtmunicipio.SelectedValue;
                cmd.Parameters.Add("@ID_ZONA", SqlDbType.Int).Value = txtzona.SelectedValue;
                cmd.Parameters.Add("@DIRECCION", SqlDbType.VarChar).Value = txtdireccion.Text;
                cmd.Parameters.Add("@BARRIO", SqlDbType.VarChar).Value = txtBarrio.Text;
                cmd.Parameters.Add("@ID_RECTOR", SqlDbType.Int).Value = ViewState["ID_RECTOR"];
                cmd.Parameters.Add("@ID_AUXILIAR", SqlDbType.Int).Value = ViewState["ID_AUXILIAR"];

                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();

                conn.Close();


                if (cmd != null)
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.success('Guardado con Exito', 'Mensaje')", true);
                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Verifique! Datos No Guardados!', 'error');", true);

                }

            }
            catch (Exception error)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Error de Comandos!', 'error');", true);

            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        public static byte[] Escudo = null;
        public static byte[] Bandera = null;
        protected void btnGuardarEscudoo_Click(object sender, EventArgs e)
        {
            try
            {
                if (fileEscudo.FileName.Equals("") == false)
                {
                    int Tamanio = fileEscudo.PostedFile.ContentLength;
                    Escudo = new byte[Tamanio];

                    fileEscudo.PostedFile.InputStream.Read(Escudo, 0, Tamanio);
                    Bitmap ImagenOriginalBinaria = new Bitmap(fileEscudo.PostedFile.InputStream);

                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(Escudo);

                    imgEscudo.ImageUrl = ImagenDataUrl64;



                    GuardarImagen();
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC', 'info');", true);

            }



        }

        public void GuardarImagen()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[EDUCACION].[STP_INSTITUCION]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if (Escudo != null)
                {
                    cmd.Parameters.Add("@ESCUDO", SqlDbType.Image).Value = Escudo;
                }
                if (Bandera != null)
                {
                    cmd.Parameters.Add("@BANDERA", SqlDbType.Image).Value = Bandera;
                }
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Escudo Guardado con Exito', 'success');", true);
                    txtNohayEscudo.Visible = false;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Error al Guardar', 'info');", true);
                }

            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Error al intentar Guardar', 'info');", true);
            }
        }

        protected void Btncargarbandera_Click(object sender, EventArgs e)
        {
            try
            {
                if (Filebandera.FileName.Equals("") == false)
                {
                    int Tamanio = Filebandera.PostedFile.ContentLength;
                    Bandera = new byte[Tamanio];

                    Filebandera.PostedFile.InputStream.Read(Bandera, 0, Tamanio);
                    Bitmap ImagenOriginalBinaria = new Bitmap(Filebandera.PostedFile.InputStream);

                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(Bandera);

                    ImgBandera.ImageUrl = ImagenDataUrl64;



                    GuardarImagen();
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje Total Quality', 'Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC', 'info');", true);

            }
        }

        protected void TablaTerceroR_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["ID_RECTOR"] = (((Label)(TablaTerceroR.Rows[TablaTerceroR.SelectedRow.RowIndex].FindControl("txtid"))).Text);

            txtRector.Text = (((Label)(TablaTerceroR.Rows[TablaTerceroR.SelectedRow.RowIndex].FindControl("NUMERO_IDENTIFICACION"))).Text) + "-" + (((Label)(TablaTerceroR.Rows[TablaTerceroR.SelectedRow.RowIndex].FindControl("NOMBRE_COMPLETO"))).Text);

            txtRector.Focus();
            PanelTerceroRector.Visible = false;

        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            BuscarRector();
        }

        public void BuscarRector()
        {
            if (txtbuscarRector.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Ingrese numero de documento o nombre del cliente', 'info');", true);
                return;
            }
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_TERCEROS_P_N]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@NOMBRE_COMPLETO", SqlDbType.NVarChar).Value = txtbuscarRector.Text;
            cmd.Parameters.Add("@NUMERO_IDENTIFICACION", SqlDbType.NVarChar).Value = txtbuscarRector.Text;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            //   cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            TablaTerceroR.DataSource = dt;
            TablaTerceroR.DataBind();
            conn.Close();

            if (TablaTerceroR.Rows.Count == 0)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'La busqueda no retorno datos', 'info');", true);

            }
            else
            {
                if (TablaTerceroR.Rows.Count == 1)
                {
                    foreach (GridViewRow data in TablaTerceroR.Rows)
                    {
                        ViewState["ID_RECTOR"] = (((Label)(data.FindControl("txtid"))).Text);
                        txtRector.Text = (((Label)(data.FindControl("NUMERO_IDENTIFICACION"))).Text) + "-" + (((Label)(data.FindControl("NOMBRE_COMPLETO"))).Text);

                        PanelTerceroRector.Visible = false;
                        txtRector.Focus();
                    }

                }
                else
                {
                    PanelTerceroRector.Visible = true;
                    txtRector.Focus();

                }
            }
        }

        protected void TablaTerceroAux_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["ID_AUXILIAR"] = (((Label)(TablaTerceroAux.Rows[TablaTerceroAux.SelectedRow.RowIndex].FindControl("txtid"))).Text);

            txtAuxiliar.Text = (((Label)(TablaTerceroAux.Rows[TablaTerceroAux.SelectedRow.RowIndex].FindControl("NUMERO_IDENTIFICACION"))).Text) + "-" + (((Label)(TablaTerceroAux.Rows[TablaTerceroAux.SelectedRow.RowIndex].FindControl("NOMBRE_COMPLETO"))).Text);

            txtAuxiliar.Focus();
            PanelTerceroAuxiliar.Visible = false;
        }

        protected void btnBuscarAux_Click(object sender, EventArgs e)
        {
            BuscarAuxiliar();
        }

        protected void txtbuscarAux_TextChanged(object sender, EventArgs e)
        {
            BuscarAuxiliar();
        }

        public void BuscarAuxiliar()
        {
            if (txtbuscarAux.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'Ingrese numero de documento o nombre del cliente', 'info');", true);
                return;
            }
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_TERCEROS_P_N]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@NOMBRE_COMPLETO", SqlDbType.NVarChar).Value = txtbuscarAux.Text;
            cmd.Parameters.Add("@NUMERO_IDENTIFICACION", SqlDbType.NVarChar).Value = txtbuscarAux.Text;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            //   cmd.ExecuteNonQuery();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            TablaTerceroAux.DataSource = dt;
            TablaTerceroAux.DataBind();
            conn.Close();

            if (TablaTerceroAux.Rows.Count == 0)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje', 'La busqueda no retorno datos', 'info');", true);

            }
            else
            {
                if (TablaTerceroAux.Rows.Count == 1)
                {
                    foreach (GridViewRow data in TablaTerceroAux.Rows)
                    {
                        ViewState["ID_AUXILIAR"] = (((Label)(data.FindControl("txtid"))).Text);
                        txtAuxiliar.Text = (((Label)(data.FindControl("NUMERO_IDENTIFICACION"))).Text) + "-" + (((Label)(data.FindControl("NOMBRE_COMPLETO"))).Text);

                        PanelTerceroAuxiliar.Visible = false;
                        txtAuxiliar.Focus();
                    }

                }
                else
                {
                    PanelTerceroAuxiliar.Visible = true;
                    txtAuxiliar.Focus();

                }
            }
        }
    }
}