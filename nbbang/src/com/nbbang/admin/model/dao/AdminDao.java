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
		String path = AdminDao.class.getResource("/sql/admin/admin_sql.properties").getPath();
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
			pst.setInt(1, (cPage - 1) * numPerPage+1);
			pst.setInt(2, cPage * numPerPage);
			rs = pst.executeQuery();
			list = printMember(list, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return list;
	}

	private List<Member> printMember(List<Member> list, ResultSet rs) {
		try {
			while (rs.next()) {
				Member m = new Member();
				m.setUserId(rs.getString("userid"));
				m.setPassword(rs.getString("password"));
				m.setUserName(rs.getString("username"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setHobby(rs.getString("hobby"));
				m.setEnrolldate(rs.getDate("enrolldate"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Member> selectMemberSearch(Connection conn, String type, String keyword, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		List<Member> list = new ArrayList<Member>();
		System.out.println("keyword : "+keyword +", type : "+type);
		String sql = p.getProperty("selectSearchMember2").replace("$type", type);
		
		System.out.println("p.getProperty(\"selectSearchMember2\") : "+p.getProperty("selectSearchMember2"));

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + keyword + "%");
			pst.setInt(2, (cPage - 1) * numPerPage + 1);
			pst.setInt(3, cPage * numPerPage);
			rs = pst.executeQuery();
			list = printMember(list, rs);
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
		String sql =p.getProperty("selectMemberCount");
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
				//인덱스로 가져오기임!! 아니면 COUNT(*)불러오던지 별칭 as로 붙여주던지 하면됨!!
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pst);
		}
		return cnt;
	}
//위 카운트 함수랑 오버로딩하지말고 구분해줄 필요가 있다.
	public int selectMemberSearchCount(Connection conn, String type, String keyword) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = p.getProperty("selectMemberSearchCount").replace("$type", type);
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + keyword + "%");
			rs=pst.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
				//인덱스로 가져오기임!! 아니면 COUNT(*)불러오던지 별칭 as로 붙여주던지 하면됨!!
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
			if(rs.next()) {
				m = new Member();
				m.setUserId(rs.getString("USERID"));
				m.setPassword(rs.getString("PASSWORD"));
				m.setUserName(rs.getString("USERNAME"));
				m.setGender(rs.getString("GENDER"));
				m.setAge(Integer.parseInt(rs.getString("AGE")));
				m.setEmail(rs.getString("EMAIL"));
				m.setPhone(rs.getString("PHONE"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setHobby(rs.getString("HOBBY"));
				m.setEnrolldate(rs.getDate("ENROLLDATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pst);
		}
		return m;
	}
}
