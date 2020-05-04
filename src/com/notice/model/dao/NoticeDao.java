package com.notice.model.dao;

import static com.member.common.JDBCTemplate.close;

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
/*import com.board.model.vo.Board;
*/import com.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop;
	
	public NoticeDao() {
		prop = new Properties();
		
		String filePath = Board.class.getResource("/config/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Notice> selectList(Connection con) {
		ArrayList<Notice> list = null;
		
		  PreparedStatement pstmt = null;
		  ResultSet rset = null;		
		String sql = prop.getProperty("selectList");
		
		try {
	    	pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,10);
			pstmt.setInt(2,1);
	    	
	    	rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setRnum(rset.getInt(1));
				n.setNno(rset.getInt(2));
				n.setNtitle(rset.getString(3));
				n.setNcontent(rset.getString(4));
				n.setNwriter(rset.getString(5));
				n.setnCount(rset.getInt(6));
				n.setNdate(rset.getDate(7));
				n.setNoticefile(rset.getString(8));
				
				list.add(n);
				
			}
								
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
						
		return list;
	}

	public int insertNotice(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			System.out.println(n.toString());
			
			pstmt.setString(1, n.getNtitle());
			pstmt.setString(2, n.getNcontent());
			pstmt.setString(3, n.getNwriter());
			pstmt.setDate(4, n.getNdate());
			pstmt.setString(5, n.getNoticefile());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateReadCount(Connection con, int nno) {
		  int result = 0;
	      
	      PreparedStatement pstmt = null;
	      
	      String sql = prop.getProperty("updateReadCount");
	      
	      try {
	      
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1,nno);
	         
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         
	         close(pstmt);
	      }
	      return result;
	}

	public Notice selectOne(Connection con, int nno) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				
				n.setNno(rset.getInt("nno"));
				n.setNtitle(rset.getString("ntitle"));
				n.setNcontent(rset.getString("ncontent"));
	            n.setNwriter(rset.getString("nwriter"));
	            n.setnCount(rset.getInt("ncount"));
	            n.setNdate(rset.getDate("ndate"));
	            n.setNoticefile(rset.getString("noticefile"));
	              
	            }
	            System.out.println("notice 확인 : " + n);
	            
	         }catch(SQLException e){
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	         
	         return n;
	}

	public int updateNotice(Connection con, Notice n) {
			int result = 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("updateNotice");
		   
		   try {
			   pstmt = con.prepareStatement(sql);
			   
			   pstmt.setString(1, n.getNtitle());
			   pstmt.setString(2, n.getNcontent());
			   pstmt.setString(3, n.getNoticefile());
			   pstmt.setInt(4, n.getNno());
			   
			   
			   result = pstmt.executeUpdate();
			   
			
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }
		   
		   return result;
	}

	public int deleteNotice(Connection con, int nno) {
		int result = 0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("deleteNotice");
		   
		   try {
			   pstmt = con.prepareStatement(sql);		   
			   
			   pstmt.setInt(1, nno);
			   
			   result = pstmt.executeUpdate();
			   
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }
		
		   return result;
	}

	public ArrayList<Notice> searchNotice(Connection con, String category, String keyword) {
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(category) {
		case "writer" : 
			sql = prop.getProperty("searchWriterNotice");
			break;
		case "title" : 
			sql = prop.getProperty("searchTitleNotice");
			break;
		case "content" :
			sql = prop.getProperty("searchContentNotice");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setRnum(rset.getInt(1));
				n.setNno(rset.getInt(2));
				n.setNtitle(rset.getString(3));
				n.setNcontent(rset.getString(4));
				n.setNwriter(rset.getString(5));
				n.setnCount(rset.getInt(6));
				n.setNdate(rset.getDate(7));
				
				list.add(n);
			}
			System.out.println(list.toString());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
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

	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Notice> list = null;
	      
		  PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;

	      String sql = prop.getProperty("selectList");
	      
	      try {	         
	    	  
	    	  pstmt = con.prepareStatement(sql);
	    	  int startRow = (currentPage-1)*limit +1; 
				int endRow = startRow + limit -1;
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				
	         
	         rset= pstmt.executeQuery();
	         
	         
	         
	         list = new ArrayList<Notice>();
	         
	         while(rset.next()) {
	        	 Notice n = new Notice();
	        	 
	            n.setRnum(rset.getInt("RNUM"));
	        	n.setNno(rset.getInt("NNO"));				
				n.setNtitle(rset.getString("NTITLE"));
				n.setNcontent(rset.getString("NCONTENT"));
				n.setNwriter(rset.getString("NWRITER"));
				n.setnCount(rset.getInt("NCOUNT"));
				n.setNdate(rset.getDate("NDATE"));
				n.setNoticefile(rset.getString("NOTICEFILE"));
	            list.add(n);	            
	            
	           
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         
	         close(rset);
	         close(pstmt);
	      }
	          
	      
	      return list;
	}

	public int getListCount(Connection con, String category, String keyword) {
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

	public ArrayList<Notice> searchListNotice(Connection con, String category, String keyword, int limit, int currentPage) {
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		System.out.println("1,"+list);
		System.out.println("카테고리"+category);
		switch(category) {
		case "writer" : 
			sql = prop.getProperty("searchWriterNotice");
			break;
		case "title" :
			sql = prop.getProperty("searchTitleNotice");
			break;
		case "content" :
			sql = prop.getProperty("searchContentNotice");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1)*limit + 1;
			int endRow = startRow + limit -1;		
						
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setRnum(rset.getInt("rnum"));
				n.setNno(rset.getInt("nno"));
				n.setNtitle(rset.getString("ntitle"));
				n.setNcontent(rset.getString("ncontent"));
				n.setNwriter(rset.getString("nwriter"));
				n.setnCount(rset.getInt("ncount"));
				n.setNdate(rset.getDate("ndate"));
								
				list.add(n);
			}
			System.out.println(list.toString());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}



