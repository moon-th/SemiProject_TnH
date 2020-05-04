package com.boardComment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardComment.model.vo.BoardComment;
import com.boardComment.service.BoardCommentService;

/**
 * Servlet implementation class CommentUpdateServlet
 */
@WebServlet("/updateComment.bo")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		
		BoardComment bco = new BoardComment();
		
		bco.setCno(cno);
		bco.setCcontent(content);
		bco.setBno(bno);
		
		int result = new BoardCommentService().updateComment(bco);
		
		if(result > 0) {
			response.sendRedirect("selectOne.bo?bno="+bno);
		}else {
			request.setAttribute("msg", "댓글 작성 실패!!");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
