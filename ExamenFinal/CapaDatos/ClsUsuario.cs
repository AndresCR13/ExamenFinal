using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenFinal.CapaDatos
{
    public class ClsUsuario
    {
        public static string Nombre { get; set; }
        public static string Contrasenia { get; set; }
        public static string Usuario { get; set; }

        public ClsUsuario(string contrasenia, string usuario)
        {
            Contrasenia = contrasenia;
            Usuario = usuario;
        }

        public ClsUsuario() { }



    }
}