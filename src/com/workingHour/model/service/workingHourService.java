package com.workingHour.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.member.common.JDBCTemplate.*;

import com.workingHour.model.dao.workingHourDao;
import com.workingHour.model.vo.workingHour;

public class workingHourService {
	
	private workingHourDao wDao = new workingHourDao();
	private Connection con;
	
	/**
	 * 1. 메소드명 : workingHourOpen
	 * 2. 작성일 : 2020. 2. 20. 오후 12:09:57
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 실행시 db에서 근태정보 불러오는 메소드
	 * @param empNo
	 * @param firstDay
	 * @return
	 */
	public ArrayList<workingHour> workingHourOpen(int empNo, String firstDay) {
		
		con = getConnection();
		
		ArrayList<workingHour> list = wDao.workingHourOpen(con , firstDay, empNo);

		close(con);
		
		return list;
	}

	/**
	 * 1. 메소드명 : workingHourInsert
	 * 2. 작성일 : 2020. 2. 21. 오전 10:57:09
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 근태 입력 메소드
	 * @param wh
	 * @return
	 */
	public int workingHourInsert(workingHour wh) {
		
		con = getConnection();
		
		int result = wDao.workingHourInsert(con ,wh);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
