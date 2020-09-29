package com.nbbang.member.model.vo;

import java.util.ArrayList;
import java.util.List;

public class LikeList {
	
	private int likeUsid; //좋아요 누른 사람 식별값 (Member primaryKey)
	private List<Integer> likeBoardId; //좋아요 누른 게시판들
	
	public LikeList() {
		// TODO Auto-generated constructor stub
		likeBoardId = new ArrayList<Integer>();
	}

	public LikeList(int likeUsid, List<Integer> likeBoardId) {
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

	public List<Integer> getLikeBoardId() {
		return likeBoardId;
	}

	public void setLikeBoardId(List<Integer> likeBoardId) {
		this.likeBoardId = likeBoardId;
	}

	@Override
	public String toString() {
		return "LikeList [likeUsid=" + likeUsid + "]";
	}
}
