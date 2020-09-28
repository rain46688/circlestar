package com.nbbang.board.special.model.service;

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
import com.nbbang.board.special.model.dao.BoardSpecialDao;
import com.nbbang.chat.model.dao.ChatDao;
import com.nbbang.chat.model.service.ChatService;

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

	
	public List<Card> boardList(int cPage, int numPerPage, String boardTitle) {
		Connection conn = getConnection();
		List<Card> boardList = dao.boardList(conn, cPage, numPerPage, boardTitle);
		close(conn);
		return boardList;
	}
	
	
	public Card boardPage(String boardId, boolean hasRead, int writerUsid) {
		Connection conn = getConnection();
		Card c = dao.boardPage(conn, boardId);
		c = dao.boardPageForProfile(conn, c, writerUsid);
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


	public int addMem(int boardId, int userUsid, String loginNickname) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int maxmem = new ChatService().getMaxMems(""+boardId);
		int curmem = new ChatService().getCurMems(""+boardId);
		int result = 0;
		if(curmem == maxmem) {
			close(conn);
			return 4;
			//특가 인원꽉참
		}
		
		if(curmem+1 >= maxmem) {
			//추가 하고 마감시키기
			result = new BoardDao().boardInsertTradeList(conn, userUsid, loginNickname);
			System.out.println("특가 인원 추가함");
			if(result > 0) {
				//마감시키기
				result = dao.tradeClose(conn,boardId);
				System.out.println("특가 인원 추가 하고 마감됨");
			}else {
				result = 0;
			}
			
		}else {
			//그냥 추가하기
			result = new BoardDao().boardInsertTradeList(conn, userUsid, loginNickname);
			System.out.println("특가 인원 추가만 함 마감은 안됨");
		}
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
		
	}
	
	
	
	
	
	
	
}
