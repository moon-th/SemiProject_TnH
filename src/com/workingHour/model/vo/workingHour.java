package com.workingHour.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class workingHour implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2525299280430739636L;
	
	private int workNo;
	private Date workDate;
	
	private int workType1;
	private String workTime1;
	private String workTime11;
	
	private int workType2;
	private String workTime2;
	private String workTime21;
	
	private int workType3;
	private String workTime3;
	private String workTime31;
	
	private String inputYN;
	
	public workingHour() {}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public int getWorkType1() {
		return workType1;
	}

	public void setWorkType1(int workType1) {
		this.workType1 = workType1;
	}

	public String getWorkTime1() {
		return workTime1;
	}

	public void setWorkTime1(String workTime1) {
		this.workTime1 = workTime1;
	}

	public String getWorkTime11() {
		return workTime11;
	}

	public void setWorkTime11(String workTime11) {
		this.workTime11 = workTime11;
	}

	public int getWorkType2() {
		return workType2;
	}

	public void setWorkType2(int workType2) {
		this.workType2 = workType2;
	}

	public String getWorkTime2() {
		return workTime2;
	}

	public void setWorkTime2(String workTime2) {
		this.workTime2 = workTime2;
	}

	public String getWorkTime21() {
		return workTime21;
	}

	public void setWorkTime21(String workTime21) {
		this.workTime21 = workTime21;
	}

	public int getWorkType3() {
		return workType3;
	}

	public void setWorkType3(int workType3) {
		this.workType3 = workType3;
	}

	public String getWorkTime3() {
		return workTime3;
	}

	public void setWorkTime3(String workTime3) {
		this.workTime3 = workTime3;
	}

	public String getWorkTime31() {
		return workTime31;
	}

	public void setWorkTime31(String workTime31) {
		this.workTime31 = workTime31;
	}

	public String getInputYN() {
		return inputYN;
	}

	public void setInputYN(String inputYN) {
		this.inputYN = inputYN;
	}

	@Override
	public String toString() {
		return "workingHour [workNo=" + workNo + ", workDate=" + workDate + ", workType1=" + workType1 + ", workTime1="
				+ workTime1 + ", workTime11=" + workTime11 + ", workType2=" + workType2 + ", workTime2=" + workTime2
				+ ", workTime21=" + workTime21 + ", workType3=" + workType3 + ", workTime3=" + workTime3
				+ ", workTime31=" + workTime31 + ", inputYN=" + inputYN + "]";
	}
	
}
