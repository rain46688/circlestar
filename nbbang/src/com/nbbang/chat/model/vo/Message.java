package com.nbbang.chat.model.vo;

public class Message {
	private String sendNickName;
	private String msg;
	private String curMemsList;
	private String boardId;

	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(String sendNickName, String msg, String curMemsList, String boardId) {
		super();
		this.sendNickName = sendNickName;
		this.msg = msg;
		this.curMemsList = curMemsList;
		this.boardId = boardId;
	}

	public String getSendNickName() {
		return sendNickName;
	}

	public void setSendNickName(String sendNickName) {
		this.sendNickName = sendNickName;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCurMemsList() {
		return curMemsList;
	}

	public void setCurMemsList(String curMemsList) {
		this.curMemsList = curMemsList;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	@Override
	public String toString() {
		return "Message [sendNickName=" + sendNickName + ", msg=" + msg + ", curMemsList=" + curMemsList + ", boardId="
				+ boardId + "]";
	}

}
