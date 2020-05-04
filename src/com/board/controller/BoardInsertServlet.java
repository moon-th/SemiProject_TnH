package com.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/bInsert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일 처리용 서블릿
		// 1. 전송할 최대 크기 설정하기
		// 10MB --> (Byte크기로 변환하기)
		// 1MB -> 1024KB / 1KB-> 1024 Byte
		// 1024* 1024* 10;
		int maxSize = 1024*1024*10;
		
		// 2. multipart/form-data 형식으로 전송되었는지 확인!
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 만약 올바른 multipart/form-data로 전송되지 않았을 경우
			// 에러페이지로 즉시 이동시킨다.
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 3. 웹 상의 루트(최상위 경로) 경로를 활용하여 저장할 폴더의 위치 지정하기
		String root = request.getServletContext().getRealPath("/resources");
		System.out.println("root : " + root);
		// 게시판의 첨부파일을 저장할 폴더 이름 지정하기
		String savePath = root + "/boardUploadFiles/";
		
		
		// 4. 실제 담아온 파일 기타 정보들을 활요하여
		//    MultipartRequest 생성하기
		//    request -> MultipartRequest
		
		MultipartRequest mrequest = new MultipartRequest(
										request, // 변경하기 위한 원본 객체
										savePath, // 파일 저장 경로
										maxSize,	// 저장할 파일의 최대 크기
										"UTF-8",	// 저장할 문자셋 설정
										new DefaultFileRenamePolicy()
										// 동일한 이름의 파일을 저장했을 경우
										// 기존의 파일과 구분하기 위해
										// 새로운 파일명 뒤에 숫자를 붙이는 규칙				
				);
		
		HttpSession session = request.getSession();
		
		String typeno = (String) session.getAttribute("typeno");
		String btitle = mrequest.getParameter("title");
		String writer = mrequest.getParameter("empId");
		String content = mrequest.getParameter("content");
		String fileName = mrequest.getFilesystemName("file");
		
						
		Board b = new Board();
		
		b.setBtitle(btitle);
		b.setBwriter(writer);
		b.setBcontent(content);
		b.setBoardfile(fileName);		
		
		BoardService bs = new BoardService();
		
		int result = bs.insertBoard(b,typeno);
		
		if(result > 0) {
			System.out.println("등록!!");
			
			request.getRequestDispatcher("/selectList.bo?typeno="+typeno).forward(request, response);
		}else {
			request.setAttribute("msg", "게시판 등록 실패!");
			
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
