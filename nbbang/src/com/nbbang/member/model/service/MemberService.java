package com.nbbang.member.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;

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
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int selectMember(String userId) throws SQLException {
		Connection conn=getConnection();
		int result=dao.selectMember(conn,userId);
		close(conn);
		return result;
		
		
	}

	public Member findPw(String memberName, String email, String memberId) {
		Connection conn=getConnection();
		Member m=dao.findPw(conn, memberName, email, memberId);
		close(conn);
		return m;
	}

}
