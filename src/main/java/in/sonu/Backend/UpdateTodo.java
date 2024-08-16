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

@WebServlet("/UpdateToDoServlet")
public class UpdateTodo extends HttpServlet {
    private static final String query = "UPDATE todo_list SET Title = ?, Target_Date = ?, DeadLine = ? WHERE id = ?";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ID = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String targetdate = req.getParameter("targetdate");
        String deadline = req.getParameter("deadline");

        try (Connection con = DBconnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, targetdate);
            ps.setString(3, deadline);
            ps.setInt(4, ID);
            int i = ps.executeUpdate();
            if (i == 1) {
                HttpSession session = req.getSession();
                session.setAttribute("update", "Update Successful");
            }
            resp.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

