package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.M_08_Friends;

public class DeleteQuery {
	Connection conn;
	int rs;
	public DeleteQuery() throws ClassNotFoundException, SQLException {
		conn = DB.getConnection();
	}
	
	public void doDelete(String id) throws SQLException {
		String query ="delete from friends where id=?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setString(1, id);
		this.rs = ps.executeUpdate();
	}
	


}
