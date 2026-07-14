package controller;

import java.io.IOException;

import dao.MemberDAO;
import dao.PaymentDAO;
import dao.UserDAO;
import model.Member;
import model.Payment;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

            if (user.getRole().equals("admin")) {
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                MemberDAO memberDAO = new MemberDAO();
                Member member = memberDAO.getMemberByEmail(email);

                Payment payment = null;

                if (member != null) {
                    PaymentDAO paymentDAO = new PaymentDAO();
                    payment = paymentDAO.getPaymentByMemberId(member.getId());
                }

                request.setAttribute("member", member);
                request.setAttribute("payment", payment);

                request.getRequestDispatcher("member-dashboard.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("errorMessage", "Invalid email, password, or role");
            request.getRequestDispatcher("login.jsp?role=" + role).forward(request, response);
        }
    }
}