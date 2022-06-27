package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.M_08_Friends;

public class AddQuery {
	Connection conn;
	int rs;
	public AddQuery() throws ClassNotFoundException, SQLException {
		conn = DB.getConnection();
	}
	
	public void doAdd(String name,String email,String age,String color) throws SQLException {
		String query ="INSERT INTO friends(friendName,emailAddress,age,favouriteColor) values(?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, age);
		ps.setString(4, color);
		this.rs = ps.executeUpdate();
	}
	


}
