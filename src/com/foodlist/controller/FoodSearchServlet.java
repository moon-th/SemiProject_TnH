package com.foodlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodlist.model.vo.FoodList;
import com.foodlist.service.FoodListService;

/**
 * Servlet implementation class FoodSearchServlet
 */
@WebServlet("/fsearch.fo")
public class FoodSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		

		ArrayList<FoodList> list = new ArrayList<FoodList>();
		
		FoodListService fs = new FoodListService();
		
		list = fs.foodSeachList(category,keyword);
		
		
		if(list !=null) {
			System.out.println(list.toString());
			System.out.println("식단검색 성공");
			request.setAttribute("list",list);
				
			//response.sendRedirect("views/admin_board_employee.jsp");
			request.getRequestDispatcher("views/admin_foodlist.jsp").forward(request, response);

		}else {
			System.out.println("실패");
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
