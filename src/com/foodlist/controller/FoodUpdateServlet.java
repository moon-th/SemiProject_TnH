package com.foodlist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodlist.model.vo.FoodList;
import com.foodlist.service.FoodListService;

/**
 * Servlet implementation class FoodUpdateServlet
 */
@WebServlet("/fUpdate.fo")
public class FoodUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		String day = request.getParameter("dayup");
		String rice = request.getParameter("riceup");
		String soup = request.getParameter("soupup");
		String mainfood = request.getParameter("mainfoodup");
		
		System.out.println("메인푸드 : "+mainfood);
		System.out.println("day : "+day);
		System.out.println("rice: "+rice);
		System.out.println("soup : "+soup);
		
		FoodList fl = new FoodList(fno,day,rice,soup,mainfood);
		
		FoodListService fs = new FoodListService();
		
		try {
			fs.updateFood(fl);
			System.out.println("변경성공");
			response.sendRedirect("/Semi/flist.fo");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("다시해 병신아");
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
