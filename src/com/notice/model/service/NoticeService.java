package com.notice.model.service;

import static com.member.common.JDBCTemplate.close;
import static com.member.common.JDBCTemplate.commit;
import static com.member.common.JDBCTemplate.getConnection;
import static com.member.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.board.model.vo.Board;
/*import com.board.model.vo.Board;
*/import com.notice.model.dao.NoticeDao;
import com.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();

	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		
		ArrayList<Notice> List = nDao.selectList(con);
		
		close(con);
		
		return List;
	}

	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = nDao.insertNotice(con,n);
		
		if(result >=1)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Notice selectOne(int nno) {
		Connection con = getConnection();
		
		Notice n = nDao.selectOne(con,nno);
		
		if(n != null) {
			int result = nDao.updateReadCount(con, nno);
			
			if(result > 0) commit(con);
			else rollback(con);
		
			close(con);		
		}	
		return n;
	}

	/**
	 * 수정
	 * @param n
	 * @return
	 */
	public int updateNotice(Notice n) {
		Connection con = getConnection();		
		
		int result = nDao.updateNotice(con,n);		
		
		if(result > 0 )commit(con);
        else rollback(con);      
  
		close(con);
  
     	return result;
	}

	public Notice updateView(int nno) {
		Connection con = getConnection();
		
		Notice n = nDao.selectOne(con,nno);
		
		close(con);
		
		return n;
	}

	public int deleteNotice(int nno) {
		Connection con = getConnection();
		
		int result = nDao.deleteNotice(con,nno);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);		
		
		return result;
	}

	public ArrayList<Notice> searchNotice(String category, String keyword) {
		Connection con = getConnection();
		
		ArrayList<Notice> list = null;
		
		if(category.length() > 0) {
			list = nDao.searchNotice(con,category,keyword);
		}else {
			list = nDao.selectList(con);
		}
		
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = nDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		
		ArrayList<Notice> List = nDao.selectList(con,currentPage,limit);
		
		close(con);
		
		return List;
	}

	public int getSearchListCount(String category, String keyword) {
		Connection con = getConnection();
		int listCount = nDao.getListCount(con,category,keyword);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Notice> searchSelectList(int currentPage, int limit, String category, String keyword) {
		Connection con = getConnection();
		
		ArrayList<Notice> list = null;
		
		if(category!=null ){
			list = nDao.searchListNotice(con,category,keyword, limit, currentPage);
		}else {
			//list = bDao.selectList(con, currentPage, limit);
		}
		
		return list;
	}


}
