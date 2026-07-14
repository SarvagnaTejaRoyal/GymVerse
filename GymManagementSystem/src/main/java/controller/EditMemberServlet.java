package controller;

import java.io.IOException;

import dao.MemberDAO;
import model.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditMemberServlet")
public class EditMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        MemberDAO memberDAO = new MemberDAO();
        Member member = memberDAO.getMemberById(id);

        request.setAttribute("member", member);
        request.getRequestDispatcher("edit-member.jsp").forward(request, response);
    }
}