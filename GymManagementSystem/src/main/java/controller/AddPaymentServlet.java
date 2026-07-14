package controller;

import java.io.IOException;

import dao.PaymentDAO;
import model.Payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int memberId = Integer.parseInt(request.getParameter("memberId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentDate = request.getParameter("paymentDate");
        String nextDueDate = request.getParameter("nextDueDate");
        String status = request.getParameter("status");

        Payment payment = new Payment(memberId, amount, paymentDate, nextDueDate, status);

        PaymentDAO paymentDAO = new PaymentDAO();
        paymentDAO.addPayment(payment);

        response.sendRedirect("ViewMembersServlet");
    }
}