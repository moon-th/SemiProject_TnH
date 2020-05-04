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
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/msgRead.do")
public class ReadMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int msgno = Integer.parseInt(request.getParameter("MessageId"));
		System.out.println(msgno);

		try {
			Message msg = new Message();
			
			MessageService MsgService = new MessageService();
			
			msg = MsgService.selectOne(msgno);
			MsgService.countUp(msgno);
			System.out.println(msg.toString());

			request.setAttribute("msg", msg);
			request.getRequestDispatcher("views/readMessage.jsp").forward(request, response);
		} catch (Exception e) {
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
