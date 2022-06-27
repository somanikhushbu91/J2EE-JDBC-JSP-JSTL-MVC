<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Page</title>
</head>
<body style="background-color:beige">
<h1 style="color:red">Khushbu's Friends</h1>
<p>
<% String table = (String)request.getAttribute("table"); // Read the table value here %>
<%= table %>
</p>
<a href='V_08_index.jsp'>Go Home</a><br/><br/>
<a href='V_08_add.jsp'>Add A Friend</a><br/><br/>
</body>
</html>