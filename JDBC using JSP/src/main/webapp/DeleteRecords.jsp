<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="get">
		<label>Enter Product No: </label> <input type="text" name="proNo"><br>
		<br> <input type="submit" value="Delete the Product">
	</form>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/as3_khushbu";
	String username = "root";
	String password = "root";

	String productno = request.getParameter("proNo");

	Connection connection = DriverManager.getConnection(db, username, password);

	String sql = "select * from products where product_no = ?";
	PreparedStatement stmt = connection.prepareStatement(sql);

	stmt.setString(1, productno); //1 specifies the first parameter in the query
	ResultSet resultSet = stmt.executeQuery();
	if (resultSet.next()) {

		stmt = connection.prepareStatement("Delete from products where product_no = ?");
		stmt.setString(1, productno);

		if (stmt.executeUpdate() > 0) {
	%><h3>Record deleted</h3>
	<%
	} else {
	%><h3>Cannot be deleted</h3>
	<%
	}
	} else {
	%>
	<h3>Record not found</h3>
	<%
	}

	Statement statement = connection.createStatement();
	resultSet = statement.executeQuery("select * from products");
	%>
	<br>
	<h3>The following information is received:</h3>
	<table border=1>
		<tr>
			<th>Product No</th>
			<th>Product Name</th>
			<th>Product Type</th>
			<th>Manufacturer</th>
			<th>Price</th>
			<th>Weight</th>
		</tr>
		<tr>
			<%
			while (resultSet.next()) {
			%>
			<td><%=resultSet.getString(1)%></td>
			<td><%=resultSet.getString(2)%></td>
			<td><%=resultSet.getString(3)%></td>
			<td><%=resultSet.getString(4)%></td>
			<td><%=resultSet.getDouble(5)%></td>
			<td><%=resultSet.getDouble(6)%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>