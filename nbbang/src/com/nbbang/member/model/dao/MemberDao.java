package com.nbbang.member.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.nbbang.board.model.vo.TradeList;
import com.nbbang.member.model.vo.Grade;
import com.nbbang.member.model.vo.LikeList;
import com.nbbang.member.model.vo.Member;
import com.nbbang.member.model.vo.Report;

import oracle.jdbc.proxy.annotation.Pre;

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
			m.setBirthday(rs.getDate("BIRTHDAY"));
			m.setPhone(rs.getString("PHONE"));
			m.setAddress(rs.getString("ADDRESS"));
			m.setEnrollDate(rs.getDate("ENROLL_DATE"));
			m.setPoint(rs.getInt("POINT"));
			m.setLeaveMem(rs.getBoolean("LEAVE_MEM"));
			m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
			m.setMemberPicture(rs.getString("MEMBER_PICTURE"));
			m.setPwIsUuid(rs.getBoolean("PW_IS_UUID"));
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
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
			pstmt.setString(3, memberId);
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

	public Member myPage(Connection conn, int usid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("myPage"));
			pstmt.setInt(1, usid);
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

	public int memberEnroll(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("memberEnroll"));
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getNickname());
			pstmt.setString(4, m.getGender());
			pstmt.setDate(5, m.getBirthday());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int memberInsertGrade(Connection conn, String nickname) {
		PreparedStatement pstmt=null;
		int resultGrade=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("memberInsertGrade"));
			pstmt.setString(1, nickname);
			pstmt.setString(2, nickname);
			resultGrade=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return resultGrade;
	}
	
	public Member phoneDuplicate(Connection conn, String phone) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("phoneDuplicate"));
			pstmt.setString(1, phone);
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

	public int updateFindPwMember(Connection conn, String encryptedUuid, int pwIsUuid, int usid) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePassword"));
			pstmt.setString(1, encryptedUuid);
			pstmt.setInt(2, pwIsUuid);
			pstmt.setInt(3, usid);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePhone(Connection conn, int usid, String phone) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePhone"));
			pstmt.setString(1, phone);
			pstmt.setInt(2, usid);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAddress(Connection conn, int usid, String address) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateAddress"));
			pstmt.setString(1, address);
			pstmt.setInt(2, usid);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Grade methodForGrade(Connection conn, int usid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Grade g=new Grade();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("methodForGrade"));
			pstmt.setInt(1, usid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				g.setGradeUsid(rs.getInt("GRADE_USID"));
				g.setMaxRoomCount(rs.getInt("MAX_ROOM_COUNT"));
				g.setReliabilityScore(rs.getInt("RELIABILITY_SCORE"));
				g.setGradeLevel(rs.getInt("GRADE_LEVEL"));
				g.setGradeNickname(rs.getString("GRADE_NICKNAME"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return g;
	}

	public int myPageReport(Connection conn, int usid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int reportCount=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("myPageReport"));
			pstmt.setInt(1, usid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				reportCount=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return reportCount;
	}

	public int modifyNick(Connection conn, int usid, String nick) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateNick"));
			pstmt.setString(1, nick);
			pstmt.setInt(2, usid);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int modifyPic(Connection conn, int usid, String fileName) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("modifyPic"));
			pstmt.setString(1, fileName);
			pstmt.setInt(2, usid);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	
}
