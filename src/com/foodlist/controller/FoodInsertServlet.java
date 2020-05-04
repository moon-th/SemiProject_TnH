package com.foodlist.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodlist.model.vo.FoodList;
import com.foodlist.service.FoodListService;

/**
 * Servlet implementation class FoodInsertServlet
 */
@WebServlet("/fInsert.fo")
public class FoodInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String day = request.getParameter("day");
		String rice = request.getParameter("rice");
		String soup = request.getParameter("soup");
		String mainfood = request.getParameter("mainfood");
		
		
		
		FoodListService fs = new FoodListService();

		FoodList fl = new FoodList(day,rice,soup,mainfood);
		
		
		
		try {
				
			
				 fs.insertFood(fl);
				
				 HttpSession session = request.getSession();
				 session.setAttribute("fl", fl);
				
				 response.sendRedirect("/Semi/flist.fo");
		
			
		} catch (Exception e) {
			System.out.println("추가실패");
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
