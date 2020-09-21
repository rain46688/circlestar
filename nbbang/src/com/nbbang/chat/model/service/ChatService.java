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

}
