package com.nbbang.board.model.vo;

import java.util.Arrays;
import java.util.Date;

public class Board {

	private int boardId;
	private int writerUsid;
	private String boardTitle;
	private String writerNickname;
	private String content;
	private Date enrollDate;
	private int hit;
	private String productCategory;
	private String tradeArea;
	private int maxMems;
	private Date limitTime;
	private	int tradeStage;
	private int likeCount;
	private boolean popularBoard;
	private int productPrice;
	private String ownStatus;
	private String tradeKind;
	private String productUrl;
	private String time;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	

	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public Board(int boardId, int writerUsid, String boardTitle, String writerNickname, String content, Date enrollDate,
			int hit, String productCategory, String tradeArea, int maxMems, Date limitTime, int tradeStage,
			int likeCount, boolean popularBoard, int productPrice, String ownStatus, String tradeKind,
			String productUrl, String time) {
		super();
		this.boardId = boardId;
		this.writerUsid = writerUsid;
		this.boardTitle = boardTitle;
		this.writerNickname = writerNickname;
		this.content = content;
		this.enrollDate = enrollDate;
		this.hit = hit;
		this.productCategory = productCategory;
		this.tradeArea = tradeArea;
		this.maxMems = maxMems;
		this.limitTime = limitTime;
		this.tradeStage = tradeStage;
		this.likeCount = likeCount;
		this.popularBoard = popularBoard;
		this.productPrice = productPrice;
		this.ownStatus = ownStatus;
		this.tradeKind = tradeKind;
		this.productUrl = productUrl;
		this.time = time;
	}



	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getWriterUsid() {
		return writerUsid;
	}

	public void setWriterUsid(int writerUsid) {
		this.writerUsid = writerUsid;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getTradeArea() {
		return tradeArea;
	}

	public void setTradeArea(String tradeArea) {
		this.tradeArea = tradeArea;
	}

	public int getMaxMems() {
		return maxMems;
	}

	public void setMaxMems(int maxMems) {
		this.maxMems = maxMems;
	}

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	public int getTradeStage() {
		return tradeStage;
	}

	public void setTradeStage(int tradeStage) {
		this.tradeStage = tradeStage;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public boolean isPopularBoard() {
		return popularBoard;
	}

	public void setPopularBoard(boolean popularBoard) {
		this.popularBoard = popularBoard;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getOwnStatus() {
		return ownStatus;
	}

	public void setOwnStatus(String ownStatus) {
		this.ownStatus = ownStatus;
	}

	public String getTradeKind() {
		return tradeKind;
	}

	public void setTradeKind(String tradeKind) {
		this.tradeKind = tradeKind;
	}

	public String getProductUrl() {
		return productUrl;
	}

	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", writerUsid=" + writerUsid + ", boardTitle=" + boardTitle
				+ ", writerNickname=" + writerNickname + ", content=" + content + ", enrollDate=" + enrollDate
				+ ", hit=" + hit + ", productCategory=" + productCategory + ", tradeArea=" + tradeArea + ", maxMems="
				+ maxMems + ", limitTime=" + limitTime + ", tradeStage=" + tradeStage + ", likeCount=" + likeCount
				+ ", popularBoard=" + popularBoard + ", productPrice=" + productPrice + ", ownStatus=" + ownStatus
				+ ", tradeKind=" + tradeKind + ", productUrl=" + productUrl + ", time=" + time + "]";
	}
}
