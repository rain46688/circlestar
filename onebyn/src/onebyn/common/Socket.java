package onebyn.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import onebyn.member.model.vo.Member;

//WebSocket 호스트 설정
//@ServerEndpoint("/socket")
@ServerEndpoint(value = "/socket", configurator = GetHttpSessionConfigurator.class)
public class Socket extends HttpServlet {
	// 접속 클라이언트 관리 session 리스트 동기화 문제를 해결하기 위해 저렇게 선언함
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	private static Map<String, Session> smap = new HashMap<String, Session>();
	// Session은 WebSocket의 커넥션 정보가 들어있는 인스턴스이다!!
	public static HttpSession http;

	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) {
		// 접속 세션을 리스트에 저장
		http = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		Member m = (Member) http.getAttribute("m");
		System.out.println("m : " + m.getMemberId()+", session : "+userSession);
		smap.put(m.getMemberId(), userSession);
//		if (m.getMemberId().equals("ADMIN")) {
		sessionUsers.add(userSession);
		System.out.println("연결중...handleOpen");
//		} else {
//			System.out.println("연결 할수없습니다!!");
//		}

	}// 웹 소켓이 연결되면 호출되는 이벤트

	@OnMessage
	public void handleMessage(String message, Session userSession) {
		boolean flag = false;
		System.out.println("메세지 내용 : " + message);
		String[] msg1 = message.split("/");
		String userName ="";
		String content = "";
		String curSessionUser=((Member)http.getAttribute("m")).getMemberId();
		String curBoardUserList="";
		
		for(int i=0; i< msg1.length;i++) {
			if(i ==0) userName=msg1[i];
			if(i == 1) content=msg1[i];
			if(i == 2) curBoardUserList=msg1[i];
//			if(i == 2) curSessionUser=msg1[i];
		}
		System.out.println("userName : " + userName + ", content : " + content + "\n curSessionUser : " + curSessionUser + "\n curBoardUserList : " + curBoardUserList);
		
		String[] blist = curBoardUserList.split(",");
		
//		System.out.println("blist");
//		for(String s : blist) {
//			System.out.print(s+" ");
//		}
		
		
		System.out.println("=======================");
		System.out.println("map");
		Iterator<String> it = smap.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			//System.out.println("key : "+key+", value : "+smap.get(key));
			for(String ss : blist) {
				if(ss.equals(key)) {
					try {
						smap.get(key).getBasicRemote().sendText(content);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		System.out.println("=======================");
		
		
		
	

//		sessionUsers.forEach(session -> {
////			if(session == userSession) {
////				return;
////				//리스트에 있는 세션과 메세지를 보낸 세션이 같으면 송신할 필요없음
////			}
//			try {
//				session.getBasicRemote().sendText(username + " : " + msg);
//				// 리스트에 있는 모든 세션에 메세지를 보낸다.
//				
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		});

	}// 웹 소켓으로 부터 메세지가 오면 호출되는 이벤트

	@OnClose
	public void handleClose(Session userSession) {
		System.out.println("연결 끊어짐...");
		sessionUsers.remove(userSession);
	}// 웹 소켓 닫히면 호출되는 이벤트

	@OnError
	public void handleError(Throwable t) {
		System.out.println("연결 에러~~~");
		t.printStackTrace();
	}// 웹 소켓이 에러나면 호출되는 이벤트

}
