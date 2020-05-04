package com.confirmBoard.model.service;

import static com.member.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.confirmBoard.model.dao.cBoardDao;
import com.confirmBoard.model.vo.cBoard;

public class cBoardService {
	
	private cBoardDao cDao = new cBoardDao();
	private Connection con;
	
	
	/**
	 * 1. 메소드명 : getListCount
	 * 2. 작성일 : 2020. 2. 17. 오전 9:50:34
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 페이징 처리
	 * @return
	 */
	public int getListCount(int type, int empNo) {
		
		con = getConnection();
		
		int listCount = cDao.getListCount(con ,type, empNo);

		close(con);
		
		return listCount;
	}


	/**
	 * 1. 메소드명 : selectList
	 * 2. 작성일 : 2020. 2. 17. 오후 12:28:22
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 리스트 불러오기
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<cBoard> selectList(int currentPage, int limit, int type, int empNo) {
		
		con = getConnection();
		
		ArrayList<cBoard> list = cDao.selectList(con, currentPage, limit, type, empNo);
		
		close(con);

		return list;
		
	}


	/**
	 * 1. 메소드명 : selectOne
	 * 2. 작성일 : 2020. 2. 17. 오후 12:29:26
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 게시물 불러오기
	 * @param bno
	 * @return
	 */
	public cBoard selectOne(int bno) {
		
		con = getConnection();
		
		cBoard b = cDao.selectOne(con, bno);
		
		if(b != null) {
			int result = cDao.updateReadCount(con, bno);
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		close(con);
		
		return b;
	}


	/**
	 * 1. 메소드명 : insertBoard
	 * 2. 작성일 : 2020. 2. 17. 오후 10:36:19
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 결재 게시물 저장
	 * @param cb
	 * @return
	 */
	public int insertBoard(cBoard cb) {
		
		con = getConnection();
		
		int result = cDao.insertBoard(con, cb);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	/**
	 * 1. 메소드명 : confirmChecking
	 * 2. 작성일 : 2020. 2. 18. 오후 8:12:42
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 체크완료눌렀을때 바로 체크
	 * @param bno
	 */
	public int confirmChecking(int bno,int empCount) {
		
		con = getConnection();
		
		int result = cDao.confirmChecking(con, bno, empCount);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	/**
	 * 1. 메소드명 : denyConfirmDoc
	 * 2. 작성일 : 2020. 2. 18. 오후 8:55:26
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 디나이
	 * @param bno
	 * @param denyEmpNo
	 * @return
	 */
	public int denyConfirmDoc(int bno, int denyEmpNo) {
		
		con = getConnection();
		
		int result = cDao.denyConfirmDoc(con, bno, denyEmpNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	/**
	 * 1. 메소드명 : confirmAppcompServlet
	 * 2. 작성일 : 2020. 2. 18. 오후 9:05:53
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 완료 완료 메소드
	 * @param bno
	 * @return
	 */
	public int confirmAppcomp(int bno) {
		
		con = getConnection();
		
		int result = cDao.confirmAppcomp(con, bno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	/**
	 * 1. 메소드명 : getSearchListCount
	 * 2. 작성일 : 2020. 2. 19. 오전 10:20:54
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 서치용 페이징처리 메소드
	 * @param type
	 * @param empNo
	 * @param category
	 * @param keyword
	 * @return
	 */
	public int getSearchListCount(int type, int empNo, String category, String keyword) {
		
		con = getConnection();
		
		int listCount = cDao.getSearchListCount(con ,type, empNo, category, keyword);

		close(con);
		
		return listCount;
	}


	/**
	 * 1. 메소드명 : selectSearchList
	 * 2. 작성일 : 2020. 2. 19. 오전 10:21:07
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 서치용 리스트 처리 메소드
	 * @param currentPage
	 * @param limit
	 * @param type
	 * @param empNo
	 * @param category
	 * @param keyword
	 * @return
	 */
	public ArrayList<cBoard> selectSearchList(int currentPage, int limit, int type, int empNo, String category,
			String keyword) {
		
		con = getConnection();
		
		ArrayList<cBoard> list = cDao.selectSearchList(con, currentPage, limit, type, empNo, category, keyword);
		
		close(con);

		return list;
		
	}


	/**
	 * 메인페이지 결재서류 확인
	 * @return
	 */
	public ArrayList<Integer> confirmView(int empNo) {
		
		con = getConnection();
		
		ArrayList<Integer> list = cDao.confirmView(con, empNo);
		
		close(con);
		
		return list;
	}


	/**
	 * 인사관리 보여지는 게시물
	 * @param empNo
	 * @param type
	 * @return
	 */
	public ArrayList<cBoard> confirmHumanview(int empNo, int type) {
		
		con = getConnection();
		
		ArrayList<cBoard> list = cDao.confirmHumanview(con, empNo, type);
		
		close(con);

		return list;
	}
	
}
