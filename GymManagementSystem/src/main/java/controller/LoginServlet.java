
package controller;

import java.io.IOException;

import dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        UserDAO userDAO = new UserDAO();

        User user = userDAO.login(email, password, role);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole());

            session.setAttribute(
                    "mustChangePassword",
                    user.isMustChangePassword());

            if ("admin".equals(user.getRole())) {

                response.sendRedirect("admin-dashboard.jsp");

            } else {

                if (user.isMustChangePassword()) {

                    response.sendRedirect(
                            "ChangePasswordServlet?firstLogin=1");

                    return;
                }

                response.sendRedirect("MemberDashboardServlet");
            }

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid email, password, or role");

            request.getRequestDispatcher(
                    "login.jsp?role=" + role)
                    .forward(request, response);
        }
    }
}
