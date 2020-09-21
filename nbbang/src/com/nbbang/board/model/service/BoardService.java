package com.nbbang.board.model.service;

import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbbang.board.model.dao.BoardDao;
import com.nbbang.board.model.vo.Board;

public class BoardService {

	BoardDao dao = new BoardDao();

	public List<Board> boardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> boardList = dao.boardList(conn, cPage, numPerPage);
		close(conn);

		return boardList;
	}

	public Board boardPage(String boardId, boolean hasRead) {
		Connection conn = getConnection();
		Board b = dao.boardPage(conn, boardId);
		if (b != null && !hasRead) {
			int result = dao.updateReadCount(conn, Integer.parseInt(boardId));
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return b;
	}

	public int boardListCount() {
		Connection conn = getConnection();
		int result = dao.boardListCount(conn);
		close(conn);
		return result;
	}

	public int boardInsert(Board b) {
		Connection conn = getConnection();
		int result = dao.boardInsert(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
