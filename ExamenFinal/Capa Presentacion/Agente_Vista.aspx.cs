using ExamenFinal.CapaDatos;
using ExamenFinal.CapaLogica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal.Capa_Presentacion
{
    public partial class Agente_Vista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Agente_OP persona = new Agente_OP();
            string nombre = txtnombre.Text = ClsAgente.nombre;
            string email = txtEmail.Text = ClsAgente.email;
            //string telefono = txtTelefono = ClsAgente.telefono;
            //if (persona.AgregarAgente(nombre,email,telefono)
            //{
            //    //llenar el espacio
            //}
        
        }
    }
}