package onebyn.board.model.dao;

import static onebyn.common.JDBCtem.close;
import static onebyn.common.JDBCtem.commit;
import static onebyn.common.JDBCtem.rollback;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import onebyn.board.model.dao.BoardDao;
import onebyn.board.model.vo.Comment;

public class CommentDao {
	
	private Properties p = new Properties();

	public CommentDao() {
		// TODO Auto-generated constructor stub
		try {
			String fileName = BoardDao.class.getResource("/onebyn/sql/comment/comment_sql.properties").getPath();
			p.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addComment(Connection conn, Comment c) {
		// TODO Auto-generated method stub
		int result = 0;
		PreparedStatement pst = null;
		String sql = p.getProperty("addcomment");
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, c.getCboardId());
			pst.setString(2, c.getComment());
			pst.setString(3, c.getCwriterId());
			pst.setBoolean(4, c.getSecret());
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
	}

	public List<Comment> getComment(Connection conn, String parameter) {
		// TODO Auto-generated method stub
		ResultSet rs =null;
		PreparedStatement pst = null;
		List<Comment> list = new ArrayList<Comment>();
		Comment c = null;
		String sql = p.getProperty("printcomment");
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, parameter);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				c = new Comment();
				c.setCboardId(parameter);
				c.setComId(rs.getString("COM_ID"));
				c.setCwriterId(rs.getString("CWRITER_ID"));
				//System.out.println("rs.getString(\"CWRITER_ID\") : "+rs.getString("CWRITER_ID"));
				c.setComment(rs.getString("COMMENT"));
				c.setCenrollDate(rs.getDate("CENROLL_DATE"));
				c.setSecret(rs.getBoolean("SECRET"));
//				System.out.println("잘찍히나 : "+c);
				list.add(c);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int delComment(Connection conn, String parameter) {
		// TODO Auto-generated method stub
		int result = 0;
		PreparedStatement pst = null;
		
		String sql = p.getProperty("delcomment");
//		System.out.println("sql : "+sql);
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, parameter);
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
