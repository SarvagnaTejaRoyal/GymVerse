package controller;

import java.io.IOException;
import java.util.List;

import dao.MemberDAO;
import model.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewMembersServlet")
public class ViewMembersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MemberDAO memberDAO = new MemberDAO();
        List<Member> members = memberDAO.getAllMembers();

        request.setAttribute("members", members);
        request.getRequestDispatcher("view-members.jsp").forward(request, response);
    }
}