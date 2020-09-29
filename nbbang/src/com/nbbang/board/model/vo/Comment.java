package com.nbbang.board.model.vo;

import java.util.Date;

public class Comment {
	private int comLayer;//대댓글 레벨
	private int cboardId;//댓글 달린 게시물 아이디
	private String content;//댓글 내용
	private Date cenrollDate;//댓글 작성 날짜
	private Boolean secret;//비밀 댓글 여부
	private String cwriterNickname;//작성자 닉네임
	private String comProfile;//프로필 이미지 경로
	private int comId;//댓글 식별자
	private int comRef;//댓글 참조값
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int comLayer, int cboardId, String content, Date cenrollDate, Boolean secret, String cwriterNickname,
			String comProfile, int comId, int comRef) {
		super();
		this.comLayer = comLayer;
		this.cboardId = cboardId;
		this.content = content;
		this.cenrollDate = cenrollDate;
		this.secret = secret;
		this.cwriterNickname = cwriterNickname;
		this.comProfile = comProfile;
		this.comId = comId;
		this.comRef = comRef;
	}

	public int getComLayer() {
		return comLayer;
	}

	public void setComLayer(int comLayer) {
		this.comLayer = comLayer;
	}

	public int getCboardId() {
		return cboardId;
	}

	public void setCboardId(int cboardId) {
		this.cboardId = cboardId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCenrollDate() {
		return cenrollDate;
	}

	public void setCenrollDate(Date cenrollDate) {
		this.cenrollDate = cenrollDate;
	}

	public Boolean getSecret() {
		return secret;
	}

	public void setSecret(Boolean secret) {
		this.secret = secret;
	}

	public String getCwriterNickname() {
		return cwriterNickname;
	}

	public void setCwriterNickname(String cwriterNickname) {
		this.cwriterNickname = cwriterNickname;
	}

	public String getComProfile() {
		return comProfile;
	}

	public void setComProfile(String comProfile) {
		this.comProfile = comProfile;
	}

	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public int getComRef() {
		return comRef;
	}

	public void setComRef(int comRef) {
		this.comRef = comRef;
	}

	@Override
	public String toString() {
		return "Comment [comLayer=" + comLayer + ", cboardId=" + cboardId + ", content=" + content + ", cenrollDate="
				+ cenrollDate + ", secret=" + secret + ", cwriterNickname=" + cwriterNickname + ", comProfile="
				+ comProfile + ", comId=" + comId + ", comRef=" + comRef + "]";
	}
}
