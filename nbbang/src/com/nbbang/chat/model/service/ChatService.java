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
		int result = 0;
		if (usid != null) {
			if (flag.equals("1")) {
				if(cd.decideBuyUserCheck(conn,boardId,usid) == 1) {
					result =  2;
				}else {
					result = cd.decideBuyUser(conn,boardId,usid,nickname);
				}
			} else if (flag.equals("2")) {
				result = cd.decideBuyUser(conn,boardId,usid);
				if(result == 1) result=3;
			}
		}
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
		int result = 0;
		for (Message msg : list) {
			result = cd.insertChatMsg(conn,msg);
			if(result == 0) {
				rollback(conn);
				return result;
			}
		}
		System.out.println("여기 실행안됨??");
		list.clear();
		System.out.println(" === 리스트 쌓인거 전송하고 클리어 Service === ");
		if(result > 0) {
			System.out.println("커밋 !");
			commit(conn);
		}else {
			System.out.println("커밋 안됨");
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Message> getChatList(String boardId) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<Message> list = cd.getChatList(conn,boardId);
		close(conn);
		return list;
	}

	
	
	
}
