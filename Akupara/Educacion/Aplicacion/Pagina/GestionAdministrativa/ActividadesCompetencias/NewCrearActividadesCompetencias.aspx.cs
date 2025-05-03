using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Educacion;

namespace Akupara.Educacion.Aplicacion.Pagina.GestionAdministrativa.ActividadesCompetencias
{
    public partial class NewCrearActividadesCompetencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListas("Areas");
                CargarListas("Grados");
                CargarListas("Asignatura");
                CargarListas("Periodos");
                CargarListas("Tipo");
                CargarListasCompetencias("Competencia");
                CargarListasCriterio(true);
                CargarListasCriterio(false);
            }
        }
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;

        public void CargarListas(String Movimiento)
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[QRY_ACTIVADES_EDUCACION]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Movimiento == "Areas")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            }
            if (Movimiento == "Grados")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            }
            if (Movimiento == "Asignatura")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            }
            if (Movimiento == "Periodos")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
            }
            if (Movimiento == "Tipo")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (Movimiento == "Areas")
            {
                txtarea.DataSource = dt;
                txtarea.DataValueField = "ID";
                txtarea.DataTextField = "NOMBRE";
                txtarea.DataBind();
            }
            if (Movimiento == "Grados")
            {
                txtgrado.DataSource = dt;
                txtgrado.DataValueField = "ID";
                txtgrado.DataTextField = "NOMBRE";
                txtgrado.DataBind();
            }
            if (Movimiento == "Asignatura")
            {
                txtasignatura.DataSource = dt;
                txtasignatura.DataValueField = "ID";
                txtasignatura.DataTextField = "NOMBRE";
                txtasignatura.DataBind();
            }
            if (Movimiento == "Periodos")
            {
                txtperiodo.DataSource = dt;
                txtperiodo.DataValueField = "ID";
                txtperiodo.DataTextField = "NOMBRE";
                txtperiodo.DataBind();
            }
            if (Movimiento == "Tipo")
            {
                txttipoactividad.DataSource = dt;
                txttipoactividad.DataValueField = "ID";
                txttipoactividad.DataTextField = "NOMBRE";
                txttipoactividad.DataBind();
            }
            conn.Close();
        }

        protected void btncompetencia_Click(object sender, EventArgs e)
        {
            panelcompetencia.Visible = true;
            panelcriterios.Visible = false;
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
            ConsultarCompetencias();
        }

        protected void btnguardartodos_Click(object sender, EventArgs e)
        {
            if (panelcompetencia.Visible == true)
            {
                GuardarCompetencias();
            }
            if (panelcriterios.Visible == true)
            {
                GuardarCriterios(checescriterio.Checked);
            }

        }
        public void GuardarCriterios(Boolean Escriterio)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_CRITERIOS_ACTIVIDADES]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = txtcriterioscreados.Text;
            cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 1;
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
            if (Escriterio == true)
            {
                cmd.Parameters.Add("@ES_CRITERIO", SqlDbType.Bit).Value = true;
                cmd.Parameters.Add("@ES_ACTIVIDAD", SqlDbType.Bit).Value = false;
            }
            else
            {
                cmd.Parameters.Add("@ES_CRITERIO", SqlDbType.Bit).Value = false;
                cmd.Parameters.Add("@ES_ACTIVIDAD", SqlDbType.Bit).Value = true;
            }
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.ExecuteNonQuery();
            conn.Close();
            txtcrearcompetencia.Text = "";
            ConsultarCreiterios(checescriterio.Checked);
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
        }
        public void GuardarCompetencias()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_COMPETENCIAS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = txtcrearcompetencia.Text;
            cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 1;
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.ExecuteNonQuery();
            conn.Close();
            txtcrearcompetencia.Text = "";
            ConsultarCompetencias();
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
        }
        public void ConsultarCompetencias()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_COMPETENCIAS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            TablaComitites.DataSource = dt;
            TablaComitites.DataBind();
            conn.Close();

            CargarListasCompetencias("Competencia");
        }
        public void ConsultarCreiterios(Boolean EsCriterio)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_CRITERIOS_ACTIVIDADES]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@ES_CRITERIO", SqlDbType.Bit).Value = EsCriterio;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            //Enlazo mis datos obtenidos en el DataTable con el grid
            tablacriterios.DataSource = dt;
            tablacriterios.DataBind();
            conn.Close();

            CargarListasCriterio(checescriterio.Checked);
        }
        protected void btnCambiarEstado_Command(object sender, CommandEventArgs e)
        {
            string IdRegistro = e.CommandArgument.ToString();
            string Estado = e.CommandName.ToString();


            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_COMPETENCIAS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = IdRegistro;
            if (Estado == "Activo")
            {
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 0;
            }
            else
            {
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 1;
            }
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            cmd.ExecuteNonQuery();
            conn.Close();
            txtcrearcompetencia.Text = "";
            ConsultarCompetencias();
            CargarListasCompetencias("Competencia");
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
        }
        public void CargarListasCompetencias(String Movimiento)
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_COMPETENCIAS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Movimiento == "Competencia")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            }
            cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 1;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (Movimiento == "Competencia")
            {
                txtcompetencias.DataSource = dt;
                txtcompetencias.DataValueField = "ID";
                txtcompetencias.DataTextField = "NOMBRE";
                txtcompetencias.DataBind();
            }
            conn.Close();
        }
        public void CargarListasCriterio(Boolean Escriterio)
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_CRITERIOS_ACTIVIDADES]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 1;
            cmd.Parameters.Add("@ES_CRITERIO", SqlDbType.Bit).Value = Escriterio;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (Escriterio == true)
            {
                txtcriterios.DataSource = dt;
                txtcriterios.DataValueField = "ID";
                txtcriterios.DataTextField = "NOMBRE";
                txtcriterios.DataBind();
            }
            else
            {
                txtcrearactividad.DataSource = dt;
                txtcrearactividad.DataValueField = "ID";
                txtcrearactividad.DataTextField = "NOMBRE";
                txtcrearactividad.DataBind();
            }


            conn.Close();
        }
        protected void btncrearcriterios_Click(object sender, EventArgs e)
        {
            panelcompetencia.Visible = false;
            panelcriterios.Visible = true;
            checescriterio.Checked = true;
            ConsultarCreiterios(checescriterio.Checked);
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
        }

        protected void btnCambiarEstadocriterios_Command(object sender, CommandEventArgs e)
        {
            string IdRegistro = e.CommandArgument.ToString();
            string Estado = e.CommandName.ToString();


            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_CRITERIOS_ACTIVIDADES]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.Int).Value = IdRegistro;
            if (Estado == "Activo")
            {
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 0;
            }
            else
            {
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = 1;
            }
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
            cmd.ExecuteNonQuery();
            conn.Close();
            txtcrearcompetencia.Text = "";
            ConsultarCreiterios(checescriterio.Checked);
            CargarListasCriterio(checescriterio.Checked);
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
        }

        protected void btncrearactividad_Click(object sender, EventArgs e)
        {
            panelcompetencia.Visible = false;
            panelcriterios.Visible = true;
            checescriterio.Checked = false;
            ConsultarCreiterios(checescriterio.Checked);
            ClientScript.RegisterStartupScript(this.GetType(), "key", "IrCrearCompetencia()", true);
        }

        protected void btnGuardarActividad_Click(object sender, EventArgs e)
        {
            if (txtarea.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione el Área', 'info');", true);
                return;
            }

            if (txtgrado.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione el Grado', 'info');", true);
                return;
            }

            if (txtasignatura.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione la Asignatura', 'info');", true);
                return;
            }

            if (txtperiodo.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione el Periodo', 'info');", true);
                return;
            }

            if (txtcompetencias.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione la Competencia', 'info');", true);
                return;
            }

            if (txtcriterios.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione el Criterio', 'info');", true);
                return;
            }

            if (txtcrearactividad.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione la Actividad', 'info');", true);
                return;
            }

            if (txttipoactividad.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Seleccione el Tipo de Actividad', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtvaloractividad.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Ingrese el Valor Porcentual', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtdescripcionactividad.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje  SIE', 'Ingrese una Descripción', 'info');", true);
                return;
            }

            try
            {


                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_ACTIVIDADES_ACADEMICAS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_AREA", SqlDbType.Int).Value = txtarea.SelectedValue;
                cmd.Parameters.Add("@ID_GRADO", SqlDbType.Int).Value = txtgrado.SelectedValue;
                cmd.Parameters.Add("@ID_ASIGNATURA", SqlDbType.Int).Value = txtasignatura.SelectedValue;
                cmd.Parameters.Add("@ID_PERIODO", SqlDbType.Int).Value = txtperiodo.SelectedValue;
                cmd.Parameters.Add("@ID_COMPETENCIA", SqlDbType.Int).Value = txtcompetencias.SelectedValue;
                cmd.Parameters.Add("@ID_CRITERIO", SqlDbType.Int).Value = txtcriterios.SelectedValue;
                cmd.Parameters.Add("@ID_ACTIVIDAD", SqlDbType.Int).Value = txtcrearactividad.SelectedValue;
                cmd.Parameters.Add("@ID_TIPO", SqlDbType.Int).Value = txttipoactividad.SelectedValue;
                cmd.Parameters.Add("@VALOR_PORCENTAJE", SqlDbType.NVarChar).Value = txtvaloractividad.Text;
                cmd.Parameters.Add("@DESCRIPCION", SqlDbType.NVarChar).Value = txtdescripcionactividad.Text;
                cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Convert.ToInt32(Session["ID_TERCERO_USUARIO"]);
                cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("NewConsultarActividades.aspx?Guardo=1");
            }
            catch (Exception er)
            {
                throw er;
            }
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewCrearActividadesCompetencias.aspx");
        }
    }
}