<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<form method="get">
		<lable>Product No: </lable>
		<input type="text" name="proNo"><br><br>
		<label>Product Name: </label>
		<input type="text" name="proName"><br><br>
		<label>Product type</label><br>
		<input type="radio" name="proType" value="Home Appliance" checked>Home Appliance
		<input type="radio" name="proType" value="Computer Hardware">Computer Hardware
		<input type="radio" name="proType" value="Game Console">Game Console
		<input type="radio" name="proType" value="Clothing">Clothing
		<br><br>
		<label>Manufacturer: </label>
		<select id="manufacturer" name="manufacturer">
			<option name="LG" value="LG">LG</option>
			<option name="Asus" value="Asus">Asus</option>
			<option name="Lenovo" value="Lenovo">Lenovo</option>
			<option name="Zara" value="Zara">Zara</option>
		</select><br><br>
		<label>Price: </label>
		<input type="text" name="price"><br><br>
		<label>Weight: </label>
		<input type="text" name="weight"><br><br>
		<input type="submit" value="Add Product">
	</form>
	<p style="background-color:yellow;color:red;">the following information is received</p>
	<p style="background-color:yellow;color:red;">Product No is <%=request.getParameter("proNo") %></p>
	<p style="background-color:yellow;color:red;">Product Name is <%=request.getParameter("proName") %></p>
	<p style="background-color:yellow;color:red;">Product Type is <%=request.getParameter("proType") %></p>
	<p style="background-color:yellow;color:red;">Manufacturer is <%=request.getParameter("manufacturer") %></p>
	<p style="background-color:yellow;color:red;">Price is <%=request.getParameter("price") %></p>
	<p style="background-color:yellow;color:red;">Weight is <%=request.getParameter("weight") %></p> 
	
	
</body>
</html>