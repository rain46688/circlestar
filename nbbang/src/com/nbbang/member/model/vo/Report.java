package com.nbbang.member.model.vo;

import java.sql.Date;

public class Report {

	private int reportId; //신고 식별값 (Report PrimaryKey)
	private int reportUserUsid; //신고를 한 유저의 usid (Member PrimaryKey)
	private int reportBoardId; //게시글 식별값 (Board PrimaryKey)
	private int reportTargetUsid; //신고를 당한 유저의 usid (Member PrimaryKey)
	private String reportType; //신고 유형
	private String reportTitle; //신고 제목
	private String reportContent; //신고 내용
	private Date reportDate; //신고 등록 날짜
	private String reportFile; //신고 파일 첨부
	private boolean reportIscheck; //신고 처리 여부
	private String reportTargetNickname; //신고를 당한 유저의 닉네임
	private String reportUserNickname; //신고를 한 유저의 닉네임
	private String reportAnswer; //신고 답변 내용
	
	public Report() {
		// TODO Auto-generated constructor stub
	}

	public Report(int reportId, int reportUserUsid, int reportBoardId, int reportTargetUsid, String reportType,
			String reportTitle, String reportContent, Date reportDate, String reportFile, boolean reportIscheck,
			String reportTargetNickname, String reportUserNickname, String reportAnswer) {
		super();
		this.reportId = reportId;
		this.reportUserUsid = reportUserUsid;
		this.reportBoardId = reportBoardId;
		this.reportTargetUsid = reportTargetUsid;
		this.reportType = reportType;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportFile = reportFile;
		this.reportIscheck = reportIscheck;
		this.reportTargetNickname = reportTargetNickname;
		this.reportUserNickname = reportUserNickname;
		this.reportAnswer = reportAnswer;
	}

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public int getReportUserUsid() {
		return reportUserUsid;
	}

	public void setReportUserUsid(int reportUserUsid) {
		this.reportUserUsid = reportUserUsid;
	}

	public int getReportBoardId() {
		return reportBoardId;
	}

	public void setReportBoardId(int reportBoardId) {
		this.reportBoardId = reportBoardId;
	}

	public int getReportTargetUsid() {
		return reportTargetUsid;
	}

	public void setReportTargetUsid(int reportTargetUsid) {
		this.reportTargetUsid = reportTargetUsid;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportFile() {
		return reportFile;
	}

	public void setReportFile(String reportFile) {
		this.reportFile = reportFile;
	}

	public boolean isReportIscheck() {
		return reportIscheck;
	}

	public void setReportIscheck(boolean reportIscheck) {
		this.reportIscheck = reportIscheck;
	}

	public String getReportTargetNickname() {
		return reportTargetNickname;
	}

	public void setReportTargetNickname(String reportTargetNickname) {
		this.reportTargetNickname = reportTargetNickname;
	}

	public String getReportUserNickname() {
		return reportUserNickname;
	}

	public void setReportUserNickname(String reportUserNickname) {
		this.reportUserNickname = reportUserNickname;
	}

	public String getReportAnswer() {
		return reportAnswer;
	}

	public void setReportAnswer(String reportAnswer) {
		this.reportAnswer = reportAnswer;
	}

	@Override
	public String toString() {
		return "Report [reportId=" + reportId + ", reportUserUsid=" + reportUserUsid + ", reportBoardId="
				+ reportBoardId + ", reportTargetUsid=" + reportTargetUsid + ", reportType=" + reportType
				+ ", reportTitle=" + reportTitle + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", reportFile=" + reportFile + ", reportIscheck=" + reportIscheck + ", reportTargetNickname="
				+ reportTargetNickname + ", reportUserNickname=" + reportUserNickname + ", reportAnswer=" + reportAnswer
				+ "]";
	}

	
}
