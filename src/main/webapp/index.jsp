<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="in.sonu.Dao.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODO LIST </title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="container-fluid card" style="width: 60rem;">

	<h1 class="bg-info text-white text-center">List Of ToDo</h1>

	<form action="ToDoListServlet" method="post">
		<table class="table table-hover">
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>Starting Date</th>
				<td><input type="date" name="targetdate" /></td>
			</tr>
			<tr>
				<th>DeadLine</th>
				<td><input type="date" name="deadline" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="Add ToDo" /></td>
			</tr>

		</table>

	</form>

	<table class="table table-hover">



		<%
		String msg = (String) session.getAttribute("msg");
		if (msg != null) {
		%>
		<div class="alert alert-info"><%=msg%></div>
		<%
		session.removeAttribute("msg");
		}
		%>
		
		
		
		<%
		String msg1 = (String) session.getAttribute("delete");
		if (msg1 != null ) {
		%>
		<div class="alert alert-info"><%=msg1%></div>
		<%
		session.removeAttribute("delete");
		}
		%>


		<tr>
			<th>Title</th>
			<th>Target Date</th>
			<th>DeadLine</th>
			<th>Action</th>
		</tr>
		<%
		Connection con = DBconnection.getConnection();
		PreparedStatement ps = con.prepareStatement("select id , Title ,  Target_Date ,  DeadLine  from todo_list");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("Title")%></td>
			<td><%=rs.getString("Target_Date")%></td>
			<td><%=rs.getString("DeadLine")%></td>
			<td><a href="editScreen.jsp?id= <%= rs.getInt(1) %>">Edit</a> <a
				href="deleteurl?id=<%= rs.getInt(1) %>">Delete</a></td>

		</tr>


		<%
		}
		%>


	</table>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>