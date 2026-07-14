package controller;

import java.io.IOException;

import dao.MemberDAO;
import model.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String feePackage = request.getParameter("feePackage");
        String dueDate = request.getParameter("dueDate");

        Member member = new Member(id, name, email, phone, feePackage, dueDate);

        MemberDAO memberDAO = new MemberDAO();
        memberDAO.updateMember(member);

        response.sendRedirect("ViewMembersServlet");
    }
}