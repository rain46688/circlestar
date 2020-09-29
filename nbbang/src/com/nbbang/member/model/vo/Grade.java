package com.nbbang.member.model.vo;

public class Grade {
	
	private int gradeUsid; //유저 식별값 (member primaryKey)
	private int maxRoomCount; //최대 방 생성 가능 개수
	private int reliabilityScore; //신뢰도 점수 증가값
	private int gradeLevel; //회원 등급 레벨
	private String gradeNickname; //등급 유저 닉네임
	
	public Grade() {
		// TODO Auto-generated constructor stub
	}

	public Grade(int gradeUsid, int maxRoomCount, int reliabilityScore, int gradeLevel, String gradeNickname) {
		super();
		this.gradeUsid = gradeUsid;
		this.maxRoomCount = maxRoomCount;
		this.reliabilityScore = reliabilityScore;
		this.gradeLevel = gradeLevel;
		this.gradeNickname = gradeNickname;
	}

	public int getGradeUsid() {
		return gradeUsid;
	}

	public void setGradeUsid(int gradeUsid) {
		this.gradeUsid = gradeUsid;
	}

	public int getMaxRoomCount() {
		return maxRoomCount;
	}

	public void setMaxRoomCount(int maxRoomCount) {
		this.maxRoomCount = maxRoomCount;
	}

	public int getReliabilityScore() {
		return reliabilityScore;
	}

	public void setReliabilityScore(int reliabilityScore) {
		this.reliabilityScore = reliabilityScore;
	}

	public int getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(int gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public String getGradeNickname() {
		return gradeNickname;
	}

	public void setGradeNickname(String gradeNickname) {
		this.gradeNickname = gradeNickname;
	}

	@Override
	public String toString() {
		return "Grade [gradeUsid=" + gradeUsid + ", maxRoomCount=" + maxRoomCount + ", reliabilityScore="
				+ reliabilityScore + ", gradeLevel=" + gradeLevel + ", gradeNickname=" + gradeNickname + "]";
	}

}
