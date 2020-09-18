package com.nbbang.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.common.temp.AESCrypto;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet(name = "memberEnroll",urlPatterns = "/memberEnrollEnd")
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
		Member m=new Member();
		String memberId=request.getParameter("userId");
		
		m.setMemberPwd(request.getParameter("password"));
		m.setNickname(request.getParameter("nick"));
		m.setMemberName(request.getParameter("name"));
		m.setGender(request.getParameter("gender"));
		
		String strbirthday=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("date");
		Date birthday=Date.valueOf(strbirthday);
		m.setBirthday(birthday);
		
		String phone=request.getParameter("phone");
		String address=request.getParameter("address1")+" "+request.getParameter("address2");
		
		//암호화 삼형제
		try {
			m.setMemberId(AESCrypto.encrypt(memberId));
			m.setPhone(AESCrypto.encrypt(phone));
			m.setAddress(AESCrypto.encrypt(address));			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		int result=new MemberService().memberEnroll(m);
		
		String msg="";
		String loc="/";
		if(result>0) {
			msg="회원가입에 성공하였습니다.";
		}else {
			msg="회원가입에 실패하였습니다.";
			loc="/enrollMember";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
