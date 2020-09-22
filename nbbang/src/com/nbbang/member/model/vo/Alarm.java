package com.nbbang.member.model.vo;

import java.sql.Date;

public class Alarm {
	
	private int alarmId; //알람 식별값 (Alarm PK)
	private int receiveMemUsid; //알람 받는 유저 usid (MemberPK)
	private int sendMemUsid; //알람 보낸 유저 usid(Member PK)
	private String alarmContent; //알람 내용
	private Date alarmDate; //알람 발송 날짜
	private boolean alarmCheck; //알람 받는 유저가 확인했는지 여부
	private String sendMemNickname; //알람 보낸 사람 닉네임
	private String receiveMemNickname; //알람 받는 사람 닉네임
	
	public Alarm() {
		// TODO Auto-generated constructor stub
	}

	public Alarm(int alarmId, int receiveMemUsid, int sendMemUsid, String alarmContent, Date alarmDate,
			boolean alarmCheck, String sendMemNickname, String receiveMemNickname) {
		super();
		this.alarmId = alarmId;
		this.receiveMemUsid = receiveMemUsid;
		this.sendMemUsid = sendMemUsid;
		this.alarmContent = alarmContent;
		this.alarmDate = alarmDate;
		this.alarmCheck = alarmCheck;
		this.sendMemNickname = sendMemNickname;
		this.receiveMemNickname = receiveMemNickname;
	}

	public int getAlarmId() {
		return alarmId;
	}

	public void setAlarmId(int alarmId) {
		this.alarmId = alarmId;
	}

	public int getReceiveMemUsid() {
		return receiveMemUsid;
	}

	public void setReceiveMemUsid(int receiveMemUsid) {
		this.receiveMemUsid = receiveMemUsid;
	}

	public int getSendMemUsid() {
		return sendMemUsid;
	}

	public void setSendMemUsid(int sendMemUsid) {
		this.sendMemUsid = sendMemUsid;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public Date getAlarmDate() {
		return alarmDate;
	}

	public void setAlarmDate(Date alarmDate) {
		this.alarmDate = alarmDate;
	}

	public boolean isAlarmCheck() {
		return alarmCheck;
	}

	public void setAlarmCheck(boolean alarmCheck) {
		this.alarmCheck = alarmCheck;
	}

	public String getSendMemNickname() {
		return sendMemNickname;
	}

	public void setSendMemNickname(String sendMemNickname) {
		this.sendMemNickname = sendMemNickname;
	}

	public String getReceiveMemNickname() {
		return receiveMemNickname;
	}

	public void setReceiveMemNickname(String receiveMemNickname) {
		this.receiveMemNickname = receiveMemNickname;
	}

	@Override
	public String toString() {
		return "Alarm [alarmId=" + alarmId + ", receiveMemUsid=" + receiveMemUsid + ", sendMemUsid=" + sendMemUsid
				+ ", alarmContent=" + alarmContent + ", alarmDate=" + alarmDate + ", alarmCheck=" + alarmCheck
				+ ", sendMemNickname=" + sendMemNickname + ", receiveMemNickname=" + receiveMemNickname + "]";
	}

}
