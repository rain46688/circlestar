package onebyn.model.service;

import static onebyn.common.JDBCtem.*;
import java.sql.Connection;
import javax.servlet.ServletContext;
import onebyn.model.dao.MemberDao;
import onebyn.model.vo.Member;

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
