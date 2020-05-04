package com.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.model.vo.Message;
import com.message.MessageService.MessageService;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/msglist.do")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int emp_no = Integer.parseInt(request.getParameter("my_emp_no"));
		System.out.println(emp_no);

		try {
			ArrayList<Message> list = new ArrayList<Message>();
			
			MessageService MsgService = new MessageService();
			
			list = MsgService.allmsglist(emp_no);

			System.out.println(list.toString());

			request.setAttribute("msglist", list);
			request.getRequestDispatcher("views/message.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
