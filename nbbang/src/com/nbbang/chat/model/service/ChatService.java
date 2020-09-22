package com.nbbang.chat.model.service;

import java.sql.Connection;

import com.nbbang.chat.model.dao.ChatDao;

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

	
	
	
}
