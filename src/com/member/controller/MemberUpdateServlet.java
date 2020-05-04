package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.exception.MemberException;
import com.member.model.vo.Member;
import com.member.service.MemberService;


/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/mUpdate.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String pwd   = request.getParameter("pwd");
		
		  HttpSession session = request.getSession(false);
		    
		  Member m = (Member)session.getAttribute("member");
		
		m.setPhone(phone);
		m.setEmail(email);
		m.setEmpPwd(pwd);
		
		MemberService ms = new MemberService();
		
		
		try {
		
			 ms.memberUpdate(m);
			
				System.out.println("회원정보 수정 완료!");
				
				response.sendRedirect("views/mypage.jsp");
		
			
		} catch (MemberException e) {
			
			request.setAttribute("msg", "회원정보 수정 중 에러 발생!!");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
