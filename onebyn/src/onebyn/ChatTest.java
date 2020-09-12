package onebyn;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//WebSocket 호스트 설정
@ServerEndpoint("/chatsocket")
public class ChatTest {
	//접속 클라이언트 관리 session 리스트 동기화 문제를 해결하기 위해 저렇게 선언함
	private static List<Session> sessionUsers = 
			Collections.synchronizedList(new ArrayList<Session>());
	//메세지의 유저 이름을 거르기 위한 정규표현식
//	private static Pattern p = Pattern.compile("^\\{\\{.*?\\}\\}");
	private static Pattern p = Pattern.compile("^\\[.*?\\]");
//	private int num=1;
	//Session은 WebSocket의 커넥션 정보가 들어있는 인스턴스이다!!
	
	@OnOpen
	public void handleOpen(Session userSession) {
		System.out.println("연결중...");
		//접속 세션을 리스트에 저장
		sessionUsers.add(userSession);
	}//웹 소켓이 연결되면 호출되는 이벤트
	
	@OnMessage
	public void handleMessage(String message, Session userSession) {
		System.out.println("메세지 내용 : "+message);
		//초기 유저명
		String name = "익명";
		//정규식 이용 Matcher객체 생성
		Matcher ma = p.matcher(message);
		if(ma.find()) {//영문자인지 확인
			name = ma.group();//패턴이 일치하는 부분만 추출해서 name에 넣음
		}
		System.out.println("========");
		System.out.println("==== m1 : "+message);
		//정규 표현식 p.pattern() 부합되는 열은 ""로 바꾸는것 즉 지워버린다는 뜻
		final String msg = message.replaceAll(p.pattern(), "");
		System.out.println("==== msg : "+msg);
		System.out.println("==== name : "+name);
		//앞에 감싼 특수기호를 지우는것 마찬가지로 첫번째 파라미터로 정규식이 와야됨
		String username = (name.replaceFirst("^\\[", "").replaceFirst("\\]$", ""));
//		num++;
		System.out.println("==== username : "+username);
		System.out.println("========");
		
		
		
		sessionUsers.forEach(session -> {
//			if(session == userSession) {
//				return;
//				//리스트에 있는 세션과 메세지를 보낸 세션이 같으면 송신할 필요없음
//			}
			try {
				session.getBasicRemote().sendText(username+" : "+msg);
				//리스트에 있는 모든 세션에 메세지를 보낸다.
			}catch(IOException e) {
				e.printStackTrace();
			}
		});
		
	}//웹 소켓으로 부터 메세지가 오면 호출되는 이벤트
	
	@OnClose
	public void handleClose(Session userSession) {
		System.out.println("연결 끊어짐...");
		sessionUsers.remove(userSession);
	}//웹 소켓 닫히면 호출되는 이벤트
	
	@OnError
	public void handleError(Throwable t) {
		System.out.println("연결 에러~~~");
		t.printStackTrace();
	}//웹 소켓이 에러나면 호출되는 이벤트
	
	
	
}
