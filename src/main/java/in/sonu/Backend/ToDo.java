package in.sonu.Backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.sonu.Dao.DBconnection;

@WebServlet("/ToDoListServlet")
public class ToDo extends HttpServlet {
	private static final String query = "insert into todo_list(Title , Target_Date , DeadLine) values (?,?,?)";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String Title = req.getParameter("title");
		String targetdate = req.getParameter("targetdate");
		String DeadLine = req.getParameter("deadline");

		try {
			Connection con = DBconnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, Title);
			ps.setString(2, targetdate);
			ps.setString(3, DeadLine);

			int i = ps.executeUpdate();
			if (i == 1) {
				System.out.println("success");
				HttpSession session = req.getSession();
				session.setAttribute("msg", "Successfully Added");
				
			}
			resp.sendRedirect("index.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
