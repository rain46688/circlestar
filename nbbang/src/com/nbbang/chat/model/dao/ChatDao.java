package com.nbbang.chat.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

public class ChatDao {
	
	private Properties prop = new Properties();

	
	public ChatDao() {
		// TODO Auto-generated constructor stub
		String path = ChatDao.class.getResource("/sql/chat/chat.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String selectCurMemsList(Connection conn, String boardId) {
		// TODO Auto-generated method stub
		return null;
	}

}
