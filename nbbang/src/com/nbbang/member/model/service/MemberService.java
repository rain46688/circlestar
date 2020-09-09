package com.nbbang.member.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.nbbang.member.model.dao.MemberDao;
import com.nbbang.member.model.vo.Member;


public class MemberService {
private MemberDao dao=new MemberDao();
	
	public Member loginMember(String memberId, String memberPwd) {
		Connection conn=getConnection();
		Member m=dao.loginMember(conn, memberId, memberPwd);
		close(conn);
		return m;
	}

	public Member findId(String memberName, String email) {
		Connection conn=getConnection();
		Member m=dao.findId(conn, memberName, email);
		close(conn);
		return m;
	}
}
