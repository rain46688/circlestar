package onebyn.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onebyn.common.listener.MemberListener;
import onebyn.model.service.MemberService;
import onebyn.model.vo.Member;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1240217872777232443L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String msg="";
		String loc="/";
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		String saveId = req.getParameter("saveId");
		System.out.println("id : " + id + " pw : " + pw);
		MemberService ms = new MemberService();
		Member m = ms.loginUser(id, pw);
//		System.out.println("m.getId() : "+m.getId());
		
		
		System.out.println("saveId : "+saveId);
		if(saveId !=null) {
			Cookie c = new Cookie("saveId", id);
			c.setMaxAge(3*24*60*60);//3일간 저장
			resp.addCookie(c);
		}else {
			Cookie c = new Cookie("saveId", "");
			c.setMaxAge(0);
			resp.addCookie(c);
		}
		
		
		if (m == null) {
			// 로그인 실패
			System.out.println("로그인 실패");
			loc="/login.do";
			msg="로그인 실패";
		}else if (m != null) {
			// 로그인 성공
			System.out.println(m.getMemberId() + " 로그인 성공");
			// 세션 받기

//			HttpSession session = req.getSession();
//			session.setAttribute("m", m);

			MemberListener ml = new MemberListener();
//			Ml ml = new Ml();
			if (ml.isDuplicate(m.getMemberId())) {// 중복로그인 안되!
				ml.removeSession(m.getMemberId());
			}
			HttpSession session = req.getSession();
			session.setAttribute("m", m);
			ml.addSession(session, m.getMemberId());
			System.out.println("접속 유저 아이디 : " + ml.getUserId(session));

			// 메인 페이지로
			loc="/board.do";
			msg="로그인 성공";
			// 메인없으니 게시판으로 이동 ㅋ
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		req.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(req, resp);
		
	}
}
