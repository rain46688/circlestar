package onebyn.board.model.service;

import static onebyn.common.JDBCtem.*;
import static onebyn.common.JDBCtem.getConnection;

import java.sql.Connection;
import java.util.List;

import onebyn.board.model.dao.BoardDao;
import onebyn.board.model.vo.Board;

public class BoardService {

	private BoardDao bo = new BoardDao();

	public List<Board> getBoardList(int page, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();

		List<Board> list = bo.getBoardList(conn, page, numPerPage);
		close(conn);
		return list;
	}

	public int getBoardCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();

		int cnt = bo.getBoardCount(conn);
		close(conn);
		return cnt;
	}

	public int writeNotice(Board b) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();

		int result = bo.writeNotice(conn, b);
		close(conn);
		return result;
	}

	public Board tradePageBoard(String id, boolean hasRead) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();

		Board b = bo.tradePageBoard(conn, id);
		if (b != null && !hasRead) {
			int result = bo.updateReadCount(conn, id);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return b;
	}

	public int decideBuyUserAdd(String user, String bid) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = bo.decideBuyUserAdd(conn,user,bid);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public String curMemberList(String id) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		String blist = bo.curMemberList(conn,id);
		close(conn);
		return blist;
	}

}
