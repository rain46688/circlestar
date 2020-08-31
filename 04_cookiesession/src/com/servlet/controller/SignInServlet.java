package com.servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.model.sevice.ServletService;
import com.servlet.model.vo.Member;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/signIn.do")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId=request.getParameter("memberId");
		String memberPwd=request.getParameter("memberPwd");
		String memberName=request.getParameter("memberName");
		String gender=request.getParameter("gender");
		String ageStr=request.getParameter("age");
		int age=Integer.parseInt(ageStr);
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String hobby=request.getParameter("hobby");
		System.out.println("야");
		System.out.println(memberId+memberPwd+memberName+gender+age+email+phone+address+hobby);
		Member m=new ServletService().signIn(memberId, memberPwd, memberName, gender, age, email, phone, address, hobby);
		String view="";
		if(m!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("signInMember", m);
			view="signInView.do";
		}else {
			view="";
		}
		RequestDispatcher rd=request.getRequestDispatcher(view);
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
