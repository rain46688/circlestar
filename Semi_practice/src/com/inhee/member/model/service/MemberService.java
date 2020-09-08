package com.inhee.member.model.service;

import static com.inhee.common.JDBCTemplate.close;
import static com.inhee.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.inhee.member.model.dao.MemberDao;
import com.inhee.member.model.vo.Member;

public class MemberService {
	private MemberDao dao=new MemberDao();
	
	public Member loginMember(String memberId, String memberPwd) {
		Connection conn=getConnection();
		Member m=dao.loginMember(conn, memberId, memberPwd);
		close(conn);
		return m;
	}
}
