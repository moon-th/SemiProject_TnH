package com.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.member.model.vo.PageInfo;
import com.member.service.MemberService;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/mList.em")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 *@작성자 : 문태환
	 *@내용 : 관리자 사원목록
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			ArrayList<Member> list = new ArrayList<Member>();
	
			MemberService ms = new  MemberService();
			
			int startPage;
			
			// 한 번에 표시할 페이지들 중 가장 뒤의 페이지 
			int endPage;
			
			// 전체 페이지의 가장 마지막 페이지
			int maxPage;

			// 사용자가 위치한 현재 페이지
			int currentPage;
			
			//총 페이지 수 (한 페이지 당 보여줄 게시글 수)
			int limit;
			
			
			// 처음 접속 시 페이지는 1페이지 부터 시작한다.
			currentPage = 1;
			
			
			// 글 갯수 및 페이지 수  10개로 제한하기
			limit = 20;
			
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			
			// 페이징 처리
			int listCount = ms.getListCount();
			
			
			
			maxPage = (int)((double)listCount/limit+1.8);
			
			startPage = ((int)((double)currentPage/limit+1.8)-1)*limit+1;
			
			endPage = startPage + limit-1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			list=ms.MemberList(currentPage,limit);
			
			
			HttpSession session = request.getSession();
			
			if(list != null) {
				session.setAttribute("list", list);
				PageInfo  pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
				
				session.setAttribute("pi", pi);
			}
			else {
				System.out.println("리스트 목록 실패");	
			}
			
			request.getRequestDispatcher("views/admin_board_employee.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
