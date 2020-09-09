package onebyn.member.model.service;

import static onebyn.common.JDBCtem.close;
import static onebyn.common.JDBCtem.getConnection;

import java.sql.Connection;

import onebyn.member.model.dao.MemberDao;
import onebyn.member.model.vo.Member;

public class MemberService {
	

	public Member loginUser(String id, String pw) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		MemberDao md = new MemberDao();
		Member m = md.loginUser(conn,id,pw);
		close(conn);
		return m;
	}

	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		MemberDao md = new MemberDao();
		int result = md.insertMember(conn,m);
		close(conn);
		return result;
	}

}
