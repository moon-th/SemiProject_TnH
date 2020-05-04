package com.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/searchBoard.bo")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("con");
		
		String keyword = request.getParameter("keyword");
		
		String typeno = request.getParameter("typeno");
		System.out.println(typeno);
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardService bs = new BoardService();
		
		int startPage;
		
		// 한번에 표시할 페이지들 중 가장 뒤의 페이지
		int endPage;
		
		// 전페 페이지의 가장 마지막 페이지
		int maxPage;
		
		// 사용자가 위치한 현재 페이지
		int currentPage;
		
		// 총 페이지 수(한 페이지 당 보여줄 게시글 수)
		int limit;
		
		// 처음 접속 시 페이지는 1페이지부터 시작한다.
		currentPage = 1;
		
		// 글 개수 및 페이지 수 10개로 제한하기
		limit = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 페이징 처리
		int listCount = bs.getSearchListCount(category, keyword,typeno);
		
		System.out.println("총 페이지 갯수 : " + listCount);
		
		// 총 250개
		// 25개
		// 만약 전체 게시글 수가 13개라면
		// 페이지는 1,2가 나와야한다.
		// 13 --> 1.3 --> 2(올림)
		
		maxPage = (int)((double)listCount/ limit + 0.9);
		
		// 시작 페이지와 마지막 페이지 계산하기
		// 1~10 : 7, 7/10 --> 0.7 --> 1.6 --> 1-1 -- 0 * 10 + 1;
		// 11~20: 19, 19/10 --> 1.9 --> 2.8 --> 2-1 -- 1 * 10 + 1;
		startPage = ((int)((double)currentPage/limit + 0.9)-1) * limit +1;
		
		// 마지막 페이지
		// 1~10 : 10
		// 11~20: 20
		endPage = startPage + limit -1;
		
		// 만약 마지막 페이지보다 현재 게시글이 끝나는 페이지가 적다면
		// 1~10 : 7
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		list = bs.searchSelectList(currentPage,limit, category, keyword, typeno);
		
		String page = "";
		
		if(list != null) {
			page = "views/Board/BoardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("con", category);
			request.setAttribute("keyword", keyword);
			request.setAttribute("typeno", typeno);
			PageInfo pi = new PageInfo(currentPage,listCount
					,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
			
		}else {			
			request.setAttribute("msg", "공지사항 검색 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
