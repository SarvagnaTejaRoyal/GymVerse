
package controller;

import java.io.IOException;

import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null
                || session.getAttribute("userEmail") == null
                || !"member".equals(session.getAttribute("userRole"))) {

            response.sendRedirect("login.jsp?role=member");
            return;
        }

        request.getRequestDispatcher(
                "change-password.jsp").forward(request, response);
    }

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null
                || session.getAttribute("userEmail") == null
                || !"member".equals(session.getAttribute("userRole"))) {

            response.sendRedirect("login.jsp?role=member");
            return;
        }

        String currentPassword =
                request.getParameter("currentPassword");

        String newPassword =
                request.getParameter("newPassword");

        String confirmPassword =
                request.getParameter("confirmPassword");

        if (currentPassword == null
                || currentPassword.isEmpty()
                || newPassword == null
                || confirmPassword == null) {

            request.setAttribute(
                    "errorMessage",
                    "Please fill in all password fields.");

            request.getRequestDispatcher(
                    "change-password.jsp").forward(request, response);

            return;
        }

        if (newPassword.length() < 8) {

            request.setAttribute(
                    "errorMessage",
                    "New password must contain at least 8 characters.");

            request.getRequestDispatcher(
                    "change-password.jsp").forward(request, response);

            return;
        }

        if (!newPassword.equals(confirmPassword)) {

            request.setAttribute(
                    "errorMessage",
                    "New password and confirmation do not match.");

            request.getRequestDispatcher(
                    "change-password.jsp").forward(request, response);

            return;
        }

        if (newPassword.equals("member123")) {

            request.setAttribute(
                    "errorMessage",
                    "Please choose a password other than the default password.");

            request.getRequestDispatcher(
                    "change-password.jsp").forward(request, response);

            return;
        }

        String email =
                (String) session.getAttribute("userEmail");

        UserDAO userDAO = new UserDAO();

        boolean changed = userDAO.changePassword(
                email, currentPassword, newPassword);

        if (changed) {

            session.setAttribute("mustChangePassword", false);

            response.sendRedirect(
                    "MemberDashboardServlet?passwordChanged=1");

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Current password is incorrect or password update failed.");

            request.getRequestDispatcher(
                    "change-password.jsp").forward(request, response);
        }
    }
}
