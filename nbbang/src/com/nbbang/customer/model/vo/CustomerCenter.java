package com.nbbang.customer.model.vo;

import java.sql.Date;
import java.util.List;

public class CustomerCenter {

	private int csId;
	private int csWriterUsid;
	private String csType;
	private String csTitle;
	private String csContent;
	private Date csDate;
	private Boolean csIscheck;
	private String csNickname;
	private String csAnswer;
	
	private List<CustomerFile> cf;//객체값 사용 위해서 public으로 선언하는거에요 getter/setter로 똑같이 접근 가능
	
	public List<CustomerFile> getCf() {
		return cf;
	}

	public void setCf(List<CustomerFile> cf) {
		this.cf = cf;
	}

	public CustomerCenter() {
		// TODO Auto-generated constructor stub
	}

	public CustomerCenter(int csId, int csWriterUsid, String csType, String csTitle, String csContent, Date csDate,
			Boolean csIscheck, String csNickname, String csAnswer) {
		super();
		this.csId = csId;
		this.csWriterUsid = csWriterUsid;
		this.csType = csType;
		this.csTitle = csTitle;
		this.csContent = csContent;
		this.csDate = csDate;
		this.csIscheck = csIscheck;
		this.csNickname = csNickname;
		this.csAnswer = csAnswer;
	}

	public int getCsId() {
		return csId;
	}

	public void setCsId(int csId) {
		this.csId = csId;
	}

	public int getCsWriterUsid() {
		return csWriterUsid;
	}

	public void setCsWriterUsid(int csWriterUsid) {
		this.csWriterUsid = csWriterUsid;
	}

	public String getCsType() {
		return csType;
	}

	public void setCsType(String csType) {
		this.csType = csType;
	}

	public String getCsTitle() {
		return csTitle;
	}

	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}

	public String getCsContent() {
		return csContent;
	}

	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}

	public Date getCsDate() {
		return csDate;
	}

	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}

	public Boolean getCsIscheck() {
		return csIscheck;
	}

	public void setCsIscheck(Boolean csIscheck) {
		this.csIscheck = csIscheck;
	}

	public String getCsNickname() {
		return csNickname;
	}

	public void setCsNickname(String csNickname) {
		this.csNickname = csNickname;
	}

	public String getCsAnswer() {
		return csAnswer;
	}

	public void setCsAnswer(String csAnswer) {
		this.csAnswer = csAnswer;
	}

	@Override
	public String toString() {
		return "CustomerCenter [csId=" + csId + ", csWriterUsid=" + csWriterUsid + ", csType=" + csType + ", csTitle="
				+ csTitle + ", csContent=" + csContent + ", csDate=" + csDate + ", csIscheck=" + csIscheck
				+ ", csNickname=" + csNickname + ", csAnswer=" + csAnswer + "]";
	}

	

	
	

	



	
	
	
}
