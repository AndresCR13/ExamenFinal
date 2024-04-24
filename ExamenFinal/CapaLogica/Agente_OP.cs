using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ExamenFinal.CapaLogica
{
    public class Agente_OP
    {
        private string cadenaConexion = "tu_cadena_de_conexion";

        public DataTable ObtenerAgentes()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "consultar");
                    conexion.Open();
                    DataTable tabla = new DataTable();
                    tabla.Load(comando.ExecuteReader());
                    return tabla;
                }
            }
        }


        public void AgregarAgente(string nombre, string email, string telefono)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "agregar");
                    comando.Parameters.AddWithValue("@agente_nombre", nombre);
                    comando.Parameters.AddWithValue("@agente_email", email);
                    comando.Parameters.AddWithValue("@agente_telefono", telefono);
                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }

        public void BorrarAgente(int id)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "borrar");
                    comando.Parameters.AddWithValue("@agente_id", id);
                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }

     
        public void ModificarAgente(int id, string nombre, string email, string telefono)
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "GestionarAgentes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@accion", "modificar");
                    comando.Parameters.AddWithValue("@agente_id", id);
                    comando.Parameters.AddWithValue("@agente_nombre", nombre);
                    comando.Parameters.AddWithValue("@agente_email", email);
                    comando.Parameters.AddWithValue("@agente_telefono", telefono);
                    conexion.Open();
                    comando.ExecuteNonQuery();
                }
            }
        }
    }
}
