package onebyn.common.listener;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * Application Lifecycle Listener implementation class MemberListener
 *
 */
@WebListener
public class MemberListener implements HttpSessionBindingListener {

	private static Map<HttpSession,String> users = new HashMap<HttpSession,String>();
	
	public MemberListener() {
		// TODO Auto-generated constructor stub
		System.out.println("리스너 듣는중~");
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		users.put(event.getSession(), event.getName());
		System.out.println(event.getName()+"님이 로그인 하셨습니다.");
		System.out.println("현재 접속 유저 수 : "+getUserCount());
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		users.remove(event.getSession());
		System.out.println(event.getName()+"님이 로그아웃 하셨습니다.");
		System.out.println("현재 접속 유저 수 : "+getUserCount());
	}
	
	//세션 맺기
	public void addSession(HttpSession session, String userId) {
		System.out.println("this : "+this+" session : "+session);
		session.setAttribute(userId, this);
	}

	//세션 삭제
	public void removeSession(String userId) {
		Set<Map.Entry<HttpSession, String>> entry =  users.entrySet();
		Iterator<Map.Entry<HttpSession, String>> it = entry.iterator();
		while(it.hasNext()) {
			Map.Entry<HttpSession, String> s = it.next();
			if(s.getValue().equals(userId)) {
				s.getKey().invalidate();
			}
		}
	}

//세션 중복 확인
	public boolean isDuplicate(String userId) {
		return users.containsValue(userId);
	}

//유저 아이디 반환
	public String getUserId(HttpSession session) {
		return users.get(session);
	}

//유저 접속수 반환
	public int getUserCount() {
		return users.size();
	}

//접속 유저 출력 반환
	public void printUsers() {
		Set<Map.Entry<HttpSession, String>> entry = users.entrySet();
		Iterator<Map.Entry<HttpSession, String>> it = entry.iterator();
		System.out.println("==================================");
		int i = 0;
		while(it.hasNext()) {
			Map.Entry<HttpSession, String> s = it.next();
			System.out.println(++i+" 번째 유저 아이디 : "+s.getValue());
			if(s.getKey().getAttribute("m") != null)
				System.out.println("key : "+s.getKey().getAttribute("m"));
		}
		System.out.println("==================================");
	}
}
