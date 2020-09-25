package com.nbbang.notice.model.vo;

import java.util.Date;

public class Notice {

	private int noticeId;
	private int noticeAdminUsid;
	private String noticeWriteNickname;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String timestamp;

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeId, int noticeAdminUsid, String noticeWriteNickname, String noticeTitle,
			String noticeContent, Date noticeDate, String timestamp) {
		super();
		this.noticeId = noticeId;
		this.noticeAdminUsid = noticeAdminUsid;
		this.noticeWriteNickname = noticeWriteNickname;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.timestamp = timestamp;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public int getNoticeAdminUsid() {
		return noticeAdminUsid;
	}

	public void setNoticeAdminUsid(int noticeAdminUsid) {
		this.noticeAdminUsid = noticeAdminUsid;
	}

	public String getNoticeWriteNickname() {
		return noticeWriteNickname;
	}

	public void setNoticeWriteNickname(String noticeWriteNickname) {
		this.noticeWriteNickname = noticeWriteNickname;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeAdminUsid=" + noticeAdminUsid + ", noticeWriteNickname="
				+ noticeWriteNickname + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", timestamp=" + timestamp + "]";
	}

}
