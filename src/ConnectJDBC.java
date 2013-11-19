import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 * User: marjolaine
 * Date: 19/11/13
 * Time: 17:24
 * To change this template use File | Settings | File Templates.
 */
public class ConnectJDBC {
    public static void main(String[] arg) throws ClassNotFoundException, SQLException{
        /* Load driver JDBC for MySQL*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:8080/BitcoinDB";
            String user = "bit";
            String pass = "bibit";

            Connection connection = null;
            try {
                connection = DriverManager.getConnection(url,user,pass);
                Statement statement = connection.createStatement();

                ResultSet resultSet = statement.executeQuery(" Select From ;");

                int statut = statement.executeUpdate("Insert Into Table() Values() ;");

            }
            catch (SQLException e){
                e.getSQLState();
            }
            finally {
                if (connection != null){
                    try{
                        connection.close();
                    }
                    catch (SQLException ignore){
                    }
                }
            }
        }

        catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("No Connection possible");
        }

    }
}
