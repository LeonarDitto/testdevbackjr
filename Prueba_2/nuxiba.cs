using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using MySql.Data.MySqlClient;

namespace NuxibaApp
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "nuxiba"; // Cadena de Conexión de MySQL
            MySqlConnection connection = new MySqlConnection(connectionString);

            try
            {
                connection.Open();

                // Listar los top 10 usuarios
                ListarTop10Usuarios(connection);

                // Generar archivo CSV
                GenerarArchivoCSV(connection);

                // Actualizar salario de un usuario
                ActualizarSalarioUsuario(connection, "usuario_id", 50000);

                // Agregar un nuevo usuario
                AgregarNuevoUsuario(connection, "nuevo_usuario", "Nuevo", "Usuario", 60000);

                Console.WriteLine("Todas las operaciones se completaron correctamente.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        static void ListarTop10Usuarios(MySqlConnection connection)
        {
            string query = "SELECT userId, nombre, paterno, materno FROM usuario LIMIT 10";
            MySqlCommand cmd = new MySqlCommand(query, connection);

            using (MySqlDataReader reader = cmd.ExecuteReader())
            {
                Console.WriteLine("Top 10 Usuarios:");
                while (reader.Read())
                {
                    string userId = reader.GetString("userId");
                    string nombre = reader.GetString("nombre");
                    string paterno = reader.GetString("paterno");
                    string materno = reader.GetString("materno");
                    Console.WriteLine($"{userId} - {nombre} {paterno} {materno}");
                }
                Console.WriteLine();
            }
        }

        static void GenerarArchivoCSV(MySqlConnection connection)
        {
            string query = "SELECT u.userId, CONCAT(u.nombre, ' ', u.paterno, ' ', u.materno) AS NombreCompleto, " +
                           "e.sueldo, e.fechaIngreso " +
                           "FROM usuario u " +
                           "INNER JOIN empleado e ON u.userId = e.userId";

            MySqlCommand cmd = new MySqlCommand(query, connection);

            using (MySqlDataReader reader = cmd.ExecuteReader())
            {
                using (StreamWriter writer = new StreamWriter("usuarios.csv"))
                {
                    writer.WriteLine("Login, Nombre Completo, Sueldo, Fecha Ingreso");

                    while (reader.Read())
                    {
                        string userId = reader.GetString("userId");
                        string nombreCompleto = reader.GetString("NombreCompleto");
                        double sueldo = reader.GetDouble("sueldo");
                        DateTime fechaIngreso = reader.GetDateTime("fechaIngreso");

                        writer.WriteLine($"{userId}, {nombreCompleto}, {sueldo}, {fechaIngreso:yyyy-MM-dd}");
                    }
                }
            }

            Console.WriteLine("Archivo CSV generado: usuarios.csv");
        }

        static void ActualizarSalarioUsuario(MySqlConnection connection, string userId, double nuevoSueldo)
        {
            string query = "UPDATE empleado SET sueldo = @nuevoSueldo WHERE userId = @userId";
            MySqlCommand cmd = new MySqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@nuevoSueldo", nuevoSueldo);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.ExecuteNonQuery();

            Console.WriteLine($"Salario de usuario {userId} actualizado a {nuevoSueldo}");
        }

        static void AgregarNuevoUsuario(MySqlConnection connection, string userId, string nombre, string apellido, double sueldo)
        {
            string query = "INSERT INTO usuario (userId, nombre, paterno, materno) VALUES (@userId, @nombre, @paterno, @materno)";
            MySqlCommand cmd = new MySqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@nombre", nombre);
            cmd.Parameters.AddWithValue("@paterno", apellido);
            cmd.Parameters.AddWithValue("@materno", apellido);
            cmd.ExecuteNonQuery();

            query = "INSERT INTO empleado (userId, sueldo, fechaIngreso) VALUES (@userId, @sueldo, @fechaIngreso)";
            cmd = new MySqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@sueldo", sueldo);
            cmd.Parameters.AddWithValue("@fechaIngreso", DateTime.Now);
            cmd.ExecuteNonQuery();

            Console.WriteLine($"Nuevo usuario {userId} agregado con salario {sueldo} y fecha de ingreso {DateTime.Now:yyyy-MM-dd}");
        }
    }
}
