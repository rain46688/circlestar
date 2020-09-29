package com.nbbang.notice.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import com.nbbang.notice.model.vo.Notice;

public class NoticeDAO {

	private Properties p = new Properties();
	
	public NoticeDAO() {
		// TODO Auto-generated constructor stub
		String path=NoticeDAO.class.getResource("/sql/notice/notice.properties").getPath();
		try {
			p.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Notice> noticeList(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Calendar c = new GregorianCalendar();
		List<Notice> list = new ArrayList<Notice>();
		try {
			pstmt = conn.prepareStatement(p.getProperty("noticeList"));
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice n = new Notice();
				n.setNoticeId(rs.getInt("NOTICE_ID"));
				n.setNoticeAdminUsid(rs.getInt("NOTICE_ADMIN_USID"));
				n.setNoticeWriteNickname(rs.getString("NOTICE_WRITE_NICKNAME"));
				n.setNoticeTitle(rs.getString("NOTICE_TITLE"));
				n.setNoticeContent(rs.getNString("NOTICE_CONTENT"));
				// 캘린더 변경 이래야 시간이 나옴				
				n.setNoticeDate(rs.getTimestamp("NOTICE_DATE", c));
				list.add(n);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);

		}
		return list;
		
	}

	public int noticeListCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(p.getProperty("noticeListCount"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int insertNotice(Connection conn, Notice n) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(p.getProperty("insertNotice"));
			pstmt.setInt(1, n.getNoticeAdminUsid());
			pstmt.setString(2, n.getNoticeWriteNickname());
			pstmt.setString(3, n.getNoticeTitle());
			pstmt.setString(4, n.getNoticeContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}