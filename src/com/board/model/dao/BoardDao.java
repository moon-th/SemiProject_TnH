package com.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.board.model.vo.Board;
import com.notice.model.vo.Notice;

import static com.member.common.JDBCTemplate.*;

public class BoardDao {
	
	private Properties prop;
	
	public BoardDao() {
		prop = new Properties();
	      
	      String filePath = Board.class.getResource("/config/board-query.properties").getPath();
	      
	      try {
	         prop.load(new FileReader(filePath));       
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	}

	public ArrayList<Board> selectList(Connection con,int currentPage, int limit, String typeno) {
		  ArrayList<Board> list = null;
	      	      
		  PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;

	      String sql = prop.getProperty("selectList");
	      
	      try {	         
	    	  System.out.println(typeno);
	    	  pstmt = con.prepareStatement(sql);
	    	  int startRow = (currentPage-1)*limit +1; 
				int endRow = startRow + limit -1;
				pstmt.setString(1, typeno);
				pstmt.setInt(2, endRow);
				pstmt.setInt(3, startRow);
	         
	         rset= pstmt.executeQuery();
	         
	         
	         
	         list = new ArrayList<Board>();
	         
	         while(rset.next()) {
	        	 Board b = new Board();
	        	 
	            b.setRnum(rset.getInt("RNUM"));
	        	b.setBno(rset.getInt("BNO"));
				b.setBtype(rset.getInt("BTYPE"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setBwriter(rset.getString("BWRITER"));
				b.setBcount(rset.getInt("BCOUNT"));
				b.setBdate(rset.getDate("BDATE"));
				b.setBoardfile(rset.getString("BOARDFILE"));
	            list.add(b);	            
	            
	           
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         
	         close(rset);
	         close(pstmt);
	      }
	          
	      
	      return list;
	}
	
	
	public int insertBoard(Connection con, Board b, String typeno) {
		PreparedStatement pstmt = null;
	      
	      int result = 0;
	      
	      String sql = prop.getProperty("insertBoard");
	      
	      try {
	      
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, typeno);
	         pstmt.setString(2, b.getBtitle());
	         pstmt.setString(3, b.getBcontent());
	         pstmt.setString(4, b.getBwriter());
	         pstmt.setString(5, b.getBoardfile());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	      
	         e.printStackTrace();
	      
	      }finally {
	         
	         close(pstmt);
	      
	      }
	      
	      return result;
	}

	public Board selectOne(Connection con, int bno) {
		Board b = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;   // Select의 결과를 담은 객체
        
        String sql = prop.getProperty("selectOne");
        
        try {
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, bno);          
           rset = pstmt.executeQuery();
           
           if(rset.next()) {
              b = new Board();
              
            b.setBno(bno);
			b.setBtype(1);
			b.setBtitle(rset.getString("BTITLE"));
			b.setBcontent(rset.getString("BCONTENT"));
			b.setBwriter(rset.getString("EMP_NAME"));
			b.setBwriterId(rset.getString("BWRITER"));
			b.setBcount(rset.getInt("BCOUNT"));
			b.setBdate(rset.getDate("BDATE"));
			b.setBoardfile(rset.getString("BOARDFILE"));
              
           }
 
           
           
        }catch(SQLException e){
           e.printStackTrace();
        }finally {
           close(pstmt);
        }
        
        return b;
	}

	public int updateReadCount(Connection con, int bno) {
		int result =0;
	      
	      PreparedStatement pstmt = null;
	      
	      String sql = prop.getProperty("updateReadCount");
	      
	      try {
	      
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1,bno);
	         
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         
	         close(pstmt);
	      }
	      return result;
	}

	public int updateBoard(Connection con, Board b) {
		int result = 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("updateBoard");
		   
		   try {
			   pstmt = con.prepareStatement(sql);
			   
			   pstmt.setString(1, b.getBtitle());
			   pstmt.setString(2, b.getBcontent());
			   pstmt.setString(3, b.getBoardfile());
			   pstmt.setInt(4, b.getBno());
			   
			   result = pstmt.executeUpdate();
			   
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }
		
		   return result;
	}

	public int deleteBoard(Connection con, int bno) {
		int result = 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("deleteBoard");
		   
		   try {
			   pstmt = con.prepareStatement(sql);		   
			   
			   pstmt.setInt(1, bno);
			   
			   result = pstmt.executeUpdate();
			   
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }
		
		   return result;
	}

	public ArrayList<Board> searchBoard(Connection con, String category, String keyword) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(category) {
		case "writer" : 
			sql = prop.getProperty("searchWriterBoard");
			break;
		case "title" :
			sql = prop.getProperty("searchTitleBoard");
			break;
		case "content" :
			sql = prop.getProperty("searchContentBoard");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt("bno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBcount(rset.getInt("bcount"));
				b.setBdate(rset.getDate("bdate"));
				
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection con, String category, String keyword, String typeno) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(category) {
		case "writer" : 
			sql = prop.getProperty("searchWriterCount");
			break;
		case "title" :
			sql = prop.getProperty("searchTitleCount");
			break;
		case "content" :
			sql = prop.getProperty("searchContentCount");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, typeno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> searchListBoard(Connection con, String category, String keyword, int limit, int currentPage, String typeno) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		
		switch(category) {
		case "writer" : 
			sql = prop.getProperty("searchWriterBoard");
			break;
		case "title" :
			sql = prop.getProperty("searchTitleBoard");
			break;
		case "content" :
			sql = prop.getProperty("searchContentBoard");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1)*limit + 1;
			int endRow = startRow + limit -1;		
						
			pstmt.setString(1, typeno);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, startRow);
			
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setRnum(rset.getInt("rnum"));
				b.setBno(rset.getInt("bno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBcount(rset.getInt("bcount"));
				b.setBdate(rset.getDate("bdate"));
				b.setBoardfile(rset.getString("boardfile"));
								
				list.add(b);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection con, String typeno) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, typeno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	
	
}
