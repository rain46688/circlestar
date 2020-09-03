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
			pst =conn.prepareStatement(sql);
			pst.setInt(1, (page-1)*maxcount+1);
			pst.setInt(2, page*maxcount); 
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("BOARD_ID");
				String title = rs.getString("BOARD_TITLE");
				String writerId = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("ENROLL_DATE");
				String content = rs.getString("CONTENT");
				String hit = rs.getString("HIT");
				String files = rs.getString("FILES");
				list.add(new Board(id, title, writerId, content, regdate, hit, files));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
			rs=pst.executeQuery();
			if(rs.next())
				count = rs.getInt("count");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
		System.out.println("writeboardlist : "+sql); 
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, b.getTitle());
			pst.setString(2, b.getWriterId());
			pst.setString(3, b.getContent());
			pst.setString(4, b.getFiles());
			result = pst.executeUpdate();
			if(result == 1) {
				commit(conn);
			}else {
				rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}

}
