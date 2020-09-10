package com.nbbang.board.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.nbbang.board.model.vo.Board;

public class BoardDao {
	
	Properties prop = new Properties();
	
	public BoardDao() {
		// TODO Auto-generated constructor stub
		String filePath = BoardDao.class.getResource("/sql/board/board.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Board> boardList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardList");
		List<Board> list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while(rs.next()) {
				Board b = new Board();
				b.setBoardId(rs.getInt("BOARD_ID"));
				b.setBoardTitle(rs.getString("BOARD_TITLE"));
				b.setWriterId(rs.getString("WRITER_ID"));
				b.setEnrollDate(rs.getDate("ENROLL_DATE"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public Board boardPage(Connection conn, String boardId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardPage");
		Board b = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				b = new Board();
				b.setBoardId(rs.getInt("BOARD_ID"));
				b.setBoardTitle(rs.getString("BOARD_TITLE"));
				b.setWriterId(rs.getString("WRITER_ID"));
				b.setEnrollDate(rs.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
}
