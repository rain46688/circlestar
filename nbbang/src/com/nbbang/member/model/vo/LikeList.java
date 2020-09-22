package com.nbbang.member.model.vo;

import java.util.Arrays;

public class LikeList {
	
	private int likeUsid; //좋아요 누른 사람 식별값 (Member primaryKey)
	private int[] likeBoardId; //좋아요 누른 게시판들
	
	public LikeList() {
		// TODO Auto-generated constructor stub
	}

	public LikeList(int likeUsid, int[] likeBoardId) {
		super();
		this.likeUsid = likeUsid;
		this.likeBoardId = likeBoardId;
	}

	public int getLikeUsid() {
		return likeUsid;
	}

	public void setLikeUsid(int likeUsid) {
		this.likeUsid = likeUsid;
	}

	public int[] getLikeBoardId() {
		return likeBoardId;
	}

	public void setLikeBoardId(int[] likeBoardId) {
		this.likeBoardId = likeBoardId;
	}

	@Override
	public String toString() {
		return "LikeList [likeUsid=" + likeUsid + ", likeBoardId=" + Arrays.toString(likeBoardId) + "]";
	}
	
}
