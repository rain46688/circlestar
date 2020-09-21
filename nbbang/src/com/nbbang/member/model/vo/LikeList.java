package com.nbbang.member.model.vo;

public class LikeList {
	
	private int likeId; //좋아요 식별값 (LikeList primaryKey)
	private int likeUsid; //좋아요 누른 사람 식별값 (Member primaryKey)
	private int likeBoardId; //좋아요 누른 게시글 식별값 (Board primaryKey)
	private int boardLike; //좋아요
	private String likeUserNickname; //좋아요 누른 유저 닉네임
	
	public LikeList() {
		// TODO Auto-generated constructor stub
	}

	public LikeList(int likeId, int likeUsid, int likeBoardId, int boardLike, String likeUserNickname) {
		super();
		this.likeId = likeId;
		this.likeUsid = likeUsid;
		this.likeBoardId = likeBoardId;
		this.boardLike = boardLike;
		this.likeUserNickname = likeUserNickname;
	}

	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	public int getLikeUsid() {
		return likeUsid;
	}

	public void setLikeUsid(int likeUsid) {
		this.likeUsid = likeUsid;
	}

	public int getLikeBoardId() {
		return likeBoardId;
	}

	public void setLikeBoardId(int likeBoardId) {
		this.likeBoardId = likeBoardId;
	}

	public int getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	public String getLikeUserNickname() {
		return likeUserNickname;
	}

	public void setLikeUserNickname(String likeUserNickname) {
		this.likeUserNickname = likeUserNickname;
	}

	@Override
	public String toString() {
		return "LikeList [likeId=" + likeId + ", likeUsid=" + likeUsid + ", likeBoardId=" + likeBoardId + ", boardLike="
				+ boardLike + ", likeUserNickname=" + likeUserNickname + "]";
	}

}
