package com.nbbang.board.model.vo;

import java.util.Arrays;
import java.util.Date;

public class Board {

	private int boardId;
	private String boardTitle;
	private int writerUsid;
	private String writerNickname;
	private String content;
	private Date enrollDate;
	private int hit;
	private String[] files;
	private String productCategory;
	private String productName;
	private String tradeArea;
	private int maxMems;
	private String[] curMemsList;
	private String[] payMemsList;
	private String[] deliveryMemsList;
	private String limitTime;
	private	int tradeStage;
	private int likeCount;
	private int reportCount;
	private boolean popularBoard;
	private int productPrice;
	private String ownStatus;
	private String tradeKind;
	private String productUrl;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardId, String boardTitle, int writerUsid, String writerNickname, String content, Date enrollDate,
			int hit, String[] files, String productCategory, String productName, String tradeArea, int maxMems,
			String[] curMemsList, String[] payMemsList, String[] deliveryMemsList, String limitTime, int tradeStage,
			int likeCount, int reportCount, boolean popularBoard, int productPrice, String ownStatus, String tradeKind,
			String productUrl) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.writerUsid = writerUsid;
		this.writerNickname = writerNickname;
		this.content = content;
		this.enrollDate = enrollDate;
		this.hit = hit;
		this.files = files;
		this.productCategory = productCategory;
		this.productName = productName;
		this.tradeArea = tradeArea;
		this.maxMems = maxMems;
		this.curMemsList = curMemsList;
		this.payMemsList = payMemsList;
		this.deliveryMemsList = deliveryMemsList;
		this.limitTime = limitTime;
		this.tradeStage = tradeStage;
		this.likeCount = likeCount;
		this.reportCount = reportCount;
		this.popularBoard = popularBoard;
		this.productPrice = productPrice;
		this.ownStatus = ownStatus;
		this.tradeKind = tradeKind;
		this.productUrl = productUrl;
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

	public int getWriterUsid() {
		return writerUsid;
	}

	public void setWriterUsid(int writerUsid) {
		this.writerUsid = writerUsid;
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

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String[] getCurMemsList() {
		return curMemsList;
	}

	public void setCurMemsList(String[] curMemsList) {
		this.curMemsList = curMemsList;
	}

	public String[] getPayMemsList() {
		return payMemsList;
	}

	public void setPayMemsList(String[] payMemsList) {
		this.payMemsList = payMemsList;
	}

	public String[] getDeliveryMemsList() {
		return deliveryMemsList;
	}

	public void setDeliveryMemsList(String[] deliveryMemsList) {
		this.deliveryMemsList = deliveryMemsList;
	}

	public String getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(String limitTime) {
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

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
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
		return "Board [boardId=" + boardId + ", boardTitle=" + boardTitle + ", writerUsid=" + writerUsid
				+ ", writerNickname=" + writerNickname + ", content=" + content + ", enrollDate=" + enrollDate
				+ ", hit=" + hit + ", files=" + Arrays.toString(files) + ", productCategory=" + productCategory
				+ ", productName=" + productName + ", tradeArea=" + tradeArea + ", maxMems=" + maxMems
				+ ", curMemsList=" + Arrays.toString(curMemsList) + ", payMemsList=" + Arrays.toString(payMemsList)
				+ ", deliveryMemsList=" + Arrays.toString(deliveryMemsList) + ", limitTime=" + limitTime
				+ ", tradeStage=" + tradeStage + ", likeCount=" + likeCount + ", reportCount=" + reportCount
				+ ", popularBoard=" + popularBoard + ", productPrice=" + productPrice + ", ownStatus=" + ownStatus
				+ ", tradeKind=" + tradeKind + ", productUrl=" + productUrl + "]";
	}
}
