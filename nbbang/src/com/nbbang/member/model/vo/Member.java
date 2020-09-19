package com.nbbang.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {

	private int usid;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private String gender;
	private Date birthday;
	private String phone;
	private String address;
	private String memberId;
	private Date enrollDate;
	private String grade;
	private int maxRoomCount;
	private int reportCount;
	private int point;
	private int leaveMem;
	private String curTradeList;
	private String curCreateList;
	private String deliveryList;
	private String tradeList;
	private String likeList;
	private int nbbangScore;
	private String memberPicture;
	private String curRoomBid;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int usid, String memberPwd, String memberName, String nickname, String gender, Date birthday,
			String phone, String address, String memberId, Date enrollDate, String grade, int maxRoomCount,
			int reportCount, int point, int leaveMem, String curTradeList, String curCreateList, String deliveryList,
			String tradeList, String likeList, int nbbangScore, String memberPicture, String curRoomBid) {
		super();
		this.usid = usid;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickname = nickname;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.memberId = memberId;
		this.enrollDate = enrollDate;
		this.grade = grade;
		this.maxRoomCount = maxRoomCount;
		this.reportCount = reportCount;
		this.point = point;
		this.leaveMem = leaveMem;
		this.curTradeList = curTradeList;
		this.curCreateList = curCreateList;
		this.deliveryList = deliveryList;
		this.tradeList = tradeList;
		this.likeList = likeList;
		this.nbbangScore = nbbangScore;
		this.memberPicture = memberPicture;
		this.curRoomBid = curRoomBid;
	}

	public int getUsid() {
		return usid;
	}

	public void setUsid(int usid) {
		this.usid = usid;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getMaxRoomCount() {
		return maxRoomCount;
	}

	public void setMaxRoomCount(int maxRoomCount) {
		this.maxRoomCount = maxRoomCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLeaveMem() {
		return leaveMem;
	}

	public void setLeaveMem(int leaveMem) {
		this.leaveMem = leaveMem;
	}

	public String getCurTradeList() {
		return curTradeList;
	}

	public void setCurTradeList(String curTradeList) {
		this.curTradeList = curTradeList;
	}

	public String getCurCreateList() {
		return curCreateList;
	}

	public void setCurCreateList(String curCreateList) {
		this.curCreateList = curCreateList;
	}

	public String getDeliveryList() {
		return deliveryList;
	}

	public void setDeliveryList(String deliveryList) {
		this.deliveryList = deliveryList;
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

	public int getNbbangScore() {
		return nbbangScore;
	}

	public void setNbbangScore(int nbbangScore) {
		this.nbbangScore = nbbangScore;
	}

	public String getMemberPicture() {
		return memberPicture;
	}

	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}

	public String getCurRoomBid() {
		return curRoomBid;
	}

	public void setCurRoomBid(String curRoomBid) {
		this.curRoomBid = curRoomBid;
	}

	@Override
	public String toString() {
		return "Member [usid=" + usid + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", nickname="
				+ nickname + ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone + ", address="
				+ address + ", memberId=" + memberId + ", enrollDate=" + enrollDate + ", grade=" + grade
				+ ", maxRoomCount=" + maxRoomCount + ", reportCount=" + reportCount + ", point=" + point + ", leaveMem="
				+ leaveMem + ", curTradeList=" + curTradeList + ", curCreateList=" + curCreateList + ", deliveryList="
				+ deliveryList + ", tradeList=" + tradeList + ", likeList=" + likeList + ", nbbangScore=" + nbbangScore
				+ ", memberPicture=" + memberPicture + ", curRoomBid=" + curRoomBid + "]";
	}
}
