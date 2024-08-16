package in.sonu.Backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.sonu.Dao.DBconnection;

@WebServlet("/deleteurl")
public class DeleteTodoServlet extends HttpServlet {
	private static final String query = "DELETE from todo_list where id = ?";

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int ID = Integer.parseInt(req.getParameter("id"));

		try {
			Connection con = DBconnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, ID);
			int i = ps.executeUpdate();
			if (i == 1) {
				HttpSession session = req.getSession();
				session.setAttribute("delete", "Delete SuccessFull");

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
