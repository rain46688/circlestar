package com.nbbang.common.socket.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.nbbang.chat.model.vo.Message;
import com.nbbang.member.model.vo.Member;

@ServerEndpoint(value = "/socket", configurator = GetHttpSession.class, encoders = {
		MessageEncoder.class }, decoders = { MessageDecoder.class })
public class ChatSocket {
	// 세션과 vo객체를 담는 Map 생성
	private static Map<Member, Session> user = new HashMap<Member, Session>();
	// HttpSession 객체 생성
	public static HttpSession httpSession = null;

	@OnOpen
	public void onOpen(Session session, EndpointConfig con) {
		System.out.println(" === onOpen 메소드 실행 === ");
		// HandShake과정에서 Map객체에 넣은 HttpSession을 가져와서 변수에 대입
		httpSession = (HttpSession) con.getUserProperties().get(HttpSession.class.getName());
		// Member객체를 HttpSession에서 가져와서 출력해봄
		Member m = (Member) httpSession.getAttribute("loginnedMember");
		System.out.println(" === 멤버 닉네임 : " + m.getNickname() + ", HttpSession : " + httpSession + " === ");
		// Map에 담음
		user.put(m, session);
	}

	@OnMessage
	public void onMessage(Message msg, Session session) {
		System.out.println(" === onMessage 메소드 실행 === ");
		// Message객체 가져옴
		String nickName = msg.getSendNickName();
		String userMessage = msg.getMsg();
		String boardId = msg.getBoardId();
		String curMemsList = msg.getCurMemsList();

		System.out.println("nickName : " + nickName + ", userMessage : " + userMessage + "\n" + "boardId : " + boardId
				+ ", curMemsList : " + curMemsList);

		try {
			Iterator<Member> userIterator = user.keySet().iterator();
			while (userIterator.hasNext()) {
				Member key = userIterator.next();
				//Member객체의 현재 접속한 방을 기준으로 나눠서 같은 방에 있는 유저한테만 메세지를 보냄
				if (!key.getCurRoomBid().equals("") && key.getCurRoomBid().equals(boardId)) {
				//인희야 에러난다 Member에 curRoomBid 객체 만들어준다며.. 일단 선언하고 기다리고있다.
					if (user.get(key) != null && user.get(key).isOpen()) {
						user.get(key).getBasicRemote().sendObject(msg);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(" === onMessage 예외 === ");
		}

	}

	@OnClose
	public void onClose(Session session) {
		System.out.println(" === onClose 메소드 실행 === ");
		List<Member> keyList = new ArrayList<Member>();
		try {
			Iterator<Member> userIterator = user.keySet().iterator();
			while (userIterator.hasNext()) {
				Member key = userIterator.next();
				//세션이 끊어진 유저를 user Map에서 삭제하는 과정
				if (user.get(key).equals(session)) {
					keyList.add(key);
				}
			}
			for (Member key : keyList) {
				user.remove(key);
			}
		} catch (Exception e) {
			System.out.println(" ===== onClose 예외 ===== ");
		}
	}

}
