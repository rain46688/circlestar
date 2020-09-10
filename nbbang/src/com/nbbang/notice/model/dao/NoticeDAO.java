package com.nbbang.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.nbbang.common.temp.JDBCTemplate.close;

import com.nbbang.notice.model.vo.Notice;

public class NoticeDAO {

	private Properties p = new Properties();
	
	public List<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(p.getProperty("selectNoticeList"));
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeContent(rs.getNString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setFilePath(rs.getString("filepath"));
				n.setStatus(rs.getString("status") == "Y" ? true : false);
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

	public int selectNoticeCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(p.getProperty("selectNoticeCount"));
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

	public Notice picNotice(Connection conn, int no) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt = conn.prepareStatement(p.getProperty("picNotice"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				n=new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setFilePath(rs.getString("filepath"));
				n.setNoticeDate(rs.getDate("notice_date"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
			close(pstmt);
		}
		return n;
	}

}
