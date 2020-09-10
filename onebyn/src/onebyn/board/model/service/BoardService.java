package onebyn.board.model.service;

import static onebyn.common.JDBCtem.close;
import static onebyn.common.JDBCtem.getConnection;

import java.sql.Connection;
import java.util.List;

import onebyn.board.model.dao.BoardDao;
import onebyn.board.model.vo.Board;

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

	public Board tradePageBoard(String id) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		BoardDao bao = new BoardDao();
		Board b = bao.tradePageBoard(conn,id);
		close(conn);
		return b;
	}

}
