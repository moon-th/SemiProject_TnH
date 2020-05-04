package com.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatSubmitServlet
 */
@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			response.setContentType("text/html; charset=UTF-8");

		  String listType = request.getParameter("listType");
		  
		  if(listType == null || listType.equals("")) {
			  response.getWriter().write("");
		  }
		  else if(listType.equals("today")) {
			  response.getWriter().write(getToday());
		  }
		  else if(listType.equals("ten")) {
			  response.getWriter().write(getTen());
		  }
		  try {
			  Integer.parseInt(listType);
			  response.getWriter().write(getId(listType));
		} catch (Exception e) {
			response.getWriter().write("");
		}
		  
	}
		  
		  public String getToday() { 
			  StringBuffer result = new StringBuffer("");
			  result.append("{\"result\":[");
			  ChatDao cDao = new ChatDao();
			  ArrayList<Chat> chatList = cDao.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			  
			  for(int i=0; i < chatList.size();i++) {
				  result.append("[{\"value\":\""+chatList.get(i).getChatName() +"\"},");
				  result.append("{\"value\":\""+chatList.get(i).getChatContent() +"\"},");
				  result.append("{\"value\":\""+chatList.get(i).getChatTime() +"\"}]");
				  
				  if(i != chatList.size() -1)result.append(",");
			  }

			  result.append("], \"last\":\""+ chatList.get(chatList.size()-1).getChatId()+"\"}");
			  return result.toString();
			  
		  }
		  
		  public String getTen() { 
			  StringBuffer result = new StringBuffer("");
			  result.append("{\"result\":[");
			  ChatDao cDao = new ChatDao();
			  ArrayList<Chat> chatList = cDao.getChatListByRecent(10);
			  
			  for(int i=0; i < chatList.size();i++) {
				  result.append("[{\"value\":\""+chatList.get(i).getChatName() +"\"},");
				  System.out.println(chatList.get(i).getChatName());
				  result.append("{\"value\":\""+chatList.get(i).getChatContent() +"\"},");
				  System.out.println(chatList.get(i).getChatContent());
				  result.append("{\"value\":\""+chatList.get(i).getChatTime() +"\"}]");
				  System.out.println(chatList.get(i).getChatTime());
				  
				  if(i != chatList.size() -1)result.append(",");
			  }

			  result.append("], \"last\":\""+ chatList.get(chatList.size()-1).getChatId()+"\"}");
			  System.out.println(result.toString());
			  return result.toString();
			  
		  }
		  
		  public String getId(String chatId) { 
			  StringBuffer result = new StringBuffer("");
			  result.append("{\"result\":[");
			  ChatDao cDao = new ChatDao();
			  ArrayList<Chat> chatList = cDao.getChatListByRecent(chatId);
			  
			  for(int i=0; i < chatList.size();i++) {
				  result.append("[{\"value\":\""+chatList.get(i).getChatName() +"\"},");
				  result.append("{\"value\":\""+chatList.get(i).getChatContent() +"\"},");
				  result.append("{\"value\":\""+chatList.get(i).getChatTime() +"\"}]");
				  
				  if(i != chatList.size() -1)result.append(",");
			  }

			  result.append("], \"last\":\""+ chatList.get(chatList.size()-1).getChatId()+"\"}");
			  return result.toString();
			  
		  }

}
