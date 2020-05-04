package com.confirmBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class cBoard implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8931951231924059648L;
	private int cBno;			// 게시글 번호
	private int cbsecType;		// 기밀등급
	private String cBtitle;		// 제목
	private String cBcontent;	// 게시글 내용
	private String cBwriter;	// 게시글 기안자
	private String bwriterId;	// DB로부터 가져올 게시글 기안자 사원번호
	private int cBcount;		// 게시글 조회수
	private String cBoardfile;	// 게시글 첨부파일
	private Date cBdate;		// 작성일
	private String cStatus;		// 삭제여부('Y'이면 삭제 X, 'N'이면 삭제 O)

	private String checkList;	// 검토자
	private String referList;	// 협조자
	private String confirm;		// 승인자
	
	private int keepingDoc;		// 보존기간
	
	private String optionCheck;	// 검토자 체크여부
	private String optionApproval;	// 승인자 체크여부
	
	private String denyEmpNo;		// 반려자 EmpNo
	
	// 기본 생성자
	public cBoard () {}

	public int getcBno() {
		return cBno;
	}

	

	public String getDenyEmpNo() {
		return denyEmpNo;
	}

	public void setDenyEmpNo(String denyEmpNo) {
		this.denyEmpNo = denyEmpNo;
	}

	public void setcBno(int cBno) {
		this.cBno = cBno;
	}

	public int getCbsecType() {
		return cbsecType;
	}

	public void setCbsecType(int cbsecType) {
		this.cbsecType = cbsecType;
	}

	public String getcBtitle() {
		return cBtitle;
	}

	public void setcBtitle(String cBtitle) {
		this.cBtitle = cBtitle;
	}

	public String getcBcontent() {
		return cBcontent;
	}

	public void setcBcontent(String cBcontent) {
		this.cBcontent = cBcontent;
	}

	public String getcBwriter() {
		return cBwriter;
	}

	public void setcBwriter(String cBwriter) {
		this.cBwriter = cBwriter;
	}

	public String getBwriterId() {
		return bwriterId;
	}

	public void setBwriterId(String bwriterId) {
		this.bwriterId = bwriterId;
	}

	public int getcBcount() {
		return cBcount;
	}

	public void setcBcount(int cBcount) {
		this.cBcount = cBcount;
	}

	public String getcBoardfile() {
		return cBoardfile;
	}

	public void setcBoardfile(String cBoardfile) {
		this.cBoardfile = cBoardfile;
	}

	public Date getcBdate() {
		return cBdate;
	}

	public void setcBdate(Date cBdate) {
		this.cBdate = cBdate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public String getCheckList() {
		return checkList;
	}

	public void setCheckList(String checkList) {
		this.checkList = checkList;
	}

	public String getReferList() {
		return referList;
	}

	public void setReferList(String referList) {
		this.referList = referList;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public int getKeepingDoc() {
		return keepingDoc;
	}

	public void setKeepingDoc(int keepingDoc) {
		this.keepingDoc = keepingDoc;
	}

	public String getOptionCheck() {
		return optionCheck;
	}

	public void setOptionCheck(String optionCheck) {
		this.optionCheck = optionCheck;
	}

	public String getOptionApproval() {
		return optionApproval;
	}

	public void setOptionApproval(String optionApproval) {
		this.optionApproval = optionApproval;
	}

	@Override
	public String toString() {
		return "cBoard [cBno=" + cBno + ", cbsecType=" + cbsecType + ", cBtitle=" + cBtitle + ", cBcontent=" + cBcontent
				+ ", cBwriter=" + cBwriter + ", bwriterId=" + bwriterId + ", cBcount=" + cBcount + ", cBoardfile="
				+ cBoardfile + ", cBdate=" + cBdate + ", cStatus=" + cStatus + ", checkList=" + checkList
				+ ", referList=" + referList + ", confirm=" + confirm + ", keepingDoc=" + keepingDoc + ", optionCheck="
				+ optionCheck + ", optionApproval=" + optionApproval + ", denyEmpNo=" + denyEmpNo + "]";
	}

}
