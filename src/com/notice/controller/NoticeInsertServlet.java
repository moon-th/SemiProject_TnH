package com.notice.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.notice.model.service.NoticeService;
import com.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/nInsert.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
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
				String savePath = root + "/noticeUploadFiles/";
				
				
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
		
		String ntitle = mrequest.getParameter("title");
		String writer = mrequest.getParameter("empId");
		String content = mrequest.getParameter("content");		
		String date = mrequest.getParameter("date");		
		String fileName = mrequest.getFilesystemName("file");
		
		System.out.println(writer);
		
		Date writeDate = null;
		
		if(date != "" && date != null) {
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			writeDate = new Date(new GregorianCalendar(
					intArr[0],intArr[1]-1,intArr[2]).getTimeInMillis());
		}else {
			writeDate = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Notice n = new Notice();
		
		n.setNtitle(ntitle);
		n.setNwriter(writer);
		n.setNcontent(content);
		n.setNdate(writeDate);
		n.setNoticefile(fileName);
		
		
		
		NoticeService ns = new NoticeService();
		
		int result = ns.insertNotice(n);
		
		if(result > 0) {
			System.out.println("등록!!");
			response.sendRedirect("selectList.no");
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
