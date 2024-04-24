using ExamenFinal.CapaDatos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExamenFinal.CapaLogica
{
    public class ClsUsuarioDA
    {
        public void ValidarLogin() { }
        public static int AgregarUsuario(string username, string password)
        {
            ClsUsuario.Usuario = username;
            ClsUsuario.Contrasenia = password;
            int resultado = 0;
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select usuario,Contraseña, nombre from Usuario where Usuario = '" + username + " ' " + "and contraseña = '" + password + "'", conexion);
            SqlDataReader registro = comando.ExecuteReader();
            if (registro.Read()) 
            {
                ClsUsuario.Nombre = registro[2].ToString();
                resultado = 1;
            }else
            {
                resultado = -1;

            }
            conexion.Close();   
            return resultado;
        }

        public void EliminarUsuario() { }
        public void ModificarUsuario() { }
        public void ConsultarUsuario() { }
        public void ObtenerDatos() { }

    }
}