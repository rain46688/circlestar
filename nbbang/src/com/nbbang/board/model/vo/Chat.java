package com.nbbang.board.model.vo;

public class Chat {
	
	private int chatId;// 채팅 식별값
	private int chatBoardId;// 게시글 식별값
	private int chatWriterUsid;// 채팅 작성자 USID
	private String chatWriterNickname;// 채팅 작성자 닉네임
	private String chatContent;// 채팅 내용
	private String chatProfileImage;// 채팅 프로필 이미지 경로
	
	public Chat() {
		// TODO Auto-generated constructor stub
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public int getChatBoardId() {
		return chatBoardId;
	}

	public void setChatBoardId(int chatBoardId) {
		this.chatBoardId = chatBoardId;
	}

	public int getChatWriterUsid() {
		return chatWriterUsid;
	}

	public void setChatWriterUsid(int chatWriterUsid) {
		this.chatWriterUsid = chatWriterUsid;
	}

	public String getChatWriterNickname() {
		return chatWriterNickname;
	}

	public void setChatWriterNickname(String chatWriterNickname) {
		this.chatWriterNickname = chatWriterNickname;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatProfileImage() {
		return chatProfileImage;
	}

	public void setChatProfileImage(String chatProfileImage) {
		this.chatProfileImage = chatProfileImage;
	}

	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", chatBoardId=" + chatBoardId + ", chatWriterUsid=" + chatWriterUsid
				+ ", chatWriterNickname=" + chatWriterNickname + ", chatContent=" + chatContent + ", chatProfileImage="
				+ chatProfileImage + "]";
	}
}
