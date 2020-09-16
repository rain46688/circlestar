package com.nbbang.member.model.vo;

import java.sql.Date;

public class Member {

	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private String phone;
	private String address;
	private String email;
	private Date enrollDate;
	private String grade;
	private String curRoomCnt;
	private String maxRoomCnt;
	private String reportCnt;
	private String point;
	private String leaveMem;
	private String curTradeList;
	private String tradeList;
	private String likeList;
	private String memberPicture;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPwd, String memberName, String nickname, String phone, String address,
			String email, Date enrollDate, String grade, String curRoomCnt, String maxRoomCnt, String reportCnt,
			String point, String leaveMem, String curTradeList, String tradeList, String likeList,
			String memberPicture) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickname = nickname;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.enrollDate = enrollDate;
		this.grade = grade;
		this.curRoomCnt = curRoomCnt;
		this.maxRoomCnt = maxRoomCnt;
		this.reportCnt = reportCnt;
		this.point = point;
		this.leaveMem = leaveMem;
		this.curTradeList = curTradeList;
		this.tradeList = tradeList;
		this.likeList = likeList;
		this.memberPicture = memberPicture;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCurRoomCnt() {
		return curRoomCnt;
	}

	public void setCurRoomCnt(String curRoomCnt) {
		this.curRoomCnt = curRoomCnt;
	}

	public String getMaxRoomCnt() {
		return maxRoomCnt;
	}

	public void setMaxRoomCnt(String maxRoomCnt) {
		this.maxRoomCnt = maxRoomCnt;
	}

	public String getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(String reportCnt) {
		this.reportCnt = reportCnt;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getLeaveMem() {
		return leaveMem;
	}

	public void setLeaveMem(String leaveMem) {
		this.leaveMem = leaveMem;
	}

	public String getCurTradeList() {
		return curTradeList;
	}

	public void setCurTradeList(String curTradeList) {
		this.curTradeList = curTradeList;
	}

	public String getTradeList() {
		return tradeList;
	}

	public void setTradeList(String tradeList) {
		this.tradeList = tradeList;
	}

	public String getLikeList() {
		return likeList;
	}

	public void setLikeList(String likeList) {
		this.likeList = likeList;
	}

	public String getMemberPicture() {
		return memberPicture;
	}

	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", nickname=" + nickname + ", phone=" + phone + ", address=" + address + ", email=" + email
				+ ", enrollDate=" + enrollDate + ", grade=" + grade + ", curRoomCnt=" + curRoomCnt + ", maxRoomCnt="
				+ maxRoomCnt + ", reportCnt=" + reportCnt + ", point=" + point + ", leaveMem=" + leaveMem
				+ ", curTradeList=" + curTradeList + ", tradeList=" + tradeList + ", likeList=" + likeList
				+ ", memberPicture=" + memberPicture + "]";
	}
	
	
}
