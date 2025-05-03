using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Akupara.Educacion.Aplicacion.Pagina.GestionAdministrativa
{
    public partial class NewCrearProfesores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("../GestionAcademica/NewConsultarTerceros.aspx?IdTipoTercero=2");
        }
    }
}