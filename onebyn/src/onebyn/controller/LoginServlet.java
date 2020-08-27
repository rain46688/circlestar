package onebyn.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.websocket.Session;

import onebyn.common.listener.Ml;
import onebyn.model.vo.Member;
import onebyn.service.LoginService;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1240217872777232443L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
		rd.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		System.out.println("id : "+id +" pw : "+pw);
		LoginService ls = new LoginService();
		Member m = ls.loginUser(getServletContext(),id,pw);
//		System.out.println("m.getId() : "+m.getId());
		if(m.getId() != null) {
			//로그인 성공
			System.out.println(m.getId()+" 로그인 성공");
			//세션 받기
			
//			HttpSession session = req.getSession();
//			session.setAttribute("m", m);
			
			Ml ml = new Ml();
			if(ml.isUsing(m.getId())) {//중복로그인 안되!
				ml.removeSession(m.getId());
			}
			HttpSession session = req.getSession();
			session.setAttribute("m", m);
			ml.addSession(session, m.getId());			
			System.out.println("접속 유저 아이디 : "+ml.getUserID(session));
			
			
			//메인 페이지로
			resp.sendRedirect(req.getContextPath()+"/board.do");
			//메인없으니 게시판으로 이동 ㅋ
		}else if(m.getId() == null) {
			//로그인 실패
			System.out.println("로그인 실패");
		}
		
	}
	
}
