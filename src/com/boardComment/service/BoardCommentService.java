package com.boardComment.service;

import static com.member.common.JDBCTemplate.close;
import static com.member.common.JDBCTemplate.commit;
import static com.member.common.JDBCTemplate.getConnection;
import static com.member.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.boardComment.model.dao.BoardCommentDao;
import com.boardComment.model.vo.BoardComment;

public class BoardCommentService {
	
	private BoardCommentDao bcDao = new BoardCommentDao();

	public int insertComment(BoardComment bco) {
		Connection con = getConnection();
		
		int result = bcDao.insertComment(con,bco);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	
	public ArrayList<BoardComment> selectList(int bno) {
		Connection con = getConnection();
		
		ArrayList<BoardComment> clist = bcDao.selectList(con,bno);
		
		close(con);
		
		return clist;
	}


	public int updateComment(BoardComment cno) {
		Connection con = getConnection();
		
		int result = bcDao.updateBoardComment(con,cno);
		
		if(result > 0 )commit(con);
        else rollback(con);      
  
		close(con);
  
     	return result;	
		
	}


	public int deleteComment(int cno) {
		Connection con = getConnection();
		
		int result = bcDao.deleteBoard(con,cno);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);		
		
		return result;
	}
}
