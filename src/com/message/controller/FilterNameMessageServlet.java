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
 * Servlet implementation class FilterNameMessage
 */
@WebServlet("/FilterName.do")
public class FilterNameMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterNameMessageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int send_emp_no = Integer.parseInt(request.getParameter("send_emp_no"));
		int my_emp_no = Integer.parseInt(request.getParameter("my_emp_no"));
		
		try {
			ArrayList<Message> list = new ArrayList<Message>();
			
			MessageService MsgService = new MessageService();
			
			list = MsgService.filteredMessage(send_emp_no,my_emp_no);

			System.out.println(list.toString());

			request.setAttribute("msglist", list);
			request.getRequestDispatcher("views/filtermessage.jsp?emp_no="+my_emp_no).forward(request, response);
//			response.sendRedirect("views/filtermessage.jsp");
		} catch (Exception e) {
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
