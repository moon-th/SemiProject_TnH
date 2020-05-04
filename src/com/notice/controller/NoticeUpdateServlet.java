package com.notice.controller;

import java.io.IOException;
import java.util.Enumeration;

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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nUpdate.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024*1024*10;
		
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/NoticeUploadFiles/";
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");			
		}

		MultipartRequest mrequest = new MultipartRequest(
				request, // 변경하기 위한 원본 객체
				savePath, // 파일 저장 경로
				maxSize,	// 저장할 파일의 최대 크기
				"UTF-8",	// 저장할 문자셋 설정
				new DefaultFileRenamePolicy());
		
		
		int nno = Integer.parseInt(mrequest.getParameter("nno"));
		String title = mrequest.getParameter("title");
		String content = mrequest.getParameter("content");
		String fileName = mrequest.getFilesystemName("file");
		
		Notice n = new Notice();
		
		n.setNno(nno);
		n.setNtitle(title);
		n.setNcontent(content);
		n.setNoticefile(fileName);		
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			response.sendRedirect("selectOne.no?nno="+nno);
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
