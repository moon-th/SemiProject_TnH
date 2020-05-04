package com.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.MembershipService;

import com.foodlist.model.vo.FoodList;
import com.foodlist.service.FoodListService;
import com.member.model.exception.MemberException;
import com.member.model.vo.Attachment;
import com.member.model.vo.Member;
import com.member.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 *@작성자 : 문태환
	 *@내용 : 사원 로그인
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar today = new GregorianCalendar();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
		System.out.println(id);
		System.out.println(pw);
		
		
		Member m = new Member(id, pw);
		
		MemberService ms = new MemberService();
		
		Attachment at = new Attachment();
		
		try {
			
			m = ms.loginMember(m);
			
			System.out.println(m.getEmpNo());
			at = ms.selectMemberPhoto(m.getEmpNo());
			
			String brithday = null;
			StringTokenizer strToken = new StringTokenizer(m.getEmpSsn());
			brithday= strToken.nextToken("-");
			m.setEmpSsn(brithday);
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member",m);
			session.setAttribute("at", at);
			
			response.sendRedirect("views/mainpage.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("fail","아이디 비밀번호를 확인해 주세요");
			request.getRequestDispatcher("views/login.jsp").forward(request, response);
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
