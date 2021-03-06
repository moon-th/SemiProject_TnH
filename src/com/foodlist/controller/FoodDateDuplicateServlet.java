package com.foodlist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodlist.service.FoodListService;
import com.member.service.MemberService;


/**
 * Servlet implementation class MemberIdDuplicateServlet
 */
@WebServlet("/foodDup.fo")
public class FoodDateDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodDateDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String daycheck= request.getParameter("daycheck");
		
		FoodListService fs = new FoodListService();
		
		int result = fs.foodDayDupCheck(daycheck);
		
		// 0 / 1
		// 0 : 써도된다
		// 1 : 쓰면 안된다
		
		response.getWriter().print((result>0) ? "no" : "ok");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
