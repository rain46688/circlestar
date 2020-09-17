package com.nbbang.member.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.nbbang.member.model.vo.Member;

public class MemberDao {
private Properties prop=new Properties();
	
	public MemberDao() {
		try {
			String filePath=MemberDao.class.getResource("/sql/member/member.properties").getPath();
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPwd(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enroll_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member findId(Connection conn, String memberName, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("findId"));
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPwd(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enroll_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getEmail());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public Member selectMember(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberOne"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=inputData(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;		
	}

	private Member inputData(ResultSet rs) {
		Member m=new Member();
		try {
			m.setUsid(rs.getInt("USID"));
			m.setMemberId(rs.getString("MEMBER_ID"));
			m.setMemberPwd(rs.getString("MEMBER_PWD"));
			m.setMemberName(rs.getString("MEMBER_NAME"));
			m.setNickname(rs.getString("NICKNAME"));
			m.setGender(rs.getString("GENDER"));
			m.setBirthday(rs.getTimestamp("BIRTHDAY"));
			m.setPhone(rs.getString("PHONE"));
			m.setAddress(rs.getString("ADDRESS"));
			m.setEnrollDate(rs.getDate("ENROLL_DATE"));
			m.setGrade(rs.getString("GRADE"));
			m.setMaxRoomCount(rs.getInt("MAX_ROOM_COUNT"));
			m.setReportCount(rs.getInt("REPORT_COUNT"));
			m.setPoint(rs.getInt("POINT"));
			m.setLeaveMem(rs.getInt("LEAVE_MEM"));
			m.setCurTradeList(rs.getString("CUR_TRADE_LIST"));
			m.setCurCreateList(rs.getString("CUR_CREATE_LIST"));
			m.setDeliveryList(rs.getString("DELIVERY_LIST"));
			m.setTradeList(rs.getString("TRADE_LIST"));
			m.setLikeList(rs.getString("LIKE_LIST"));
			m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
			m.setMemberPicture(rs.getString("MEMBER_PICTURE"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}

	public Member findPw(Connection conn, String memberName, String email, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("findPw"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberName);
			pstmt.setString(3, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPwd(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enroll_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member myPage(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("myPage"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPwd(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setEmail(rs.getString("email"));
				m.setEnrollDate(rs.getDate("enroll_date"));
				m.setGrade(rs.getString("grade"));
				m.setCurRoomCnt(rs.getString("CUR_ROOM_CNT"));
				m.setMaxRoomCnt(rs.getString("MAX_ROOM_CNT"));
				m.setReportCnt(rs.getString("REPORT_CNT"));
				m.setPoint(rs.getString("POINT"));
				m.setLeaveMem(rs.getString("LEAVE_MEM"));
				m.setCurTradeList(rs.getString("CUR_TRADE_LIST"));
				m.setTradeList(rs.getString("TRADE_LIST"));
				m.setLikeList(rs.getString("LIKE_LIST"));
				m.setMemberPicture(rs.getString("MEMBER_PICTURE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}
		return m;
	}

	public Member nickDuplicate(Connection conn, String nick) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("nickDuplicate"));
			pstmt.setString(1, nick);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=inputData(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
}
