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
import com.nbbang.board.model.vo.BoardFile;
import com.nbbang.board.model.vo.Card;

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
	
	public List<Card> boardList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardList");
		List<Card> list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			list = new ArrayList<Card>();
			while(rs.next()) {
				Card c = new Card(new Board(), new BoardFile());
				c.getCardBoard().setBoardId(rs.getInt("BOARD_ID"));
				c.getCardBoard().setBoardTitle(rs.getString("BOARD_TITLE"));
				c.getCardBoard().setWriterUsid(rs.getInt("WRITER_USID"));
				c.getCardBoard().setHit(rs.getInt("HIT"));
				c.getCardBoard().setLikeCount(rs.getInt("LIKE_COUNT"));
				c.getCardBoard().setTradeArea(rs.getString("TRADE_AREA"));
				c.getCardBoard().setProductPrice(rs.getInt("PRODUCT_PRICE"));
				c.getCardFile().setFileName(stringToArr(rs.getString("FILE_NAME")));
				list.add(c);
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
	
	public Card boardPage(Connection conn, String boardId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardPage");
		Card c = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c = new Card(new Board(), new BoardFile());
				c.getCardBoard().setBoardId(rs.getInt("BOARD_ID"));
				c.getCardBoard().setBoardTitle(rs.getString("BOARD_TITLE"));
				c.getCardBoard().setWriterUsid(rs.getInt("WRITER_USID"));
				c.getCardBoard().setWriterNickname(rs.getString("WRITER_NICKNAME"));
				c.getCardBoard().setContent(rs.getString("CONTENT"));
				c.getCardBoard().setEnrollDate(rs.getDate("ENROLL_DATE"));
				c.getCardBoard().setHit(rs.getInt("HIT"));
				c.getCardBoard().setProductCategory(rs.getString("PRODUCT_CATEGORY"));
				c.getCardBoard().setTradeArea(rs.getString("TRADE_AREA"));
				c.getCardBoard().setMaxMems(rs.getInt("MAX_MEMS"));
				c.getCardBoard().setLimitTime(rs.getDate("LIMIT_TIME"));
				c.getCardBoard().setTradeStage(rs.getInt("LIKE_COUNT"));
				c.getCardBoard().setPopularBoard(rs.getBoolean("POPULAR_BOARD"));
				c.getCardBoard().setProductPrice(rs.getInt("PRODUCT_PRICE"));
				c.getCardBoard().setOwnStatus(rs.getString("TRADE_KIND"));
				c.getCardBoard().setProductUrl(rs.getString("PRODUCT_URL"));
				c.getCardFile().setFileName(stringToArr(rs.getString("FILE_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
	
	public int boardListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardListCount");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 
		return result;
	}
	
	public int boardInsert(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardInsert"));
			pstmt.setInt(1, b.getWriterUsid());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getWriterNickname());
			pstmt.setString(4, b.getContent());
			pstmt.setString(5, b.getProductCategory());
			pstmt.setString(6, b.getTradeArea());
			pstmt.setInt(7, b.getMaxMems());
			pstmt.setInt(8, b.getProductPrice());
			pstmt.setString(9, b.getOwnStatus());
			pstmt.setString(10, b.getTradeKind());
			pstmt.setString(11, b.getProductUrl());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int boardInsert(Connection conn, BoardFile bf) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardFileInsert"));
			for(String s : bf.getFileName()) {
				pstmt.setString(1, s);
				result += pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateReadCount(Connection conn, int boardId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateReadCount"));
			pstmt.setInt(1, boardId);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}return result;
	}
	
	private String[] stringToArr(String str) {
		if(str==null) {
			return new String[1];
		}else {
			if(str.contains(",")) {
				return str.split(",");
			}
			else {
				String[] arr = {str};
				return arr;
			}
		}
	}
}
