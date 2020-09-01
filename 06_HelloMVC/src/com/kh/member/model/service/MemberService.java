package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import static com.kh.common.JDBCTemplate.close;
public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public Member loginMember(String id, String password) {
		Connection conn=getConnection();
		Member m=dao.loginMember(conn,id, password);
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
	
	
	
	
	
}






