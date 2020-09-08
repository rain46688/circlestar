package onebyn.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import static onebyn.common.JDBCtem.*;
import javax.servlet.ServletContext;
import onebyn.model.vo.Board;

public class BoardDao {

	private Properties p = new Properties();
	private final int maxcount = 9;

	public BoardDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName = BoardDao.class.getResource("/onebyn/sql/board/board_sql.properties").getPath();
			p.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Board> getBoardList(Connection conn, int page) {
		// TODO Auto-generated method stub
		List<Board> list = new ArrayList<Board>();
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			String sql = p.getProperty("getboardlist");
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (page - 1) * maxcount + 1);
			pst.setInt(2, page * maxcount);
			rs = pst.executeQuery();
			while (rs.next()) {
				list.add(printBoard(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}

		return list;
	}

	public int getBoardCount(Connection conn) {
		// TODO Auto-generated method stub
		int count = 0;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			String sql = p.getProperty("getboardcnt");
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next())
				count = rs.getInt("count");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}

		return count;
	}

	public int writeNotice(Connection conn, Board b) {
		// TODO Auto-generated method stub

		int result = 0;
		PreparedStatement pst = null;

		String sql = p.getProperty("writeboardlist");
//		System.out.println("writeboardlist : "+sql); 
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, b.getBoardTitle());
			pst.setString(2, b.getWriterId());
			pst.setString(3, b.getContent());
			pst.setString(4, b.getFiles());
			pst.setString(5, b.getProductCategori());
			pst.setString(6, b.getProductName());
			pst.setString(7, b.getTradeArea());
			pst.setString(8, b.getMaxMems());
			pst.setInt(9, b.getProductPrice());
			pst.setString(10, b.getOwnStatus());
			pst.setString(11, b.getTradeKind());
			result = pst.executeUpdate();
			if (result == 1) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pst);
		}
		return result;
	}

	public Board tradePageBoard(Connection conn, String id) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pst = null;
		Board b = null;
		String sql = p.getProperty("tradePageBoard");
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				b = printBoard(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pst);
		}
		return b;
	}

	private Board printBoard(ResultSet rs) {
		Board b = null;
		try {
			b = new Board();
			int id = rs.getInt("BOARD_ID");
			String title = rs.getString("BOARD_TITLE");
			String writerId = rs.getString("WRITER_ID");
			String content = rs.getString("CONTENT");
			Date enrollDate = rs.getDate("ENROLL_DATE");
			String hit = rs.getString("HIT");
			String files = rs.getString("FILES");
			String cate = rs.getString("PRODUCT_CATEGORI");
			String pname = rs.getString("PRODUCT_NAME");
			String delivertTime = rs.getString("DELIVERY_TIME");
			String tradeloc = rs.getString("TRADE_AREA");
			String mem = rs.getString("MAX_MEMS");
			String curMemsList = rs.getString("CUR_MEMS_LIST");
			String limitTradeTime = rs.getString("LIMIT_TRADE_TIME");
			String tradeStage = rs.getString("TRADE_STAGE");
			String trageStart = rs.getString("TRADE_START");
			String popularBoard = rs.getString("POPULAR_BOARD");
			int price = rs.getInt("PRODUCT_PRICE");
			String own = rs.getString("OWN_STATUS");
			String tradekind = rs.getString("TRADE_KIND");
			b.setBoardId(id);
			b.setBoardTitle(title);
			b.setWriterId(writerId);
			b.setEnrollDate(enrollDate);
			b.setContent(content);
			b.setHit(hit);
			b.setFiles(files);
			b.setProductCategori(cate);
			b.setProductName(pname);
			b.setDelivertTime(delivertTime);
			b.setTradeArea(tradeloc);
			b.setMaxMems(mem);
			b.setCurMemsList(curMemsList);
			b.setLimitTradeTime(limitTradeTime);
			b.setTradeStage(tradeStage);
			b.setTrageStart(trageStart);
			b.setPopularBoard(popularBoard);
			b.setProductPrice(price);
			b.setOwnStatus(own);
			b.setTradeKind(tradekind);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

}
