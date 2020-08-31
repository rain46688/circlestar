package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public Member loginMember(String id, String pw){
		Connection conn = getConnection();
		Member m = dao.loginMember(conn,id,pw);
		close(conn);
		return m;
	}
}
