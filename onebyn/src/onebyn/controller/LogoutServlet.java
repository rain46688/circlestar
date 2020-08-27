package onebyn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onebyn.model.vo.Member;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
	private static final long serialVersionUID = -4361645753791708636L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		Member m = (Member)session.getAttribute("m");
		System.out.println(m.getName()+"님 로그아웃!");
		session.invalidate();//현재 세션 삭제
		resp.sendRedirect(req.getContextPath()+"/board/notice");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}
	
}
