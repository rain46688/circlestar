package com.nbbang.common.socket.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

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
	// 메세지 중복값을 제거하기 위해서 Set 생성
	private static Set<Message> set = null;
	// 임시로 메세지를 담기 위해 List 생성
	private static List<Message> list = new ArrayList<Message>();
	// HttpSession 객체 생성
	public static HttpSession httpSession = null;

	@OnOpen
	public void onOpen(Session session, EndpointConfig con) {
		//System.out.println(" === onOpen 메소드 실행 === ");
		// HandShake과정에서 Map객체에 넣은 HttpSession을 가져와서 변수에 대입
		httpSession = (HttpSession) con.getUserProperties().get(HttpSession.class.getName());
		// Member객체를 HttpSession에서 가져와서 출력해봄
		Member m = (Member) httpSession.getAttribute("loginnedMember");
		//Member 객체가 null이 아닐경우 분기 처리
		if (m != null) {
			try {
				//Map에 세션값과 Member 객체를 담음
				user.put(m, session);
			} catch (Exception e) {
				System.out.println(" === onOpen 예외 === "+e);
			}
		} else {
			System.out.println(" === ChatSocket HttpSession Member값 Null === ");
		}
	}

	@OnMessage
	public void onMessage(Message msg, Session session) {
		//System.out.println(" === onMessage 메소드 실행 === ");
		//printMember();
		if (msg != null && !session.isOpen()) {
			String name = "";
			try {
				String boardId = msg.getBoardId();

				Iterator<Member> userIterator = user.keySet().iterator();
				while (userIterator.hasNext()) {
					Member key = userIterator.next();
					// Member객체의 현재 접속한 방을 기준으로 나눠서 같은 방에 있는 유저한테만 메세지를 보냄
					if (!key.getCurRoomBid().equals("") && key.getCurRoomBid().equals(boardId)) {
						//System.out.println(" === 방기준으로 나누기 분기 부분 === ");
						if (user.get(key) != null && user.get(key).isOpen()) {
							name = key.getNickname();
							//카운트 동안 분기 처리해서 넣음
							if (list.size() != 20) {
								//System.out.println(" === ChatSocket 리스트 안참 list.size() : " + list.size() + " === ");
								if (!msg.getMsg().equals("SYS1") && !msg.getMsg().equals("SYS2")) {
									//시스템 메세지는 제외해서 List에 카운트를 함
									list.add(msg);
								}
								//메세지를 각 세션에 메세지를 객체로 발송함
								user.get(key).getBasicRemote().sendObject(msg);
							} else {
								//List 카운트가 넘어가면 그 순간 메세지도 List에 저장 후 발송
								if (!msg.getMsg().equals("SYS1") && !msg.getMsg().equals("SYS2")) {
									list.add(msg);
								}
								user.get(key).getBasicRemote().sendObject(msg);
//								System.out.println(" === ChatSocket 리스트 꽉참 list.size() : " + list.size() + " === ");
								//중복 제거
								set = new HashSet<Message>(list);
								list = new ArrayList<Message>(set);
								// 디비에 넣고 정상적으로 DB에 올라가면 List 클리어
								int result = new ChatService().insertChatMsg(list);
							}
						}

					}
				}

			} catch (Exception e) {
				System.out.println(" === onMessage 예외, name : " + name + " === ");
			}
		} else {
			System.out.println(" === ChatSocket msg값 Null === ");
		}
	}

	@OnClose
	public void onClose(Session session) {
		//System.out.println(" === onClose 메소드 실행 === ");
		String name = "";
		String boardId = "";
		List<Member> keyList = new ArrayList<Member>();
		Member key = null;

		//세션이 끊기면 현재 저장한 내역 중복 제거 후 List에 저장 후 List 클리어
		set = new HashSet<Message>(list);
		list = new ArrayList<Message>(set);
		int result = new ChatService().insertChatMsg(list);

		Iterator<Member> userIterator = user.keySet().iterator();
		try {
			while (userIterator.hasNext()) {
				key = userIterator.next();
				// 세션이 끊어진 유저를 user Map에서 삭제하는 과정
				if (user.get(key).equals(session)) {
					name = key.getNickname();
					boardId = key.getCurRoomBid();
					// 세션이 끊어진 유저 이외에 다른 유저에게 퇴장 메세지를 전송시켜주도록 필터링하는 과정
					Iterator<Member> exitterator = user.keySet().iterator();
					while (exitterator.hasNext()) {
						key = exitterator.next();
						if (!user.get(key).equals(session) && key.getCurRoomBid().equals(boardId)) {
							//루프 돌면서 현재 세션이랑 같지 않으면서 같은 방에 있는 인원에게만 메세지 전달
							user.get(key).getBasicRemote().sendObject(new Message(name, "SYS2", "", "", "", ""));
						}
					}
					//System.out.println(" === ChatSocket 소켓 연결 종료 name : " + name + " === ");
					//퇴장 한 사람을 리스트에 담음
					keyList.add(key);
				}
			}
			for (Member listkey : keyList) {
				//System.out.println(" === ChatSocket 진입 여부 확인용 === ");
				//Map에서 삭제
				user.remove(listkey);
			}
			System.out.println("onclose부분 print");
			printMember();
		} catch (Exception e) {
			System.out.println(" === onClose 예외, name : " + name + " === ");
		}
	}
	
	public void printMember() {
		System.out.println(" ---------------------- ");
		Iterator<Member> it = user.keySet().iterator();
		while (it.hasNext()) {
			Member key = it.next();
			System.out.println(key.getNickname());

		}
		System.out.println(" ---------------------- ");
	}

}
