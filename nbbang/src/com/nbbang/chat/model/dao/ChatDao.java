package com.nbbang.chat.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.nbbang.common.temp.JDBCTemplate.*;

public class ChatDao {

	private Properties prop = new Properties();

	public ChatDao() {
		// TODO Auto-generated constructor stub
		String path = ChatDao.class.getResource("/sql/chat/chat.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String selectCurMemsList(Connection conn, String boardId) {
		// TODO Auto-generated method stub

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String list = "";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectCurMemsList"));
			pstmt.setString(1, boardId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list += rs.getString(1) + ",";
			}
			list = list.substring(0, list.length() - 1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public int getMaxMems(Connection conn, String boardId) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int maxMems = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getMaxMems"));
			pstmt.setString(1, boardId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxMems = Integer.parseInt(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return maxMems;
	}

	public int creatRoom(Connection conn, String boardId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("creatRoom"));
			pstmt.setString(1, "2");
			pstmt.setString(2, boardId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	@SuppressWarnings("resource")
	public int decideBuyUser(Connection conn, String usid, String nickname, String boardId, String flag) {
		// TODO Auto-generated method stub
		int result = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			// 회원을 방에 추가하는 경우 분기
			if (flag.equals("1")) {
				pstmt = conn.prepareStatement(prop.getProperty("decideBuyCheck"));
				pstmt.setString(1, boardId);
				pstmt.setString(2, usid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// 회원을 중복해서 추가하는 경우 분기
					return 2;
				}
				pstmt = conn.prepareStatement(prop.getProperty("decideBuyUserAdd"));
				pstmt.setString(1, boardId);
				pstmt.setString(2, usid);
				pstmt.setString(3, nickname);
			} else if (flag.equals("2")) {
				// 회원을 삭제하는 경우 분기
				pstmt = conn.prepareStatement(prop.getProperty("decideBuyUserDrop"));
				pstmt.setString(1, boardId);
				pstmt.setString(2, usid);
			}
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

}
