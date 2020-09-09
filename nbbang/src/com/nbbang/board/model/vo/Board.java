package com.nbbang.board.model.vo;

import java.util.Date;

public class Board {

	private int boardId;
	private String boardTitle;
	private String writerId;
	private String content;
	private Date enrollDate;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardId, String boardTitle, String writerId, String content, Date enrollDate) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.writerId = writerId;
		this.content = content;
		this.enrollDate = enrollDate;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", boardTitle=" + boardTitle + ", writerId=" + writerId + ", content="
				+ content + ", enrollDate=" + enrollDate + "]";
	}
}
