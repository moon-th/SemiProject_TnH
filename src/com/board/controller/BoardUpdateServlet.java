package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/bUpdate.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024*1024*10;
		
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/boardUploadFiles/";
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");			
		}

		MultipartRequest mrequest = new MultipartRequest(
				request, // 변경하기 위한 원본 객체
				savePath, // 파일 저장 경로
				maxSize,	// 저장할 파일의 최대 크기
				"UTF-8",	// 저장할 문자셋 설정
				new DefaultFileRenamePolicy());
		
		
		
		String title = mrequest.getParameter("title");
		String content = mrequest.getParameter("content");
		int bno = Integer.parseInt(mrequest.getParameter("bno"));
		String fileName = mrequest.getFilesystemName("file");
		
		Board b = new Board();
		
		b.setBtitle(title);
		b.setBcontent(content);
		b.setBno(bno);
		b.setBoardfile(fileName);
		
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {
			response.sendRedirect("selectOne.bo?bno="+bno);
		}else {
			request.setAttribute("msg", "공지사항 수정 실패!");
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
