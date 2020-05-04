package com.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {
	
	// DB 의 컬럼과 같은 필드 변수 생성
	
	private int empno;
	private String originname;
	private String changename;
	private String filepath;
	private int flevel;
	private Date uploaddate;
	private String status;
	
	public Attachment() {
		super();
	}
	
	public Attachment(int empno, String originname, String changename, String filepath, int flevel,
			Date uploaddate, String status) {
		super();
		this.empno = empno;
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
		this.flevel = flevel;
		this.uploaddate = uploaddate;
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Attachment [empnp + "+empno+",originname=" + originname + ", changename=" + changename
				+ ", filepath=" + filepath + ", flevel=" + flevel + ", uploaddate=" + uploaddate + ", status=" + status
				+ "]";
	}
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getOriginname() {
		return originname;
	}
	public void setOriginname(String originname) {
		this.originname = originname;
	}
	public String getChangename() {
		return changename;
	}
	public void setChangename(String changename) {
		this.changename = changename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getFlevel() {
		return flevel;
	}
	public void setFlevel(int flevel) {
		this.flevel = flevel;
	}
	public Date getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
