package com.nbbang.customer.model.vo;

import java.util.Arrays;

public class CustomerFile {

	private int csFile; //파일 식별값 ex(index)
	private int csFileId;//고객센터 식별값 (파일하고 연결시켜주는 다리 역할)
	private String[] csFileName;//파일 이름 
	
	public CustomerFile() {
		// TODO Auto-generated constructor stub
	}

	public CustomerFile(int csFile, int csFileId, String[] csFileName) {
		super();
		this.csFile = csFile;
		this.csFileId = csFileId;
		this.csFileName = csFileName;
	}

	public int getCsFile() {
		return csFile;
	}

	public void setCsFile(int csFile) {
		this.csFile = csFile;
	}

	public int getCsFileId() {
		return csFileId;
	}

	public void setCsFileId(int csFileId) {
		this.csFileId = csFileId;
	}

	public String[] getCsFileName() {
		return csFileName;
	}

	public void setCsFileName(String[] csFileName) {
		this.csFileName = csFileName;
	}

	@Override
	public String toString() {
		return "CustomerFile [csFile=" + csFile + ", csFileId=" + csFileId + ", csFileName="
				+ Arrays.toString(csFileName) + "]";
	}


	
}
