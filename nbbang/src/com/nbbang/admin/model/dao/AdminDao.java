package com.nbbang.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import com.nbbang.member.model.vo.Member;
import static com.nbbang.common.temp.JDBCTemplate.*;

public class AdminDao {

	private Properties p = new Properties();

	public AdminDao() {
		// TODO Auto-generated constructor stub
		String path = AdminDao.class.getResource("/sql/admin/admin.properties").getPath();
		try {
			p.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Member> list = new ArrayList<Member>();
		String sql = p.getProperty("selectMemberList");
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (cPage - 1) * numPerPage + 1);
			pst.setInt(2, cPage * numPerPage);
			rs = pst.executeQuery();
			printMember(list, rs);
			System.out.println("list2 : ");
			for(Member b : list) {
				System.out.println(list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return list;
	}

	private void printMember(List<Member> list, ResultSet rs) {
		try {
			while (rs.next()) {
				Member m = new Member();
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberPwd(rs.getString("MEMBER_PWD"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setPhone(rs.getString("PHONE"));
				m.setEmail(rs.getString("EMAIL"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Member> selectMemberSearch(Connection conn, String type, String keyword, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Member> list = new ArrayList<Member>();
		System.out.println("keyword : " + keyword + ", type : " + type);
		String sql = p.getProperty("selectSearchMember").replace("$type", type);

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + keyword + "%");
			pst.setInt(2, (cPage - 1) * numPerPage + 1);
			pst.setInt(3, cPage * numPerPage);
			rs = pst.executeQuery();
			printMember(list, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return list;
	}

	public int selectMemberCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = p.getProperty("selectMemberCount");
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return cnt;
	}

	public int selectMemberSearchCount(Connection conn, String type, String keyword) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = p.getProperty("selectMemberSearchCount").replace("$type", type);
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + keyword + "%");
			rs = pst.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return cnt;
	}

	public Member memstatuspage(Connection conn, String userid) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		Member m = null;
		String sql = p.getProperty("memstatusprint");
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			if (rs.next()) {
				m = new Member();
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberPwd(rs.getString("MEMBER_PWD"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setPhone(rs.getString("PHONE"));
				m.setEmail(rs.getString("EMAIL"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return m;
	}
}
