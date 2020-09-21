package com.nbbang.board.model.vo;

import java.util.Date;

public class Comment {
	private int comId;//댓글식별값
	private int com_layer;//대댓글 레벨
	private int cwriterUsid;//댓글작성자USID
	private int cboard_id;//댓글 달린 게시물 아이디
	private String comment;//댓글 내용
	private Date cenroll_date;//댓글 작성 날짜
	private Boolean secret;//비밀 댓글 여부
	private String cwriterNickname;//작성자 닉네임
	private String comProfile;//프로필 이미지 경로
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int comId, int com_layer, int cwriterUsid, int cboard_id, String comment, Date cenroll_date,
			Boolean secret, String cwriterNickname, String comProfile) {
		super();
		this.comId = comId;
		this.com_layer = com_layer;
		this.cwriterUsid = cwriterUsid;
		this.cboard_id = cboard_id;
		this.comment = comment;
		this.cenroll_date = cenroll_date;
		this.secret = secret;
		this.cwriterNickname = cwriterNickname;
		this.comProfile = comProfile;
	}

	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public int getCom_layer() {
		return com_layer;
	}

	public void setCom_layer(int com_layer) {
		this.com_layer = com_layer;
	}

	public int getCwriterUsid() {
		return cwriterUsid;
	}

	public void setCwriterUsid(int cwriterUsid) {
		this.cwriterUsid = cwriterUsid;
	}

	public int getCboard_id() {
		return cboard_id;
	}

	public void setCboard_id(int cboard_id) {
		this.cboard_id = cboard_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCenroll_date() {
		return cenroll_date;
	}

	public void setCenroll_date(Date cenroll_date) {
		this.cenroll_date = cenroll_date;
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

	@Override
	public String toString() {
		return "Comment [comId=" + comId + ", com_layer=" + com_layer + ", cwriterUsid=" + cwriterUsid + ", cboard_id="
				+ cboard_id + ", comment=" + comment + ", cenroll_date=" + cenroll_date + ", secret=" + secret
				+ ", cwriterNickname=" + cwriterNickname + ", comProfile=" + comProfile + "]";
	}
}
