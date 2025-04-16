using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security.AntiXss;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Educacion.Educacion.Aplicacion.Pagina
{
    public partial class Inicial : System.Web.UI.Page
    {
        SqlConnection conn = BDCOMUN.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["OPCION_MENU"] = "Inicial";

            if (Session["NOMBRE"] != null)
            {
                txtnombreusuario.Text = Session["NOMBRE"].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }


            if (Session["ID_ROL"].ToString() == "1")
            {
                panelcliente.Visible = false;
                panelAdministrador.Visible = false;
            }
            if (Session["ID_ROL"].ToString() == "2")
            {
                panelcliente.Visible = false;
                panelAdministrador.Visible = false;
            }

        }

        protected void mOSTARMODAL_Click(object sender, EventArgs e)
        {
            int Comam = Convert.ToInt32(((LinkButton)sender).CommandArgument);

            switch (Comam)
            {
                case 1:
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "ModalObjetivos()", true);
                    break;
                case 2:
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "ModalMision()", true);
                    break;
                case 3:
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "ModalVision()", true);
                    break;
                case 4:
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "ModalPolitica()", true);
                    break;
                case 5:
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "ModalServicio()", true);
                    break;
                default:

                    break;
            };
        }

        protected void btnVerNotificaciones_Click(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["ROLADMIN"]))
            {
                Response.Redirect("~/Educacion/Aplicacion/Pagina/Muestras/Revision/Asinar_revisor?SoId=" + 0);
            }
            else
            {

                Response.Redirect("~/Educacion/Aplicacion/Pagina/Solicitudes/Mis_solicitudes?SoId=" + 0);
            }
        }
    }
}