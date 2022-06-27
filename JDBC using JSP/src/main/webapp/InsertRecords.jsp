<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.function.ToDoubleFunction"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Record Inserted</title>
</head>
<body>
	<form method="get">
		<lable>Product No: </lable>
		<input type="text" name="proNo"><br> <br> <label>Product
			Name: </label> <input type="text" name="proName"><br> <br>
		<label>Product type</label><br> <input type="radio"
			name="proType" value="Home Appliance" checked>Home Appliance
		<input type="radio" name="proType" value="Computer Hardware">Computer
		Hardware <input type="radio" name="proType" value="Game Console">Game
		Console <input type="radio" name="proType" value="Clothing">Clothing
		<br> <br> <label>Manufacturer: </label> <select
			id="manufacturer" name="manufacturer">
			<option name="LG" value="LG">LG</option>
			<option name="Asus" value="Asus">Asus</option>
			<option name="Lenovo" value="Lenovo">Lenovo</option>
			<option name="Zara" value="Zara">Zara</option>
		</select><br> <br> <label>Price: </label> <input type="text"
			name="price"><br> <br> <label>Weight: </label> 
			<input type="text" name="weight"><br> <br> 
			<input type="submit" value="Add Product">
	</form>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/as3_khushbu";
	String username = "root";
	String password = "root";
	
	Connection connection = DriverManager.getConnection(db, username, password);
	
	ResultSet resultSet;
	String sql;
	
	String productno=request.getParameter("proNo");
	String productName=request.getParameter("proName");
	String productType=request.getParameter("proType");
	String proManufacturer=request.getParameter("manufacturer");
	String proPrice=request.getParameter("price");
	String proWeight=request.getParameter("weight");
	
	try{
	if(productno != null && productName != null && productType != null && proManufacturer != null && proPrice != null && proWeight != null){
		double price = Double.parseDouble(proPrice);
		double weight = Double.parseDouble(proWeight);
		if((price >= 100 && price <= 900)){
			sql = "select * from products where product_no = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, productno); //1 specifies the first parameter in the query
			resultSet = stmt.executeQuery();
			if(resultSet.next()){
				%><h3>Product with same id cannot be inserted.</h3>
				
			<%}
			else{
				sql = "insert into products values(?,?,?,?,?,?)";
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, productno);
				stmt.setString(2, productName);
				stmt.setString(3, productType);
				stmt.setString(4, proManufacturer);
				stmt.setDouble(5, price);
				stmt.setDouble(6, weight);
				if (stmt.executeUpdate() > 0) {
					response.sendRedirect("InsertRecords.jsp");
					%>
				<%}
				else{
					%><h3>Product cannot be inserted</h3>
				<% }
				
			}
		}
		else{

			%><h3>Price must be under $1000</h3>
		<%}
	}
	}catch(Exception e){
		%><h3>Please fill all the fields and add the product to the table.</h3>
	<%}
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