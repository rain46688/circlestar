package onebyn.common.listener;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * Application Lifecycle Listener implementation class Ml
 *
 */
@WebListener
public class Ml implements HttpSessionBindingListener {
	
	private static Hashtable loginUsers = new Hashtable();

	public Ml() {
		System.out.println("HttpSessionBindingListener 대기중 ~ ");
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		loginUsers.put(event.getSession(),event.getName() );
		System.out.println(event.getName()+"님이 로그인 하셨습니다.");
		System.out.println("현재 접속자 수 "+getUserCount());
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		loginUsers.remove(event.getSession());
		System.out.println(event.getName()+"님이 로그아웃 하셨습니다.");
		System.out.println("현재 접속자 수 "+getUserCount());
	}

	public void removeSession(String userId) {
		Enumeration e = loginUsers.keys();
		HttpSession session = null;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			if(loginUsers.get(session).equals(userId)) {
				session.invalidate();
			}
		}
	}
	
	
	public boolean isUsing(String userId) {
		return loginUsers.contains(userId);
	}
	
	public void setSession(HttpSession session, String userId) {
		session.setAttribute(userId, this);
	}
	
	public String getUserID(HttpSession session) {
		return (String)loginUsers.get(session);
	}
	
	public int getUserCount() {
		return loginUsers.size();
	}
	
	public void printloginUsers() {
		Enumeration e = loginUsers.keys();
		HttpSession session = null;
		System.out.println("==================================");
		int i=0;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			System.out.println(++i+" 접속자 : "+loginUsers.get(session));
		}
		System.out.println("==================================");
	}
	
	
	
	
	

}
