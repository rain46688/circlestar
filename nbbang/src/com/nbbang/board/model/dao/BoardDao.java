package com.nbbang.board.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import com.nbbang.board.model.vo.Board;
import com.nbbang.board.model.vo.BoardFile;
import com.nbbang.board.model.vo.Card;
import com.nbbang.board.model.vo.Comment;
import com.nbbang.common.temp.AESCrypto;
import com.nbbang.member.model.vo.LikeList;

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
	
	public List<Card> boardList(Connection conn, int cPage, int numPerPage, String boardTitle){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardList");
		System.out.println(boardTitle);
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
				c.getCardBoard().setLikeCount(rs.getInt("LIKE_COUNT"));
				c.getCardBoard().setProductCategory(rs.getString("PRODUCT_CATEGORY"));
				try {
					c.getCardBoard().setTradeArea(new AESCrypto().decrypt(rs.getString("TRADE_AREA")));
				} catch (Exception e) {
					c.getCardBoard().setTradeArea(rs.getString("TRADE_AREA"));
				}
				c.getCardBoard().setMaxMems(rs.getInt("MAX_MEMS"));
				c.getCardBoard().setLimitTime(rs.getDate("LIMIT_TIME"));
				c.getCardBoard().setTradeStage(rs.getInt("TRADE_STAGE"));
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
	
	public Card boardPageForProfile(Connection conn, Card c, int writerUsid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardPageForProfile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, writerUsid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c.setWriterProfile(rs.getString(1));
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
	
	
	
	public int boardListCount(Connection conn, String boardTitle) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("boardListCount");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTitle);
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
	//유저측 관심 수 업데이트
	public int boardLikeInsert(Connection conn, LikeList list) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardLikeInsert"));
			pstmt.setInt(1, list.getLikeUsid());
			pstmt.setInt(2, list.getLikeBoardId().get(0));
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}return result;
	}
	
	//해당 보드에 관심 수 업데이트
	public int boardLikeUpdate(Connection conn, LikeList list) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardLikeUpdate"));
			pstmt.setInt(1, list.getLikeBoardId().get(0));
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}return result;
	}
	
	//유저측 likelist에서 줄이기
	public int boardLikeDelete(Connection conn, LikeList list) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardLikeDelete"));
			pstmt.setInt(1, list.getLikeUsid());
			pstmt.setInt(2, list.getLikeBoardId().get(0));
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}return result;
	}
	
	//보드측 like 갯수 줄이기
	public int boardLikeDeleteUpdate(Connection conn, LikeList list) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardLikeDeleteUpdate"));
			pstmt.setInt(1, list.getLikeBoardId().get(0));
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}return result;
	}
	
	public int commentInsert(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("commentInsert"));
			pstmt.setInt(1, c.getCboardId());
			pstmt.setString(2, c.getContent());
			pstmt.setBoolean(3, c.getSecret());
			pstmt.setString(4, c.getCwriterNickname());
			pstmt.setInt(5, c.getComLayer());
			pstmt.setString(6, c.getComProfile());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Comment> commentList(Connection conn, int boardId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("commentList");
		List<Comment> list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();
			list = new ArrayList<Comment>();
			while(rs.next()) {
				Comment c = new Comment();
				c.setComLayer(rs.getInt("COM_LAYER"));
				c.setCboardId(rs.getInt("CBOARD_ID"));
				c.setContent(rs.getString("CONTENT"));
				c.setCenrollDate(rs.getDate("CENROLL_DATE"));
				c.setSecret(rs.getBoolean("SECRET"));
				c.setCwriterNickname(rs.getString("CWRITER_NICKNAME"));
				c.setComProfile(rs.getString("COM_PROFILE"));
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
	
	public List<Card> mainViewList(Connection conn, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = new String();
		switch(key) {
			case "popular" : sql = prop.getProperty("popularView");break;
			case "recent" : sql = prop.getProperty("recentView");break;
			case "special" : sql = prop.getProperty("specialView");break;
		};
		List<Card> list = null;
		try {
			if(sql.contains("$re"))sql = sql.replace("$re", "'특가'");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<Card>();
			while(rs.next()) {
				Card c = new Card(new Board(), new BoardFile());
				c.getCardBoard().setBoardId(rs.getInt("BOARD_ID"));
				c.getCardBoard().setBoardTitle(rs.getString("BOARD_TITLE"));
				c.getCardBoard().setWriterUsid(rs.getInt("WRITER_USID"));
				c.getCardBoard().setWriterNickname(rs.getString("WRITER_NICKNAME"));
				c.getCardBoard().setContent(rs.getString("CONTENT"));
				c.getCardBoard().setEnrollDate(rs.getDate("ENROLL_DATE"));
				c.getCardBoard().setHit(rs.getInt("HIT"));
				c.getCardBoard().setLikeCount(rs.getInt("LIKE_COUNT"));
				c.getCardBoard().setProductCategory(rs.getString("PRODUCT_CATEGORY"));
				try {
					c.getCardBoard().setTradeArea(new AESCrypto().decrypt(rs.getString("TRADE_AREA")));
				} catch (Exception e) {
					c.getCardBoard().setTradeArea(rs.getString("TRADE_AREA"));
				}
				c.getCardBoard().setMaxMems(rs.getInt("MAX_MEMS"));
				c.getCardBoard().setLimitTime(rs.getDate("LIMIT_TIME"));
				c.getCardBoard().setTradeStage(rs.getInt("TRADE_STAGE"));
				c.getCardBoard().setPopularBoard(rs.getBoolean("POPULAR_BOARD"));
				c.getCardBoard().setProductPrice(rs.getInt("PRODUCT_PRICE"));
				c.getCardBoard().setOwnStatus(rs.getString("TRADE_KIND"));
				c.getCardBoard().setProductUrl(rs.getString("PRODUCT_URL"));
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
