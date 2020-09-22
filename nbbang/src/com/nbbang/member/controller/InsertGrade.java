package com.nbbang.member.controller;

import com.nbbang.member.model.service.MemberService;

public class InsertGrade {
	
	public int insertGrade(String nickname) {
		int result=new MemberService().memberInsertGrade(nickname);
		return result;
	}

}
