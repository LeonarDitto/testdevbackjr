using System.Data.SqlClient;

namespace NuxibaApp
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Data Source=127.0.0.1@3306;Initial Catalog=nuxiba";
            SqlConnection connection = new SqlConnection(connectionString);

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

        static void ListarTop10Usuarios(SqlConnection connection)
        {
            string query = "SELECT userId, nombre, paterno, materno FROM usuario LIMIT 10";
            SqlCommand cmd = new SqlCommand(query, connection);

            using (SqlDataReader reader = cmd.ExecuteReader())
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

        static void GenerarArchivoCSV(SqlConnection connection)
        {
            string query = "SELECT u.userId, CONCAT(u.nombre, ' ', u.paterno, ' ', u.materno) AS NombreCompleto, " +
                           "e.sueldo, e.fechaIngreso " +
                           "FROM usuario u " +
                           "INNER JOIN empleado e ON u.userId = e.userId";

            SqlCommand cmd = new SqlCommand(query, connection);

            using (SqlDataReader reader = cmd.ExecuteReader())
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

        static void ActualizarSalarioUsuario(SqlConnection connection, string userId, double nuevoSueldo)
        {
            string query = "UPDATE empleado SET sueldo = @nuevoSueldo WHERE userId = @userId";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@nuevoSueldo", nuevoSueldo);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.ExecuteNonQuery();

            Console.WriteLine($"Salario de usuario {userId} actualizado a {nuevoSueldo}");
        }

        static void AgregarNuevoUsuario(SqlConnection connection, string userId, string nombre, string apellido, double sueldo)
        {
            string query = "INSERT INTO usuario (userId, nombre, paterno, materno) VALUES (@userId, @nombre, @paterno, @materno)";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@nombre", nombre);
            cmd.Parameters.AddWithValue("@paterno", apellido);
            cmd.Parameters.AddWithValue("@materno", apellido);
            cmd.ExecuteNonQuery();

            query = "INSERT INTO empleado (userId, sueldo, fechaIngreso) VALUES (@userId, @sueldo, @fechaIngreso)";
            cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@sueldo", sueldo);
            cmd.Parameters.AddWithValue("@fechaIngreso", DateTime.Now);
            cmd.ExecuteNonQuery();

            Console.WriteLine($"Nuevo usuario {userId} agregado con salario {sueldo} y fecha de ingreso {DateTime.Now:yyyy-MM-dd}");
        }
    }
}
