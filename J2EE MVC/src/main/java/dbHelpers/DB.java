package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	private static Connection conn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(conn == null) {
			String driver="com.mysql.cj.jdbc.Driver";
			String dbURL="jdbc:mysql://localhost:3306/friends_khushbu";
			String user ="root";
			String password="root";
			Class.forName(driver);
			conn= DriverManager.getConnection(dbURL,user,password);
			
			
		}
		return conn;
	}

}
