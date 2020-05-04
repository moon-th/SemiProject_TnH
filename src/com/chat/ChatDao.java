package com.chat;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;
import static com.member.common.JDBCTemplate.*;

public class ChatDao {

	private Properties prop;

	public ChatDao() {
		prop = new Properties();

		String filePath = ChatDao.class.getResource("/config/member-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Chat> getChatList(String nowTime) {

		Connection con = getConnection();
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("chat");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, nowTime);

			rset = pstmt.executeQuery();

			chatList = new ArrayList<Chat>();

			while (rset.next()) {

				Chat chat = new Chat();
				chat.setChatId(rset.getInt("CHAT_ID"));
				chat.setChatName(rset.getString("CHAT_NAME"));
				chat.setChatContent(rset.getString("CHAT_CONTENT").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				
				
				
				  int chatTime =
				  Integer.parseInt(rset.getString("CHAT_TIME").substring(11,13)); String
				  timeType = "오전";
				  
				  if(Integer.parseInt(rset.getString("CHAT_TIME").substring(11,13)) >= 12){
				  
				  timeType = "오후"; chatTime -= 12;
				  
				  }
				  chat.setChatTime(rset.getString("CHAT_TIME").substring(0,11)+" "+timeType+" "
				  +chatTime + ":" + rset.getString("CHAT_TIME").substring(14,16)+"");
				 
				//chat.setChatTime(rset.getString("CHAT_TIME"));

				chatList.add(chat);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(con);
		}

		return chatList;
	}

	public int submit(String chatName, String chatContent) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = "INSERT INTO CHAT VALUES(SEQ_CHNO.NEXTVAl,?,?,SYSDATE)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, chatName);
			pstmt.setString(2, chatContent);

			result = pstmt.executeUpdate();

			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);

		}
		return result;
	}
	public ArrayList<Chat> getChatListByRecent(int number) {

		System.out.println(number);
		Connection con = getConnection();
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("chatRecent");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, number);

			rset = pstmt.executeQuery();

			chatList = new ArrayList<Chat>();

			while (rset.next()) {

				Chat chat = new Chat();
				chat.setChatId(rset.getInt("CHAT_ID"));
				chat.setChatName(rset.getString("CHAT_NAEM"));
				chat.setChatContent(rset.getString("CHAT_CONTENT").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				
				
				
				  int chatTime =
				  Integer.parseInt(rset.getString("CHAT_TIME").substring(11,13)); String
				  timeType = "오전";
				  
				  if(Integer.parseInt(rset.getString("CHAT_TIME").substring(11,13)) >= 12){
				  
				  timeType = "오후"; chatTime -= 12;
				  
				  }
				  chat.setChatTime(rset.getString("CHAT_TIME").substring(0,11)+" "+timeType+" "
				  +chatTime + ":" + rset.getString("CHAT_TIME").substring(14,16)+"");
				 
				/* chat.setChatTime(rset.getString("CHAT_TIME")); */

				chatList.add(chat);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(con);
		}

		return chatList;
	}
	public ArrayList<Chat> getChatListByRecent(String chatId) {

		Connection con = getConnection();
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("chatRecent");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(chatId));

			rset = pstmt.executeQuery();

			chatList = new ArrayList<Chat>();

			while (rset.next()) {

				Chat chat = new Chat();
				chat.setChatId(rset.getInt("CHAT_ID"));
				chat.setChatName(rset.getString("CHAT_NAEM"));
				chat.setChatContent(rset.getString("CHAT_CONTENT").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				
				
				
				  int chatTime =
				  Integer.parseInt(rset.getString("CHAT_TIME").substring(11,13)); 
				  String timeType = "오전";
				  
				  if(Integer.parseInt(rset.getString("CHAT_TIME").substring(11,13)) >= 12){
				  
				  timeType = "오후"; chatTime -= 12;
				  
				  }
				  chat.setChatTime(rset.getString("CHAT_TIME").substring(0,11)+" "+timeType+" "
				  +chatTime + ":" + rset.getString("CHAT_TIME").substring(14,16)+"");
				 
				//chat.setChatTime(rset.getString("CHAT_TIME"));

				chatList.add(chat);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(con);
		}

		return chatList;
	}
	
	
}
