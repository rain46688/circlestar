package onebyn.model.service;

import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletContext;
import onebyn.model.dao.BoardDao;
import onebyn.model.vo.Board;
import static onebyn.common.JDBCtem.*;

public class BoardService {

	public List<Board> getBoardList(ServletContext servletContext, int page) {
		// TODO Auto-generated method stub
		Connection conn = getConnection(servletContext);
		BoardDao bo = new BoardDao(servletContext);
		List<Board> list = bo.getBoardList(conn,page);
		close(conn);
		return list;
	}

	public int getBoardCount(ServletContext servletContext) {
		// TODO Auto-generated method stub
		Connection conn = getConnection(servletContext);
		BoardDao bo = new BoardDao(servletContext);
		int cnt = bo.getBoardCount(conn);
		close(conn);
		return cnt;
	}

	public int writeNotice(Board b, ServletContext servletContext) {
		// TODO Auto-generated method stub
		Connection conn = getConnection(servletContext);
		BoardDao bo = new BoardDao(servletContext);
		int  result = bo.writeNotice(conn,b);
		close(conn);
		return result;
	}

}
