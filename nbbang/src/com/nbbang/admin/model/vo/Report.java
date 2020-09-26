package com.nbbang.admin.model.vo;

import java.util.Date;

public class Report {

	private int reportId;
	private int reportUserUsid;
	private int reportBoardId;
	private int reportTargetUsid;
	private String reportType;
	private String reportTitle;
	private String reportContent;
	private Date reportDate;
	private String reportFile;
	private int reportIscheck;
	private String reportTargetNickname;
	private String reportUserNickname;
	private String reportAnswer;
	private int reportIswarning;

	public Report() {
		// TODO Auto-generated constructor stub
	}

	public Report(int reportId, int reportUserUsid, int reportBoardId, int reportTargetUsid, String reportType,
			String reportTitle, String reportContent, Date reportDate, String reportFile, int reportIscheck,
			String reportTargetNickname, String reportUserNickname, String reportAnswer, int reportIswarning) {
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
		this.reportIswarning = reportIswarning;
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

	public int getReportIscheck() {
		return reportIscheck;
	}

	public void setReportIscheck(int reportIscheck) {
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

	public int getReportIswarning() {
		return reportIswarning;
	}

	public void setReportIswarning(int reportIswarning) {
		this.reportIswarning = reportIswarning;
	}

	@Override
	public String toString() {
		return "Report [reportId=" + reportId + ", reportUserUsid=" + reportUserUsid + ", reportBoardId="
				+ reportBoardId + ", reportTargetUsid=" + reportTargetUsid + ", reportType=" + reportType
				+ ", reportTitle=" + reportTitle + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", reportFile=" + reportFile + ", reportIscheck=" + reportIscheck + ", reportTargetNickname="
				+ reportTargetNickname + ", reportUserNickname=" + reportUserNickname + ", reportAnswer=" + reportAnswer
				+ ", reportIswarning=" + reportIswarning + "]";
	}

}
