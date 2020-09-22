package com.nbbang.chat.model.service;

import java.sql.Connection;
import java.util.List;

import com.nbbang.chat.model.dao.ChatDao;
import com.nbbang.chat.model.vo.Message;

import static com.nbbang.common.temp.JDBCTemplate.*;

public class ChatService {

	private ChatDao cd = new ChatDao();
	
	public String selectCurMemsList(String boardId) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		String list = cd.selectCurMemsList(conn,boardId);
		close(conn);
		return list;
	}

	public int getMaxMems(String boardId) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int maxMems = cd.getMaxMems(conn,boardId);
		close(conn);
		return maxMems;
	}

	public int creatRoom(String boardId) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = cd.creatRoom(conn,boardId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int decideBuyUser(String usid, String nickname, String boardId, String flag) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = cd.decideBuyUser(conn,usid,nickname,boardId,flag);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertChatMsg(List<Message> list) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = cd.insertChatMsg(conn,list);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
	
	
}
