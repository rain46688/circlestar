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
	private boolean pwIsUuid; //임시비번임을 알려주는 용도의 변수^!^
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int usid, String memberPwd, String memberName, String nickname, String gender, Date birthday,
			String phone, String address, String memberId, Date enrollDate, String grade, int maxRoomCount,
			int reportCount, int point, int leaveMem, String curTradeList, String curCreateList, String deliveryList,
			String tradeList, String likeList, int nbbangScore, String memberPicture, String curRoomBid,
			boolean pwIsUuid) {
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
		this.pwIsUuid = pwIsUuid;
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

	public boolean isPwIsUuid() {
		return pwIsUuid;
	}

	public void setPwIsUuid(boolean pwIsUuid) {
		this.pwIsUuid = pwIsUuid;
	}

	@Override
	public String toString() {
		return "Member [usid=" + usid + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", nickname="
				+ nickname + ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone + ", address="
				+ address + ", memberId=" + memberId + ", enrollDate=" + enrollDate + ", grade=" + grade
				+ ", maxRoomCount=" + maxRoomCount + ", reportCount=" + reportCount + ", point=" + point + ", leaveMem="
				+ leaveMem + ", curTradeList=" + curTradeList + ", curCreateList=" + curCreateList + ", deliveryList="
				+ deliveryList + ", tradeList=" + tradeList + ", likeList=" + likeList + ", nbbangScore=" + nbbangScore
				+ ", memberPicture=" + memberPicture + ", curRoomBid=" + curRoomBid + ", pwIsUuid=" + pwIsUuid + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((birthday == null) ? 0 : birthday.hashCode());
		result = prime * result + ((curCreateList == null) ? 0 : curCreateList.hashCode());
		result = prime * result + ((curRoomBid == null) ? 0 : curRoomBid.hashCode());
		result = prime * result + ((curTradeList == null) ? 0 : curTradeList.hashCode());
		result = prime * result + ((deliveryList == null) ? 0 : deliveryList.hashCode());
		result = prime * result + ((enrollDate == null) ? 0 : enrollDate.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + leaveMem;
		result = prime * result + ((likeList == null) ? 0 : likeList.hashCode());
		result = prime * result + maxRoomCount;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result + ((memberPicture == null) ? 0 : memberPicture.hashCode());
		result = prime * result + ((memberPwd == null) ? 0 : memberPwd.hashCode());
		result = prime * result + nbbangScore;
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + point;
		result = prime * result + (pwIsUuid ? 1231 : 1237);
		result = prime * result + reportCount;
		result = prime * result + ((tradeList == null) ? 0 : tradeList.hashCode());
		result = prime * result + usid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (birthday == null) {
			if (other.birthday != null)
				return false;
		} else if (!birthday.equals(other.birthday))
			return false;
		if (curCreateList == null) {
			if (other.curCreateList != null)
				return false;
		} else if (!curCreateList.equals(other.curCreateList))
			return false;
		if (curRoomBid == null) {
			if (other.curRoomBid != null)
				return false;
		} else if (!curRoomBid.equals(other.curRoomBid))
			return false;
		if (curTradeList == null) {
			if (other.curTradeList != null)
				return false;
		} else if (!curTradeList.equals(other.curTradeList))
			return false;
		if (deliveryList == null) {
			if (other.deliveryList != null)
				return false;
		} else if (!deliveryList.equals(other.deliveryList))
			return false;
		if (enrollDate == null) {
			if (other.enrollDate != null)
				return false;
		} else if (!enrollDate.equals(other.enrollDate))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (leaveMem != other.leaveMem)
			return false;
		if (likeList == null) {
			if (other.likeList != null)
				return false;
		} else if (!likeList.equals(other.likeList))
			return false;
		if (maxRoomCount != other.maxRoomCount)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (memberPicture == null) {
			if (other.memberPicture != null)
				return false;
		} else if (!memberPicture.equals(other.memberPicture))
			return false;
		if (memberPwd == null) {
			if (other.memberPwd != null)
				return false;
		} else if (!memberPwd.equals(other.memberPwd))
			return false;
		if (nbbangScore != other.nbbangScore)
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (point != other.point)
			return false;
		if (pwIsUuid != other.pwIsUuid)
			return false;
		if (reportCount != other.reportCount)
			return false;
		if (tradeList == null) {
			if (other.tradeList != null)
				return false;
		} else if (!tradeList.equals(other.tradeList))
			return false;
		if (usid != other.usid)
			return false;
		return true;
	}
	
}
