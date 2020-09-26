package com.nbbang.admin.model.vo;

import com.nbbang.board.model.vo.TradeList;
import com.nbbang.member.model.vo.Grade;
import com.nbbang.member.model.vo.Member;

public class AdminMem {

	private Member mem;
	private Grade grade;
	private TradeList tradeList;
	private Report report;

	public AdminMem() {
		// TODO Auto-generated constructor stub
	}

	public AdminMem(Member mem, Grade grade, TradeList tradeList, Report report) {
		super();
		this.mem = mem;
		this.grade = grade;
		this.tradeList = tradeList;
		this.report = report;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public TradeList getTradeList() {
		return tradeList;
	}

	public void setTradeList(TradeList tradeList) {
		this.tradeList = tradeList;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "AdminMem [mem=" + mem + ", grade=" + grade + ", tradeList=" + tradeList + ", report=" + report + "]";
	}

}
