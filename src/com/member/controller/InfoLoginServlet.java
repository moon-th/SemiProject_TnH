package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;
import com.member.service.MemberService;

/**
 * Servlet implementation class InfoLoginServlet
 */
@WebServlet("/infologin.me")
public class InfoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id =request.getParameter("id");
		String pwd = request.getParameter("pwd");
	
		Member m = new Member();
		
		MemberService ms = new MemberService();
		
		m.setEmpId(id);
		System.out.println(pwd);
		m.setEmpPwd(pwd);
		try {
			Member mm = ms.loginMember(m);
			if (mm != null) {
				System.out.println("회원정보 확인 성공");
			} else {
				System.out.println("회원정보 확인 실패");
			}
			response.sendRedirect("views/personal_info_edit.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
