package com.nbbang.admin.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import com.nbbang.customer.model.vo.CustomerCenter;

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

	public List<CustomerCenter> customerList(Connection conn, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<CustomerCenter> list = new ArrayList<CustomerCenter>();
		String sql = p.getProperty("customerList");
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (cPage - 1) * numPerPage + 1);
			pst.setInt(2, cPage * numPerPage);
			rs = pst.executeQuery();
			print(list, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return list;
	}
	
	public int customerListCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = p.getProperty("customerListCount");
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

	private void print(List<CustomerCenter> list, ResultSet rs) {
		try {
			while (rs.next()) {
				CustomerCenter c = new CustomerCenter();
				c.setCsNo(rs.getInt("CS_ID"));
				c.setCsWriter(rs.getString("CS_WRITER_USID"));
				c.setCsType(rs.getString("CS_TPYE"));
				c.setCsTitle(rs.getString("CS_TITLE"));
				c.setCsContent(rs.getString("CS_CONTENT"));
				c.setCsDate(rs.getDate("CS_DATE"));
				c.setCsFile(rs.getString("CS_FILE"));
				c.setCsIscheck(rs.getBoolean("CS_ISCHECK"));
				c.setCsNickname(rs.getString("CS_NICKNAME"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
//
//	public List<Member> selectMemberSearch(Connection conn, String type, String keyword, int cPage, int numPerPage) {
//		// TODO Auto-generated method stub
//		ResultSet rs = null;
//		PreparedStatement pst = null;
//		List<Member> list = new ArrayList<Member>();
//		System.out.println("keyword : " + keyword + ", type : " + type);
//		String sql = p.getProperty("selectSearchMember").replace("$type", type);
//
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, "%" + keyword + "%");
//			pst.setInt(2, (cPage - 1) * numPerPage + 1);
//			pst.setInt(3, cPage * numPerPage);
//			rs = pst.executeQuery();
//			printMember(list, rs);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pst);
//		}
//		return list;
//	}
//
//
//
//	public int selectMemberSearchCount(Connection conn, String type, String keyword) {
//		// TODO Auto-generated method stub
//		PreparedStatement pst = null;
//		ResultSet rs = null;
//		int cnt = 0;
//		String sql = p.getProperty("selectMemberSearchCount").replace("$type", type);
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, "%" + keyword + "%");
//			rs = pst.executeQuery();
//			if (rs.next()) {
//				cnt = rs.getInt(1);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pst);
//		}
//		return cnt;
//	}
//
//	public Member memstatuspage(Connection conn, String userid) {
//		// TODO Auto-generated method stub
//		ResultSet rs = null;
//		PreparedStatement pst = null;
//		Member m = null;
//		String sql = p.getProperty("memstatusprint");
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, userid);
//			rs = pst.executeQuery();
//			if (rs.next()) {
//				m = new Member();
//				m.setMemberId(rs.getString("MEMBER_ID"));
//				m.setMemberPwd(rs.getString("MEMBER_PWD"));
//				m.setMemberName(rs.getString("MEMBER_NAME"));
//				m.setNickname(rs.getString("NICKNAME"));
//				m.setPhone(rs.getString("PHONE"));
//				m.setEmail(rs.getString("EMAIL"));
//				m.setAddress(rs.getString("ADDRESS"));
//				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pst);
//		}
//		return m;
//	}
}
