package com.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.MessageService.MessageService;
import com.message.model.vo.Message;

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/msgSend.do")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int	sendno = Integer.parseInt(request.getParameter("sendno")); //보내는사람 사원번호
	String title = (request.getParameter("title")); //메세지 제목
	String content = (request.getParameter("content")); //메세지 내용
	String sendname = (request.getParameter("sendname"));
	String senddeptname = (request.getParameter("senddeptname"));
	String sendjobname = (request.getParameter("sendjobname"));
	
	if(request.getParameter("receivenum").contains(",")) //여러사람으로 보낼경우
	{
	 String[] receivenum = (request.getParameter("receivenum").split(","));// 여러명의 받는사람일 경우 ','로 끊어읽음
	 String[] receivelist = (request.getParameter("receivelist").split(","));// 받는사람 목록(이름)
	 
	 for(int i=0;i<receivenum.length;i++) {
				 Message msg = new Message();
		 
				 MessageService MsgService = new MessageService();
				 
				 msg.setSend_emp_no(sendno);
				 msg.setSend_title(title);
				 msg.setSend_content(content);
				 msg.setReceive_emp_no(Integer.parseInt(receivenum[i]));
				 msg.setSend_emp_name(sendname);
				 msg.setSend_dept_name(senddeptname);
				 msg.setSend_job_name(sendjobname);
				 
				 MsgService.SendMessage(msg, receivelist[i]);
				 
	 }
	 System.out.println("전송 성공");
	response.sendRedirect("msglist.do?my_emp_no="+sendno);
	// request.getRequestDispatcher("msglist.do?emp_no="+sendno).forward(request, response);
	}
	
	
	else { 													//한명일경우
	 int receivenum = Integer.parseInt(request.getParameter("receivenum")); //받는사람 번호
	 String receivelist = request.getParameter("receivelist"); //받는사람 이름
	 try {
		 
		 Message msg = new Message();
		 
		 MessageService MsgService = new MessageService();
		 
		 msg.setSend_emp_no(sendno);
		 msg.setSend_title(title);
		 msg.setSend_content(content);
		 msg.setReceive_emp_no(receivenum);
		 msg.setSend_emp_name(sendname);
		 msg.setSend_dept_name(senddeptname);
		 msg.setSend_job_name(sendjobname);
		 
		 MsgService.SendMessage(msg,receivelist);
		 
		 System.out.println("전송 성공");
		 response.sendRedirect("msglist.do?my_emp_no="+sendno);
		// request.getRequestDispatcher("msglist.do?emp_no="+sendno).forward(request, response);
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	 
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
