<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="in.sonu.Dao.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit ToDo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container-fluid card" style="width: 60rem;">
    <h1 class="bg-info text-white text-center">Edit ToDo</h1>

   <%
   int ID = Integer.parseInt(request.getParameter("id").trim());
   try (Connection con = DBconnection.getConnection()) {
       PreparedStatement ps = con.prepareStatement("SELECT Title, Target_Date, DeadLine FROM todo_list WHERE id=?");
       ps.setInt(1, ID);
       ResultSet rs = ps.executeQuery();
       if(rs.next()){
%>
<form action="UpdateToDoServlet" method="post">
    <input type="hidden" name="id" value="<%=ID%>">
    <table class="table table-hover">
        <tr>
            <th>Title</th>
            <td><input type="text" name="title" value="<%=rs.getString("Title")%>" /></td>
        </tr>
        <tr>
            <th>Target Date</th>
            <td><input type="date" name="targetdate" value="<%=rs.getString("Target_Date")%>" /></td>
        </tr>
        <tr>
            <th>DeadLine</th>
            <td><input type="date" name="deadline" value="<%=rs.getString("DeadLine")%>" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Update ToDo" /></td>
        </tr>
    </table>
</form>
<%
       } else {
           out.println("<p class='text-danger'>No ToDo found with the provided ID.</p>");
       }
   } catch (Exception e) {
       e.printStackTrace();
   }
%>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
