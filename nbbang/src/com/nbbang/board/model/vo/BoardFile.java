package com.nbbang.board.model.vo;

import java.util.Arrays;

public class BoardFile {
	private int bfId;//게시판 파일 식별값
	private int bfFileId;//게시판 식별값
	private String[] fileName;//파일 이름
	
	public BoardFile() {
		// TODO Auto-generated constructor stub
	}

	public BoardFile(int bfId, int bfFileId, String[] fileName) {
		super();
		this.bfId = bfId;
		this.bfFileId = bfFileId;
		this.fileName = fileName;
	}

	public int getBfId() {
		return bfId;
	}

	public void setBfId(int bfId) {
		this.bfId = bfId;
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

	public void setFileName(String[] fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "BoardFile [bfId=" + bfId + ", bfFileId=" + bfFileId + ", fileName=" + Arrays.toString(fileName) + "]";
	}
}
