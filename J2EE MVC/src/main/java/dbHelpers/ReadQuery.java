package dbHelpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.M_08_Friends;

public class ReadQuery {
	Connection conn;
	ResultSet rs;
	public ReadQuery() throws ClassNotFoundException, SQLException {
		// conn = [call your static DB method]
		conn = DB.getConnection();
	}
	
	public void doRead() throws SQLException {
		// READ your Data and save it in ResultSet
		String query ="SELECT * FROM friends";
		PreparedStatement ps=conn.prepareStatement(query);
		this.rs = ps.executeQuery();
	}
	
	public String getHTMLTable() throws SQLException {
		String table = "";
		table += "<table border=1>";
		while(this.rs.next()) {
			M_08_Friends friend = new M_08_Friends(this.rs.getInt("id"),
					this.rs.getInt("age"),
					this.rs.getString("friendName"),
					this.rs.getString("emailaddress"),
					this.rs.getString("favouriteColor"));
							 // Change this object creation and add the data by using appropriate constructor
			table += "<tr>";
			table += "<td>";
			table += friend.getFriendID();
			table += "</td>";
			table += "<td>";
			table += friend.getFriendName();
			table += "</td>";
			table += "<td>";
			table += friend.getEmailAddress();
			table += "</td>";
			table += "<td>";
			table += friend.getAge();
			table += "</td>";
			table += "<td>";
			table += friend.getFavoriteColor();
			table += "</td>";
			table+="<td>";
			table+="<a href='C_08_Delete?id="+friend.getFriendID()+"'>Delete</a>";
			table += "</td>";
			table += "</tr>";
			
			
		}
		return table;
	}

}
