package com.nbbang.board.model.vo;

import java.util.Arrays;

public class BoardFile {
	private int bfFileId;//게시판 식별값
	private String[] fileName;//파일 이름
	
	public BoardFile() {
		// TODO Auto-generated constructor stub
	}

	public BoardFile( int bfFileId, String[] fileName) {
		super();
		this.bfFileId = bfFileId;
		this.fileName = fileName;
	}

	public int getBfFileId() {
		return bfFileId;
	}

	public void setBfFileId(int bfFileId) {
		this.bfFileId = bfFileId;
	}

	public String[] getFileName() {
		return fileName;
	}
	
	public String getFileName(String toString) {
		String result = new String();
		for(int i = 0; i < fileName.length; i++) {
			if(i==0) {
				result += fileName[i];
			}else {
				result += ","+fileName[i];
			}
		}
		return result;
	}

	public void setFileName(String[] fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "BoardFile bfFileId=" + bfFileId + ", fileName=" + Arrays.toString(fileName) + "]";
	}
}
