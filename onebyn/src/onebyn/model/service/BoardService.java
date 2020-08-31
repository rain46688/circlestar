package onebyn.model.service;

import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletContext;
import onebyn.model.dao.BoardDao;
import onebyn.model.vo.Board;
import static onebyn.common.JDBCtem.*;

public class BoardService {

	public List<Board> getBoardList(int page) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		BoardDao bo = new BoardDao();
		List<Board> list = bo.getBoardList(conn,page);
		close(conn);
		return list;
	}

	public int getBoardCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		BoardDao bo = new BoardDao();
		int cnt = bo.getBoardCount(conn);
		close(conn);
		return cnt;
	}

	public int writeNotice(Board b) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		BoardDao bo = new BoardDao();
		int  result = bo.writeNotice(conn,b);
		close(conn);
		return result;
	}

}
