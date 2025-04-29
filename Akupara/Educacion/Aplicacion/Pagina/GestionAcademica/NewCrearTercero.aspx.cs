using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Educacion;

namespace Akupara.Educacion.Aplicacion.Pagina.GestionAcademica
{
    public partial class NewCrearTercero : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListas("TipoIdentificacion");
                CargarListas("Estratos");
                CargarListas("Municipios");
                CargarListas("GrupoSangre");
                CargarListas("FactorRh");
                CargarListas("Genero");

                CargarListasAdicionales("Anio");
                CargarListasAdicionales("Grado");
                CargarListasAdicionales("Jornada");
                CargarListasAdicionales("Matricula");
                CargarListasAdicionales("Modalidad");
                CargarListasAdicionales("Sedes");
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

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_CREAR_TERCEROS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (Movimiento == "TipoIdentificacion")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
            }
            if (Movimiento == "Estratos")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
            }
            if (Movimiento == "Municipios")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
            }
            if (Movimiento == "GrupoSangre")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
            }
            if (Movimiento == "FactorRh")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 9;
            } 
            if (Movimiento == "Genero")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 10;
            } 
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (Movimiento == "TipoIdentificacion")
            {
                txttipodocumento.DataSource = dt;
                txttipodocumento.DataValueField = "ID";
                txttipodocumento.DataTextField = "NOMBRE";
                txttipodocumento.DataBind();
            }
            if (Movimiento == "Estratos")
            {
                txtestrato.DataSource = dt;
                txtestrato.DataValueField = "ID";
                txtestrato.DataTextField = "NOMBRE";
                txtestrato.DataBind();
            }
            if (Movimiento == "Municipios")
            {
                txtmunicipio.DataSource = dt;
                txtmunicipio.DataValueField = "ID";
                txtmunicipio.DataTextField = "NOMBRE";
                txtmunicipio.DataBind();
            }
            if (Movimiento == "GrupoSangre")
            {
                txtgruposanguineo.DataSource = dt;
                txtgruposanguineo.DataValueField = "ID";
                txtgruposanguineo.DataTextField = "NOMBRE";
                txtgruposanguineo.DataBind();
            }
            if (Movimiento == "FactorRh")
            {
                txtfactorrh.DataSource = dt;
                txtfactorrh.DataValueField = "ID";
                txtfactorrh.DataTextField = "NOMBRE";
                txtfactorrh.DataBind();
            }
            if (Movimiento == "Genero")
            {
                txtgenero.DataSource = dt;
                txtgenero.DataValueField = "ID";
                txtgenero.DataTextField = "NOMBRE";
                txtgenero.DataBind();
            } 
            conn.Close();
        }
        public void CargarListasAdicionales(String Movimiento)
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DATOS_ACADEMICOS]", conn);
            cmd.CommandType = CommandType.StoredProcedure; 
            if (Movimiento == "Anio")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
            }
            if (Movimiento == "Grado")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
            }
            if (Movimiento == "Jornada")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 7;
            }
            if (Movimiento == "Matricula")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
            }
            if (Movimiento == "Modalidad")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 9;
            }
            if (Movimiento == "Sedes")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 10;
            }
            if (Movimiento == "Parentesto")
            {
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 10;
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (Movimiento == "Anio")
            {
                txtaniolectivos.DataSource = dt;
                txtaniolectivos.DataValueField = "ID";
                txtaniolectivos.DataTextField = "NOMBRE";
                txtaniolectivos.DataBind();
            }
            if (Movimiento == "Grado")
            {
                txtgrados.DataSource = dt;
                txtgrados.DataValueField = "ID";
                txtgrados.DataTextField = "NOMBRE";
                txtgrados.DataBind();
            }
            if (Movimiento == "Jornada")
            {
                txtjornada.DataSource = dt;
                txtjornada.DataValueField = "ID";
                txtjornada.DataTextField = "NOMBRE";
                txtjornada.DataBind();
            }
            if (Movimiento == "Matricula")
            {
                txtestadomatricula.DataSource = dt;
                txtestadomatricula.DataValueField = "ID";
                txtestadomatricula.DataTextField = "NOMBRE";
                txtestadomatricula.DataBind();
            }
            if (Movimiento == "Modalidad")
            {
                txtmodalidad.DataSource = dt;
                txtmodalidad.DataValueField = "ID";
                txtmodalidad.DataTextField = "NOMBRE";
                txtmodalidad.DataBind();
            }
            if (Movimiento == "Sedes")
            {
                txtsedes.DataSource = dt;
                txtsedes.DataValueField = "ID";
                txtsedes.DataTextField = "NOMBRE";
                txtsedes.DataBind();
            } 
            if (Movimiento == "Parentesto")
            {
                txtparentesco.DataSource = dt;
                txtparentesco.DataValueField = "ID";
                txtparentesco.DataTextField = "NOMBRE";
                txtparentesco.DataBind();
            }
            conn.Close();
        }

        protected void btnguardardatos_Click(object sender, EventArgs e)
        {
            if (txttipodocumento.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Seleccione el tipo de documento', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtdocumento.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite el número de documento', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtprimernombre.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite el primer nombre', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtprimerapellido.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite el primer apellido', 'info');", true);
                return;
            }

            if (txtgenero.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Seleccione el sexo', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtfechanacimiento.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite la fecha de nacimiento', 'info');", true);
                return;
            }

            if (txtmunicipio.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Seleccione el municipio de nacimiento', 'info');", true);
                return;
            }
             

            if (string.IsNullOrWhiteSpace(txtdireccion.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite la dirección de residencia', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtcelular.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite el número de teléfono', 'info');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtcorreo.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Digite el correo electrónico', 'info');", true);
                return;
            }

            if (txtestrato.SelectedValue == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje!', 'Seleccione el estrato', 'info');", true);
                return;
            }
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[Educacion].[STP_CREAR_TERCEROS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_TIPO_TERCERO", SqlDbType.Int).Value = 1;/*Estudiante*/
                cmd.Parameters.Add("@ID_TIPO_DOCUMENTO", SqlDbType.Int).Value = txttipodocumento.SelectedValue;
                cmd.Parameters.Add("@DOCUMENTO", SqlDbType.NVarChar).Value = txtdocumento.Text;
                cmd.Parameters.Add("@PRIMER_NOMBRE", SqlDbType.NVarChar).Value = txtprimernombre.Text;
                cmd.Parameters.Add("@SEGUNDO_NOMBRE", SqlDbType.NVarChar).Value = txtsegundonombre.Text;
                cmd.Parameters.Add("@PRIMER_APELLIDO", SqlDbType.NVarChar).Value = txtprimerapellido.Text;
                cmd.Parameters.Add("@SEGUNDO_APELLIDO", SqlDbType.NVarChar).Value = txtsegundoapellido.Text;
                cmd.Parameters.Add("@FECHA_NACIMIENTO", SqlDbType.Date).Value = txtfechanacimiento.Text;
                cmd.Parameters.Add("@LUGAR_NACIMIENTO", SqlDbType.NVarChar).Value = txtlugarnacimiento.Text;
                cmd.Parameters.Add("@ID_GENERO", SqlDbType.Int).Value = txtgenero.SelectedValue;
                cmd.Parameters.Add("@GRUPO_SANGUINEO", SqlDbType.Int).Value = txtgruposanguineo.SelectedValue;
                cmd.Parameters.Add("@ID_FACTOR_RH", SqlDbType.Int).Value = txtfactorrh.SelectedValue;
                cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = txtcorreo.Text;
                cmd.Parameters.Add("@CELULAR", SqlDbType.NVarChar).Value = txtcelular.Text;
                cmd.Parameters.Add("@TELEFONO_FIJO", SqlDbType.NVarChar).Value = txttelefonofijo.Text;
                cmd.Parameters.Add("@ID_ESTRATO", SqlDbType.Int).Value = txtestrato.SelectedValue;
                cmd.Parameters.Add("@ID_MUNICIPIO", SqlDbType.Int).Value = txtmunicipio.SelectedValue; 
                cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
                cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress; 
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    ViewState["IdRegistro"] = leer.GetInt32(0);
                }
                conn.Close();
                leer.Close();

                GuardarAcudiente(Convert.ToInt32(ViewState["IdRegistro"]));
                GuardarSalud(Convert.ToInt32(ViewState["IdRegistro"]));
                GuardarDatosAcademicos(Convert.ToInt32(ViewState["IdRegistro"]));

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Mensaje SIE', 'Datos Guardados con Exito', 'success');", true);

            }
            catch (Exception er)
            {
                throw er;
            }
        }

        public void GuardarAcudiente(Int32 IdTercero)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_ACUDIENTE_TERCERO]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID_TERCERO", SqlDbType.Int).Value = IdTercero;
            cmd.Parameters.Add("@NOMBRE_ACUDIENTE", SqlDbType.NVarChar).Value = txtnombreacudiente.Text;
            if(txtparentesco.SelectedValue!="")
            {
                cmd.Parameters.Add("@ID_PARENTESCO", SqlDbType.Int).Value = txtparentesco.SelectedValue;
            } 
            cmd.Parameters.Add("@DOCUMENTO", SqlDbType.NVarChar).Value = txtdocumentoacudiente.Text;
            cmd.Parameters.Add("@TELEFONO", SqlDbType.NVarChar).Value = txttelefonoacudiente.Text;
            cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = txtcorreoacudiente.Text;
            cmd.Parameters.Add("@DIRECCION", SqlDbType.NVarChar).Value = txtdireccionacudiente.Text;
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Session["ID_TERCERO_USUARIO"];
            cmd.Parameters.Add("@FECHA_CREACION", SqlDbType.DateTime2).Value = DateTime.Now;
            cmd.Parameters.Add("@FECHA_MODIFICACION", SqlDbType.DateTime2).Value = DateTime.Now;
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;  
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void GuardarSalud(Int32 IdTercero)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_SALUD_BIENESTAR_TERCEROS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID_TERCERO", SqlDbType.Int).Value = IdTercero;
            cmd.Parameters.Add("@EPS_SEGURO", SqlDbType.NVarChar).Value = txteps.Text.Trim();
            cmd.Parameters.Add("@CONDICIONES_MEDICAS", SqlDbType.NVarChar).Value = txtcondicionesmedicas.Text.Trim();
            cmd.Parameters.Add("@PERSONAS_AUTORIZADAS", SqlDbType.NVarChar).Value = txtpersonasautorizadas.Text.Trim();
            cmd.Parameters.Add("@VACUNAS_ACTUALIZADAS", SqlDbType.Bit).Value = checesquemavacunacion.Checked; 
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Convert.ToInt32(Session["ID_TERCERO_USUARIO"]); 
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void GuardarDatosAcademicos(Int32 IdTercero)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("[Educacion].[STP_DATOS_ACADEMICOS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID_TERCERO", SqlDbType.Int).Value = IdTercero;
            if (txtaniolectivos.SelectedValue != "")
            {
                cmd.Parameters.Add("@ANIO_LECTIVO", SqlDbType.NVarChar).Value = txtaniolectivos.SelectedValue;
            }
            if (txtgrados.SelectedValue != "")
            {
                cmd.Parameters.Add("@ID_GRADO", SqlDbType.Int).Value = txtgrados.SelectedValue;
            }
            if (txtjornada.SelectedValue != "")
            {
                cmd.Parameters.Add("@ID_JORNADA", SqlDbType.Int).Value = txtjornada.SelectedValue;
            }
            if (txtestadomatricula.SelectedValue != "")
            {
                cmd.Parameters.Add("@ID_ESTADO_ATRICULA", SqlDbType.Int).Value = txtestadomatricula.SelectedValue;
            }
            if (txtmodalidad.SelectedValue != "")
            {
                cmd.Parameters.Add("@ID_MODALIDAD", SqlDbType.Int).Value = txtmodalidad.SelectedValue;
            }
            if (txtsedes.SelectedValue != "")
            {
                cmd.Parameters.Add("@ID_SEDE", SqlDbType.Int).Value = txtsedes.SelectedValue;
            }
            cmd.Parameters.Add("@ID_TERCERO_USUARIO", SqlDbType.Int).Value = Convert.ToInt32(Session["ID_TERCERO_USUARIO"]);
            cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Request.UserHostAddress;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}