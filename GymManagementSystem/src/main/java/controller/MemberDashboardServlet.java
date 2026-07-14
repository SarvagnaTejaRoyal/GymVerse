package controller;

import java.io.IOException;

import dao.MemberDAO;
import dao.PaymentDAO;
import model.Member;
import model.Payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberDashboardServlet")
public class MemberDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp?role=member");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

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
}