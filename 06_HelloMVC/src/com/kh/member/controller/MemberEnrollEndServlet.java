package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원가입정보(데이터)를 받아옴
//		String userId=request.getParameter("userId");
//		String password=request.getParameter("password");
//		String userName=request.getParameter("userName");
//		int age=Integer.parseInt(request.getParameter("age"));
//		String gender=request.getParameter("gender");
//		String email=request.getParameter("email");
//		String phone=request.getParameter("phone");
//		String address=request.getParameter("address");
		//취미 다중값을 전달함
		String[] hobby=request.getParameterValues("hobby");
		
		//오라클 DB에는 배열자료형이 없음 문자형으로 변환해줘야함.
		String hobbys=String.join(",", hobby);
		
//		Member m=new Member(userId,password,)
		Member m=new Member();
		m.setUserId(request.getParameter("userId"));
		m.setPassword(request.getParameter("password"));
		m.setUserName(request.getParameter("userName"));
		m.setAge(Integer.parseInt(request.getParameter("age")));
		m.setGender(request.getParameter("gender"));
		m.setEmail(request.getParameter("email"));
		m.setPhone(request.getParameter("phone"));
		m.setAddress(request.getParameter("address"));
		m.setHobby(String.join(",",request.getParameterValues("hobby")));
		//전달받은 데이터를 DB에 저장
		int result=new MemberService().insertMember(m);
		
		//result결과에 따라 가입 성공여부 메세지를 출력하고 메인화면으로 이동
		String msg="";
		String loc="/";
		if(result>0) {
			msg="회원가입성공";
		}else {
			msg="회원가입실패";
			loc="/enrollMember";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
