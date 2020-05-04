package com.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.MessageService.MessageService;
import com.message.model.vo.Message;

/**
 * Servlet implementation class DeleteMessageServlet
 */
@WebServlet("/messagedelete.do")
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String deletelist = request.getParameter("deletelist");
	int emp_no = Integer.parseInt(request.getParameter("my_emp_no"));
	int result = 0;
	System.out.println(deletelist.toString());
	try {
		ArrayList<Message> list = new ArrayList<Message>();
		MessageService ms = new MessageService();
		result = ms.DeleteReadMessage(deletelist);
		list = new MessageService().allmsglist(emp_no);
		request.setAttribute("my_emp_no", emp_no);
		request.setAttribute("msglist", list);
		request.getRequestDispatcher("views/message.jsp").forward(request, response);
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

