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

import com.nbbang.chat.model.service.ChatService;
import com.nbbang.chat.model.vo.Message;
import com.nbbang.member.model.vo.Member;

@ServerEndpoint(value = "/socket", configurator = GetHttpSession.class, encoders = {
		MessageEncoder.class }, decoders = { MessageDecoder.class })
public class ChatSocket {
	// 세션과 vo객체를 담는 Map 생성
	private static Map<Member, Session> user = new HashMap<Member, Session>();
	// HttpSession 객체 생성
	public static HttpSession httpSession = null;
	private static List<Message> list = new ArrayList<Message>();

	@OnOpen
	public void onOpen(Session session, EndpointConfig con) {
		System.out.println(" === onOpen 메소드 실행 === ");
		// HandShake과정에서 Map객체에 넣은 HttpSession을 가져와서 변수에 대입
		httpSession = (HttpSession) con.getUserProperties().get(HttpSession.class.getName());
		// Member객체를 HttpSession에서 가져와서 출력해봄
		Member m = (Member) httpSession.getAttribute("loginnedMember");
		if (m != null) {
			System.out.println(" === 멤버 닉네임 : " + m.getNickname() + ", HttpSession : " + httpSession + " === ");
			// Map에 담음
			try {
				// Map이 isEmpty인경우 바로 넣어줌
				if (user.isEmpty()) {
					user.put(m, session);
					System.out.println(" === user.isEmpty() 분기문 진입 name : "+m.getNickname()+" === ");
				} else {
					// 중복적으로 접근한 경우 차단시켜서 Map에 넣지않도록 필터링
					System.out.println(" === !user.isEmpty() 분기문 진입 == ");
					Iterator<Member> useriterator = user.keySet().iterator();
					while (useriterator.hasNext()) {
						Member key = useriterator.next();
						if (!key.equals(m)) {
							System.out.println(" === 멤버 user에 추가 name :"+m.getNickname()+" === ");
							user.put(m, session);
						}
					}
				}
			} catch (Exception e) {
				System.out.println(" === onOpen 예외 === ");
			}
		}else {
			System.out.println(" === HttpSession Member값 Null === ");
		}
	}

	@OnMessage
	public void onMessage(Message msg, Session session) {
		System.out.println(" === onMessage 메소드 실행 === ");
		// Message객체 가져옴
		if (msg != null) {
			String name = "";
			try {

				String nickName = msg.getSendNickName();
				String userMessage = msg.getMsg();
				String boardId = msg.getBoardId();
				String memberPicture = msg.getChatProfile();
				String curMemsList = msg.getCurMemsList();
				

				
				
//				System.out.println("nickName : " + nickName + ", userMessage : " + userMessage + "\n" + "boardId : "
//						+ boardId + ", curMemsList : " + curMemsList+", memberPicture : "+memberPicture);
		
				Iterator<Member> userIterator = user.keySet().iterator();
				while (userIterator.hasNext()) {
					Member key = userIterator.next();
					// Member객체의 현재 접속한 방을 기준으로 나눠서 같은 방에 있는 유저한테만 메세지를 보냄
					if (!key.getCurRoomBid().equals("") && key.getCurRoomBid().equals(boardId)) {
						if (user.get(key) != null && user.get(key).isOpen()) {
							name = key.getNickname();
							System.out.println(" === Null이 아니고 세션 열려있음, 메세지 : " + msg + " === ");
							
							if(list.size() != 10) {
								System.out.println("리스트 10 아님 list.size() : "+list.size());
								System.out.println("msg : "+msg);
								list.add(msg);
								user.get(key).getBasicRemote().sendObject(msg);
							}else {
								//디비에 넣고 클리어
								System.out.println("리스트 10됨 list.size() : "+list.size());
							int result = new ChatService().insertChatMsg(list);
								System.out.println("리스트 클리어됨 list.size() : "+list.size());
							}
							
						}
					}
				}
		
			
			
			
			} catch (Exception e) {
				System.out.println(" === onMessage 예외, name : "+name+" === ");
			}
		} else {
			System.out.println(" === msg값 Null === ");
		}
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println(" === onClose 메소드 실행 === ");
		String name = "";
		List<Member> keyList = new ArrayList<Member>();
		Member key = null;
		Iterator<Member> userIterator = user.keySet().iterator();
		try {
			while (userIterator.hasNext()) {
				key = userIterator.next();
				System.out.println(" === 진입 여부 확인용 0 === ");
				// 세션이 끊어진 유저를 user Map에서 삭제하는 과정
				if (user.get(key).equals(session)) {
					name = key.getNickname();
					// 세션이 끊어진 유저 이외에 다른 유저에게 메세지를 전송시켜주도록 필터링하는 과정
					Iterator<Member> exitterator = user.keySet().iterator();
					while (exitterator.hasNext()) {
						key = exitterator.next();
						if (!user.get(key).equals(session)) {
							System.out.println(" === 진입 여부 확인용 1 === ");
							user.get(key).getBasicRemote().sendObject(new Message(key.getNickname(), "SYS2", "", "",""));
						}
					}
					System.out.println(" === 소켓 연결 종료 name : " + name + " === ");
					keyList.add(key);
				}
			}
			for (Member listkey : keyList) {
				System.out.println(" === 진입 여부 확인용 2 === ");
				user.remove(listkey);
			}
		} catch (Exception e) {
			System.out.println(" === onClose 예외, name : "+name+" === ");
		}
	}

}
