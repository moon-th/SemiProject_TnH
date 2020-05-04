package com.foodlist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodlist.model.vo.FoodList;
import com.foodlist.model.vo.PageInfo;
import com.foodlist.service.FoodListService;

/**
 * Servlet implementation class FoodListServlet
 */
@WebServlet("/flist.fo")
public class FoodListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<FoodList> list = new ArrayList<FoodList>();
		
		FoodListService fs = new FoodListService();
		
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
		limit = 10;
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		// 페이징 처리
		int listCount = fs.getListCount();
		
		
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		
		endPage = startPage + limit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
			
				HttpSession session = request.getSession();
		
				list = fs.foodList(currentPage,limit);			
			
				
				try {
				System.out.println("식단목록 불러오기 성공");
				PageInfo  pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			
				session.setAttribute("pi", pi);
				
				
				request.setAttribute("list",list);
				
				//response.sendRedirect("views/admin_foodlist.jsp");
				request.getRequestDispatcher("views/admin_foodlist.jsp").forward(request, response);
				
			} catch (Exception e) {
				System.out.println(list);
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
