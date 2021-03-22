package ConnectionInfo;
import java.sql.*;
public class Db 
{
    public static Connection getConnection() throws Exception
    {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());//3306 now 8666
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/justcalldb?zeroDateTimeBehavior=convertToNull","root","");
        return con;
    }
}
