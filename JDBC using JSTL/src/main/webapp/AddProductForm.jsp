<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<form method="get" action="">
		<h1>Add Product</h1>
		<div>
			Product No:<input type="text" name="product_no"/><br><br>
			Product Name:<input type="text" name="product_name" /><br><br>
			Product Type:<input type="radio" name="product_type" value="Home Appliance" checked="checked" /> <label>Home Appliances</label> 
						 <input type="radio" name="product_type" value="Computer Hardware" /> <label>Computer Hardware </label>
						 <input type="radio" name="product_type" value="Game Console" /><label> Game Console </label> 
						 <input type="radio" name="product_type" value="Clothing" /><label> Clothing</label> <br><br>
							
			Manufacturer:<select name="manufacturer" >
				<option value="LG" selected>LG</option>
				<option value="Asus">Asus</option>
				<option value="Lenovo">Lenovo</option>
				<option value="Zara">Zara</option>
			</select><br><br>
			Price:<input type="text" name="price" /><br><br>
			Weight:<input type="text" name="weight" /><br><br>
			<input type="submit" name="submit" value="Add Product">
		</div>
	</form>
	
	<p style="background-color: yellow;color:red;">
		<b>Product Number:</b> <c:out value='${param.product_no}'/><br>
		<b>Product Name:</b><c:out value='${param.product_name}'/><br>
		<b>Product Type:</b><c:out value='${param.product_type}'/><br>
		<b>Product Manufacturer:</b><c:out value='${param.manufacturer}'/><br>
		<b>Product Price:</b><c:out value='${param.price}'/><br>
		<b>Product Weight:</b><c:out value='${param.weight}'/><br>
	</p>
</body>
</html>