using ExamenFinal.CapaLogica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal.Presentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BINGRESAR_Click(object sender, EventArgs e)
        {
            if (ClsUsuarioDA.AgregarUsuario(tUsuario.Text, tContraseña.Text) > 0)
            {
                Response.Redirect("MenuCircular1.aspx");
            }
        }
    }
}