package com.nbbang.admin.model.vo;

import com.nbbang.board.model.vo.Board;

public class AdminBoard {

	private Board bo;
	private String nbbangMemCount;
	private int likeCount;

	public AdminBoard() {
		// TODO Auto-generated constructor stub
	}

	public AdminBoard(Board bo, String nbbangMemCount, int likeCount) {
		super();
		this.bo = bo;
		this.nbbangMemCount = nbbangMemCount;
		this.likeCount = likeCount;
	}

	public Board getBo() {
		return bo;
	}

	public void setBo(Board bo) {
		this.bo = bo;
	}

	public String getNbbangMemCount() {
		return nbbangMemCount;
	}

	public void setNbbangMemCount(String nbbangMemCount) {
		this.nbbangMemCount = nbbangMemCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "AdminBoard [bo=" + bo + ", nbbangMemCount=" + nbbangMemCount + ", likeCount=" + likeCount + "]";
	}

}
