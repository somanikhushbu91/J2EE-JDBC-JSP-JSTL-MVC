<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Record</title>
</head>
<body>
	<form method="get">
	<h1>Add Product</h1>
		<div>
			Product No:<input type="text" name="product_no"/><br> <br> 
			Product Name:<input type="text" name="product_name" /><br> <br>
			Product Type:
			<input type="radio"	name="product_type" value="Home Appliance" checked="checked" /> <label>Home	Appliances</label> 
			<input type="radio"	name="product_type" value="Computer Hardware" /> <label>Computer Hardware </label> 
			<input type="radio" name="product_type"	value="Game Console" /><label> Game Console </label> 
			<input type="radio" name="product_type" value="Clothing" /><label>Clothing</label> <br> <br> 
			Manufacturer:<select name="manufacturer">
				<option value="LG" selected>LG</option>
				<option value="Asus">Asus</option>
				<option value="Lenovo">Lenovo</option>
				<option value="Zara">Zara</option>
			</select><br> <br> 
			Price:<input type="text" name="price" /><br> <br> 
			Weight:<input type="text" name="weight" /><br> <br> 
			<input type="submit" name="submit" value="Add Product">
		</div>
	</form>
	<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/as4_khushbu" user="root"
		password="root" />
	<c:choose>
		<c:when
			test="${param.product_no != null && param.product_name != null &&  param.product_type !=null
				&&  param.manufacturer !=null && param.price !=null &&  param.weight !=null}">
				<fmt:parseNumber value="${param.price}" type="number" var="paramPrice"/>
				<fmt:parseNumber value="${param.weight}" type="number" var="paramWeight"/>
			
			<c:choose>
			<c:when test="${ paramPrice >= 100 && paramPrice <= 900 }">
			<sql:query dataSource="${dbCon}" var="productResult">
				select * from products where product_no=?
			<sql:param value="${param.product_no}"></sql:param>
			</sql:query>
			<c:set var="count" value="0"></c:set>			
			<c:forEach var="col" items="${productResult.rows}" >
				<c:set var="count" value="${count + 1}" ></c:set>				
			</c:forEach>
			<c:choose>
			<c:when test="${count > 0 }">
				<h3>Product with same id cannot be inserted.</h3>
			</c:when>
			<c:otherwise>
					<sql:update dataSource="${dbCon}" var="prodDetails">
						INSERT INTO products (product_no,product_name,product_type,manufacturer, price, weight) VALUES (?,?,?,?,?,?)
					    <sql:param value="${param.product_no}" />
						<sql:param value="${param.product_name}" />
						<sql:param value="${param.product_type}" />
						<sql:param value="${param.manufacturer}" />
						<sql:param value="${paramPrice}" />
						<sql:param value="${paramWeight}" />
					</sql:update>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<h3>Price must be under $1000</h3>
			</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
		<h3>Product cannot be inserted</h3>
		</c:otherwise>
	</c:choose>


	<sql:query dataSource="${dbCon}" var="productResult">
			select * from products;
	</sql:query>

	<table border="1">
		<tr>
			<th>Product No</th>
			<th>Product Name</th>
			<th>Product Type</th>
			<th>Manufacturer</th>
			<th>Price</th>
			<th>Weight</th>
		</tr>
		<c:forEach var="col" items="${productResult.rows}">
			<tr>
				<td><c:out value="${col.product_no}"></c:out></td>
				<td><c:out value="${col.product_name}"></c:out></td>
				<td><c:out value="${col.product_type}"></c:out></td>
				<td><c:out value="${col.manufacturer}"></c:out></td>
				<td><c:out value="${col.price}"></c:out></td>
				<td><c:out value="${col.weight}"></c:out></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>