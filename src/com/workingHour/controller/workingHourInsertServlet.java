package com.workingHour.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.workingHour.model.service.workingHourService;
import com.workingHour.model.vo.workingHour;

/**
 * Servlet implementation class workingHourInsertServlet
 */
@WebServlet("/InsertTime.wh")
public class workingHourInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public workingHourInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		int empNo = Integer.parseInt(request.getParameter("empNo"));
		
		Date workDate = Date.valueOf(request.getParameter("selectDay"));
		
		int workType1 = Integer.parseInt(request.getParameter("workType1"));
		int workType2 = Integer.parseInt(request.getParameter("workType2"));
		int workType3 = Integer.parseInt(request.getParameter("workType3"));
		
		String workTime1 = request.getParameter("workTime1");
		String workTime2 = request.getParameter("workTime2");
		String workTime3 = request.getParameter("workTime3");
		String workTime4 = request.getParameter("workTime4");
		String workTime5 = request.getParameter("workTime5");
		String workTime6 = request.getParameter("workTime6");
		
		workingHour wh = new workingHour();
		
		wh.setInputYN("Y");
		
		wh.setWorkNo(empNo);
		
		wh.setWorkDate(workDate);
		
		wh.setWorkType1(workType1);
		wh.setWorkType2(workType2);
		wh.setWorkType3(workType3);
		
		wh.setWorkTime1(workTime1);
		wh.setWorkTime11(workTime2);
		wh.setWorkTime2(workTime3);
		wh.setWorkTime21(workTime4);
		wh.setWorkTime3(workTime5);
		wh.setWorkTime31(workTime6);
		
		int result = new workingHourService().workingHourInsert(wh);
		
		new Gson().toJson(result,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
