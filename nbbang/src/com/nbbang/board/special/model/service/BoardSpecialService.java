package com.nbbang.board.special.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.rollback;

import java.sql.Connection;

import com.nbbang.board.model.vo.Board;
import com.nbbang.board.model.vo.BoardFile;
import com.nbbang.board.special.model.dao.BoardSpecialDao;

public class BoardSpecialService {

	BoardSpecialDao dao = new BoardSpecialDao();

	public int boardInsert(Board b, BoardFile bf) {
		Connection conn = getConnection();
		int result = dao.boardInsert(conn, b);
		result += dao.boardInsert(conn, bf);
		result += dao.boardInsertTradeList(conn, b.getWriterUsid(), b.getWriterNickname());
		if (result > 2) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
