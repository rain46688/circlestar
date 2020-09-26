package com.nbbang.admin.model.vo;

import com.nbbang.board.model.vo.TradeList;
import com.nbbang.member.model.vo.Grade;
import com.nbbang.member.model.vo.Member;

public class AdminMem {

	private Member mem;
	private int gradeLevel;
	private int createBoardCount;
	private int reportCount;

	public AdminMem() {
		// TODO Auto-generated constructor stub
	}

	public AdminMem(Member mem, int gradeLevel, int createBoardCount, int reportCount) {
		super();
		this.mem = mem;
		this.gradeLevel = gradeLevel;
		this.createBoardCount = createBoardCount;
		this.reportCount = reportCount;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	public int getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(int gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public int getCreateBoardCount() {
		return createBoardCount;
	}

	public void setCreateBoardCount(int createBoardCount) {
		this.createBoardCount = createBoardCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	@Override
	public String toString() {
		return "AdminMem [mem=" + mem + ", gradeLevel=" + gradeLevel + ", createBoardCount=" + createBoardCount
				+ ", reportCount=" + reportCount + "]";
	}

}
