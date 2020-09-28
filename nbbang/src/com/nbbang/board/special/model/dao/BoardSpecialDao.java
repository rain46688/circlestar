package com.nbbang.board.special.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import com.nbbang.board.model.vo.Board;
import com.nbbang.board.model.vo.BoardFile;
import com.nbbang.board.model.vo.Card;
import com.nbbang.common.temp.AESCrypto;

public class BoardSpecialDao {

	Properties prop = new Properties();

	public BoardSpecialDao() {
		// TODO Auto-generated constructor stub
		String filePath = BoardSpecialDao.class.getResource("/sql/board/boSpecial.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int boardInsert(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardSpecialInsert"));
			pstmt.setInt(1, b.getWriterUsid());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getWriterNickname());
			pstmt.setString(4, b.getContent());
			pstmt.setString(5, b.getProductCategory());
			pstmt.setString(6, b.getTradeArea());
			pstmt.setInt(7, b.getMaxMems());
			pstmt.setTimestamp(8, new java.sql.Timestamp(b.getLimitTime().getTime()));
			pstmt.setInt(9, b.getProductPrice());
			pstmt.setString(10, b.getOwnStatus());
			pstmt.setString(11, b.getTradeKind());
			pstmt.setString(12, b.getProductUrl());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	
	public int boardInsertTradeList(Connection conn, int tradeUsid, String tradeUserNickname) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardInsertTradeList"));
			pstmt.setInt(1, tradeUsid);
			pstmt.setString(2, tradeUserNickname);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public List<Card> boardList(Connection conn, int cPage, int numPerPage, String boardTitle){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardSpecialList");
		List<Card> list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTitle);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			list = new ArrayList<Card>();
			while(rs.next()) {
				Card c = new Card(new Board(), new BoardFile());
				c.getCardBoard().setBoardId(rs.getInt("BOARD_ID"));
				c.getCardBoard().setBoardTitle(rs.getString("BOARD_TITLE"));
				c.getCardBoard().setWriterUsid(rs.getInt("WRITER_USID"));
				c.getCardBoard().setHit(rs.getInt("HIT"));
				c.getCardBoard().setLikeCount(rs.getInt("LIKE_COUNT"));
				Calendar ca = new GregorianCalendar();
				c.getCardBoard().setLimitTime(rs.getTimestamp("LIMIT_TIME", ca));
				try {
					c.getCardBoard().setTradeArea(AESCrypto.decrypt(rs.getString("TRADE_AREA")));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					c.getCardBoard().setTradeArea(rs.getString("TRADE_AREA"));
				} 
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
