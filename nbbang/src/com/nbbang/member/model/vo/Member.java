package com.nbbang.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {

	private int usid; //유저식별값
	private String memberPwd; //회원 비밀번호(단방향) 영문,숫자 혼합 4~16자
	private String memberName; //회원 이름 한글 기준 2~5자
	private String nickname; //회원 닉네임 한글 기준 10자
	private String gender; //성별 M or F
	private Date birthday; //생년월일
	private String phone; //전화번호(양방향) -없이 11자
	private String address; //주소(양방향)
	private String memberId; //이메일&아이디
	private Date enrollDate; //가입일
	private int point; //포인트수치(현금화 포인트임 등급이랑은 무관)
	private Boolean leaveMem; //회원 탈퇴여부 (1은 탈퇴유저, 0은 탈퇴 안한 유저)
	private int nbbangScore; //N빵 점수 (일정 이상 모을 수록 회원 등급 상승)
	private String memberPicture; //회원 프로필 사진 (파일 이름, 확장자명)
	private boolean pwIsUuid; //임시비번임을 알려주는 용도의 변수^!^
	private String curRoomBid; //민수꺼 지우지 말기^^
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int usid, String memberPwd, String memberName, String nickname, String gender, Date birthday,
			String phone, String address, String memberId, Date enrollDate, int point, Boolean leaveMem,
			int nbbangScore, String memberPicture, boolean pwIsUuid, String curRoomBid) {
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
		this.point = point;
		this.leaveMem = leaveMem;
		this.nbbangScore = nbbangScore;
		this.memberPicture = memberPicture;
		this.pwIsUuid = pwIsUuid;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Boolean getLeaveMem() {
		return leaveMem;
	}

	public void setLeaveMem(Boolean leaveMem) {
		this.leaveMem = leaveMem;
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

	public boolean isPwIsUuid() {
		return pwIsUuid;
	}

	public void setPwIsUuid(boolean pwIsUuid) {
		this.pwIsUuid = pwIsUuid;
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
				+ address + ", memberId=" + memberId + ", enrollDate=" + enrollDate + ", point=" + point + ", leaveMem="
				+ leaveMem + ", nbbangScore=" + nbbangScore + ", memberPicture=" + memberPicture + ", pwIsUuid="
				+ pwIsUuid + ", curRoomBid=" + curRoomBid + "]";
	}

	
}
