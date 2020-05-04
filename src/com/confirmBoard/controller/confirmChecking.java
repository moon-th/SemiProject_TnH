package com.confirmBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.confirmBoard.model.service.cBoardService;
import com.confirmBoard.model.vo.confirmPageInfo;

/**
 * Servlet implementation class confirmChecking
 */
@WebServlet("/cCheking.ap")
public class confirmChecking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmChecking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int type = Integer.parseInt(request.getParameter("type"));
		int empCount = Integer.parseInt(request.getParameter("empCount"));
		
		System.out.println("empCount : " + empCount);
		
		int result = new cBoardService().confirmChecking(bno,empCount);
		
		String page = "";
		
		if(result > 0) {
			page = "/confirmSelectOne?type=" + type + "&bno=" + bno;
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "불러오기 실패");
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
