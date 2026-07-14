package controller;

import java.io.IOException;

import dao.MemberDAO;
import model.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String feePackage = request.getParameter("feePackage");
        String dueDate = request.getParameter("dueDate");

        Member member = new Member(name, email, phone, feePackage, dueDate);

        MemberDAO memberDAO = new MemberDAO();
        memberDAO.addMember(member);

        response.sendRedirect("admin-dashboard.jsp");
    }
}