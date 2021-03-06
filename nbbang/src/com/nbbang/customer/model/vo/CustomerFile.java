package com.nbbang.customer.model.vo;

import java.util.Arrays;

public class CustomerFile {

//	private int csFile; //파일 식별값 ex(index)
	private int csFileId;//고객센터 식별값 (파일하고 연결시켜주는 다리 역할)
	private String csFileName;//파일 이름 
	
	public CustomerCenter cc;
	
		
	
	public CustomerFile() {
		// TODO Auto-generated constructor stub
	}



	public CustomerFile(int csFileId, String csFileName, CustomerCenter cc) {
		super();
		this.csFileId = csFileId;
		this.csFileName = csFileName;
		this.cc = cc;
	}



	public int getCsFileId() {
		return csFileId;
	}



	public void setCsFileId(int csFileId) {
		this.csFileId = csFileId;
	}



	public String getCsFileName() {
		return csFileName;
	}



	public void setCsFileName(String csFileName) {
		this.csFileName = csFileName;
	}



	public CustomerCenter getCc() {
		return cc;
	}



	public void setCc(CustomerCenter cc) {
		this.cc = cc;
	}



	@Override
	public String toString() {
		return "CustomerFile [csFileId=" + csFileId + ", csFileName=" + csFileName + ", cc=" + cc + "]";
	}

	





	
}
