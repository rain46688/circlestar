package onebyn.member.model.dao;

import static onebyn.common.JDBCtem.close;
import static onebyn.common.JDBCtem.commit;
import static onebyn.common.JDBCtem.rollback;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import onebyn.member.model.vo.Member;

public class MemberDao {

	private Properties p = new Properties();


	public MemberDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName = MemberDao.class.getResource("/onebyn/sql/member/member_sql.properties").getPath();
			p.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Member loginUser(Connection conn, String id, String pw) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		String sql = p.getProperty("loginuser");
		Member m = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pw);
			rs = pst.executeQuery();
			boolean r = rs.next();
			System.out.println("rs.next() : "+r);
			//Member 객체에 넣어서 반환하게 고치기!!
			
			if(r) {
				m = new Member();
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberPwd(rs.getString("MEMBER_PWD"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setPhone(rs.getString("phone"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pst);
		}
		System.out.println("반환하기 전에 출력 ! : "+m);
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		// TODO Auto-generated method stub
		int result = 0;
		PreparedStatement pst = null;
		String sql = p.getProperty("insertMem");
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, m.getMemberId());
			pst.setString(2, m.getMemberPwd());
			pst.setString(3, m.getMemberName());
			pst.setString(4, m.getNickname());
			pst.setString(5, m.getPhone());
			pst.setString(6, m.getAddress());
			pst.setString(7, m.getEmail());
			result = pst.executeUpdate();
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}

}
