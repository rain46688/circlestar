package com.nbbang.board.model.vo;

import java.util.Arrays;

public class TradeList {
	
	private int tradeBoardId;//게시판 식별값
	private int tradeUsid;//거래하는 유저 식별값
	private boolean tradeStatus;//거래상태여부
	private boolean deliveryStatus;//배송상태여부
	private boolean payStatus;//결제상태여부
	private String tradeUserNickname;//거래하는 유저 닉네임
	
	public TradeList() {
		// TODO Auto-generated constructor stub
	}

	public TradeList(int tradeBoardId, int tradeUsid, boolean tradeStatus, boolean deliveryStatus, boolean payStatus,
			String tradeUserNickname) {
		super();
		this.tradeBoardId = tradeBoardId;
		this.tradeUsid = tradeUsid;
		this.tradeStatus = tradeStatus;
		this.deliveryStatus = deliveryStatus;
		this.payStatus = payStatus;
		this.tradeUserNickname = tradeUserNickname;
	}

	public int getTradeBoardId() {
		return tradeBoardId;
	}

	public void setTradeBoardId(int tradeBoardId) {
		this.tradeBoardId = tradeBoardId;
	}

	public int getTradeUsid() {
		return tradeUsid;
	}

	public void setTradeUsid(int tradeUsid) {
		this.tradeUsid = tradeUsid;
	}

	public boolean isTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(boolean tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	public boolean isDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(boolean deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public boolean isPayStatus() {
		return payStatus;
	}

	public void setPayStatus(boolean payStatus) {
		this.payStatus = payStatus;
	}

	public String getTradeUserNickname() {
		return tradeUserNickname;
	}

	public void setTradeUserNickname(String tradeUserNickname) {
		this.tradeUserNickname = tradeUserNickname;
	}

	@Override
	public String toString() {
		return "TradeList [tradeBoardId=" + tradeBoardId + ", tradeUsid=" + tradeUsid + ", tradeStatus=" + tradeStatus
				+ ", deliveryStatus=" + deliveryStatus + ", payStatus=" + payStatus + ", tradeUserNickname="
				+ tradeUserNickname + "]";
	}

}
