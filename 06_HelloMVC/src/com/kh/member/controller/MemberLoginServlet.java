package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 데이터를 받아오기
		String id=request.getParameter("userId");
		String pw=request.getParameter("password");
		System.out.println("id : "+id+" password : "+pw);
		
		//아이디 저장로직 구성하기 -> Cookie를 이용
		String saveId=request.getParameter("saveId");
		System.out.println("saveId : "+saveId);
		//checkbox에 value값을 설정하지 않았을때 check를 하지 않으면 null 하면 on
		
		//if(saveId.equals("on")) {
		if(saveId!=null) {
			//현재 전달한 아이디를 쿠키에 저장
			//1.Cookie생성
			Cookie c=new Cookie("saveId",id);
			c.setMaxAge(3*24*60*60);//3일간 저장
			//2.Cookie저장 메소드 실행 -> response.addCookie(쿠기객체);
			response.addCookie(c);
		}else {
			//check가 되어있지 않으면
			//기존 cookie값을 삭제
			//동일한 key값을 갖는 Cookie객체를 생성
			//cookie객체의 유효기간을 0으로 설정하면됨 setMaxAge(0);
			Cookie c=new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		
		
		
		
		//로그인 로직을 처리하기
		//클라이언트가 보내준 값이 DB의 Member테이블에 일치하는 값이 있는지 확인
		//그 결과를 가져오는 것!
		//DB에 있는지 확인 -> JDBC처리
		//service에서 요청! 
		Member m=new MemberService().loginMember(id, pw);
		System.out.println(m);
		
		//m이 null이면 로그인 실패
		//m이 null이 아니면 로그인 성공
		//페이지를 선택해서 전환해줌
		if(m!=null) {
			//로그인 성공
			//로그인한 객체를 데이터보관용 request객체에 보관
//			request.setAttribute("logginedMember", m);
			//로그인에 대한 정보는 개발자가 원하는 범위까지 보관할 수 있는
			//session객체에 보관을 함.
			HttpSession session=request.getSession();
			session.setAttribute("logginedMember",m);//유지할 값을 session에 넣기!
			
			response.sendRedirect(request.getContextPath());
		}else {
			//로그인 실패
			//로그인 실패에 대한 에러메세지를 띄워주고 메인화면으로 이동
			//1. 에러메세지를 보여 페이지가 있어야함.
			//2. 에러메제시페이지에서 메인화면으로 전환!
			
			//에러메세지페이지를 공용으로 사용하기 위해
			//에러메세지와 이동할 페이지를 data로 전송 이용
			//request객체를 이용
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다!");
			request.setAttribute("loc", "/");
			//request데이터를 유지해서 페이지를 넘기려면 RequestDispatcher를 이용해서
			//페이지를 전환해야함.
			RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request,response);
			
			
		}
//		RequestDispatcher rd=request.getRequestDispatcher("/");
//		rd.forward(request, response);//새로고침시에 계속 로그인 로직 실행	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
