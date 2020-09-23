package com.nbbang.board.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbbang.board.model.dao.BoardDao;
import com.nbbang.board.model.vo.Board;
import com.nbbang.board.model.vo.BoardFile;
import com.nbbang.board.model.vo.Card;
import com.nbbang.board.model.vo.Comment;
import com.nbbang.member.model.vo.LikeList;

public class BoardService {

	BoardDao dao = new BoardDao();

	public List<Card> boardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Card> boardList = dao.boardList(conn, cPage, numPerPage);
		close(conn);
		return boardList;
	}

	public Card boardPage(String boardId, boolean hasRead) {
		Connection conn = getConnection();
		Card c = dao.boardPage(conn, boardId);
		if (c != null && !hasRead) {
			int result = dao.updateReadCount(conn, Integer.parseInt(boardId));
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return c;
	}

	public int boardListCount() {
		Connection conn = getConnection();
		int result = dao.boardListCount(conn);
		close(conn);
		return result;
	}

	public int boardInsert(Board b, BoardFile bf) {
		Connection conn = getConnection();
		int result = dao.boardInsert(conn, b);
		result += dao.boardInsert(conn, bf);
		if(result > 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int boardLikeInsert(LikeList list) {
		Connection conn = getConnection();
		int result = dao.boardLikeInsert(conn, list);
		if(result > 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int commentInsert(Comment c) {
		Connection conn = getConnection();
		int result = dao.commentInsert(conn, c);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Comment> commentList(int boardId) {
		Connection conn = getConnection();
		List<Comment> commentList = dao.commentList(conn, boardId);
		close(conn);
		return commentList;
		
	}
}
