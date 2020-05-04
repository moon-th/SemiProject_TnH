package com.chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatSubmitServlet
 */
@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
//			URLDecoder.decode("","UTF-8");
		String chatName = URLDecoder.decode(request.getParameter("chatName"),"UTF-8");
		String chatContent = URLDecoder.decode(request.getParameter("chatContent"),"UTF-8");
		
		System.out.println(chatContent);
		
		if(chatName ==null || chatName.equals("") || chatContent == null || chatName.equals("") ) {
			response.getWriter().write("0");
			
		}else {
			response.getWriter().write(new ChatDao().submit(chatName,chatContent)+"");
		
		}
	
	}

}
