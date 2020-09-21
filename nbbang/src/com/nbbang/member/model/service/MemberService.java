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
	
	public Member findPw(String memberName, String email, String memberId) {
		Connection conn=getConnection();
		Member m=dao.findPw(conn, memberName, email, memberId);
		close(conn);
		return m;
	}

	public Member selectMember(String userId) throws SQLException {
		Connection conn=getConnection();
		Member m=dao.selectMember(conn,userId);
		close(conn);
		return m;
	}


	public Member myPage(int usid) {
		Connection conn=getConnection();
		Member m=dao.myPage(conn, usid);
		close(conn);
		return m;
	}

	public Member nickDuplicate(String nick) {
		Connection conn=getConnection();
		Member m=dao.nickDuplicate(conn,nick);
		close(conn);
		return m;
	}

	public int memberEnroll(Member m) {
		Connection conn=getConnection();
		int result=dao.memberEnroll(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Member phoneDuplicate(String phone) {
		Connection conn=getConnection();
		Member m=dao.phoneDuplicate(conn,phone);
		close(conn);
		return m;
	}

	public int updateFindPwMember(String encryptedUuid, int pwIsUuid, int usid) {
		Connection conn=getConnection();
		int result=dao.updateFindPwMember(conn,encryptedUuid,pwIsUuid,usid);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updatePhone(int usid, String phone) {
		Connection conn=getConnection();
		int result=dao.updatePhone(conn,usid,phone);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateAddress(int usid, String address) {
		Connection conn=getConnection();
		int result=dao.updateAddress(conn,usid,address);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
