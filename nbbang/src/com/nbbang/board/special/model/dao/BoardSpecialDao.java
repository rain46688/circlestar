package com.nbbang.board.special.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
				System.out.println("list dao : "+c.getCardBoard().getLimitTime());
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
		System.out.println(sql);
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
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date enrollDate = sdf.parse(rs.getTimestamp(("ENROLL_DATE")).toString().substring(0, 19));
				c.getCardBoard().setTradeKind(rs.getString("TRADE_KIND"));
				c.getCardBoard().setEnrollDate(enrollDate);
				Calendar ca = new GregorianCalendar();
				c.getCardBoard().setLimitTime(rs.getTimestamp("LIMIT_TIME", ca));
				System.out.println("리미트 타임 : "+c.getCardBoard().getLimitTime());
				c.getCardBoard().setHit(rs.getInt("HIT"));
				c.getCardBoard().setLikeCount(rs.getInt("LIKE_COUNT"));
				c.getCardBoard().setProductCategory(rs.getString("PRODUCT_CATEGORY"));
				try {
					c.getCardBoard().setTradeArea(new AESCrypto().decrypt(rs.getString("TRADE_AREA")));
				} catch (Exception e) {
					c.getCardBoard().setTradeArea(rs.getString("TRADE_AREA"));
				}
				c.getCardBoard().setMaxMems(rs.getInt("MAX_MEMS"));
				/* c.getCardBoard().setLimitTime(rs.getDate("LIMIT_TIME")); */
				c.getCardBoard().setTradeStage(rs.getInt("TRADE_STAGE"));
				c.getCardBoard().setPopularBoard(rs.getBoolean("POPULAR_BOARD"));
				c.getCardBoard().setProductPrice(rs.getInt("PRODUCT_PRICE"));
				c.getCardBoard().setOwnStatus(rs.getString("TRADE_KIND"));
				c.getCardBoard().setProductUrl(rs.getString("PRODUCT_URL"));
				c.getCardFile().setFileName(stringToArr(rs.getString("FILE_NAME")));
			}
		} catch (SQLException | ParseException e) {
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

	public int tradeClose(Connection conn, int boardId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("tradeClose"));
			pstmt.setInt(1, boardId);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int boardInsertTradeList2(Connection conn, int tradeUsid, String tradeUserNickname,int boardId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardInsertTradeList2"));
			pstmt.setInt(1, boardId);
			pstmt.setInt(2, tradeUsid);
			pstmt.setString(3, tradeUserNickname);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int isInclude(Connection conn, int userUsid, int boardId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("isInclude"));
			pstmt.setInt(1, boardId);
			pstmt.setInt(2, userUsid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	

	public int boardModifyBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardModifyBoard"));
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setInt(2, b.getProductPrice());
			pstmt.setInt(3, b.getMaxMems());
			pstmt.setString(4, b.getTradeKind());
			pstmt.setString(5, b.getOwnStatus());
			pstmt.setString(6, b.getContent());
			pstmt.setString(7, b.getProductUrl());
			pstmt.setTimestamp(8, new java.sql.Timestamp(b.getLimitTime().getTime()));
			pstmt.setInt(9, b.getBoardId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int boardModifyFileDelete(Connection conn, BoardFile bf) {
		PreparedStatement pstmt = null;
		int result = 0;
		String deleteSql = prop.getProperty("boardModifyDeleteFile");
		try {
			//수정전
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setInt(1, bf.getBfFileId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int boardModifyFileInsert(Connection conn, BoardFile bf) {
		PreparedStatement pstmt = null;
		int result = 0;
		String insertSql = prop.getProperty("boardModifyInsertFile");
		try {
			pstmt = conn.prepareStatement(insertSql);
			for(String s : bf.getFileName()) {
				pstmt.setInt(1, bf.getBfFileId());
				pstmt.setString(2, s);
				result += pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
