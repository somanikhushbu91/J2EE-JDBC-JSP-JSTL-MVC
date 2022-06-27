<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Record</title>
</head>
<body>
	<form method="get">
	<h1>Remove Product</h1>
		<label>Enter Product No: </label> 
		<input type="text" name="proNo"><br>
		<br> <input type="submit" value="Delete the Product">
	</form>
	<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/as4_khushbu" user="root"
		password="root" />
	<c:choose>
		<c:when test="${param.proNo != null}">
			<sql:update dataSource="${dbCon}" var="count">
				Delete from products where product_no=?
				<sql:param value="${param.proNo}"></sql:param>
			</sql:update>
			<c:choose>
				<c:when test="${count > 0 }">
					<h3>Record deleted</h3>
				</c:when>
				<c:otherwise>
					<h3>Cannot be deleted</h3>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<h3>Record not found</h3>
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