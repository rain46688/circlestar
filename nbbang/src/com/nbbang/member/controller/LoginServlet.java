package com.nbbang.member.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbbang.common.temp.AESCrypto;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberIdStr=request.getParameter("memberId");
		String memberId;
		if(memberIdStr.equals("admin@kh.com")) {
			memberId="admin@kh.com";
		}else {
			try {
				memberId = AESCrypto.encrypt(memberIdStr);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				memberId=memberIdStr;
			}			
		}
		String memberPwd=request.getParameter("password");
		Member m=new MemberService().loginMember(memberId,memberPwd);
		
		String saveId=request.getParameter("saveId");
		if(saveId!=null) {
			Cookie c=new Cookie("saveId",memberIdStr);
			c.setMaxAge(7*24*60*60);//일주일간 저장할거임
			response.addCookie(c);
		}else {
			Cookie c=new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		if(m!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("loginnedMember",m);
			if(m.isPwIsUuid()==true) {
				request.setAttribute("msg", "임시 비밀번호를 사용 중입니다. 비밀번호를 변경해주세요.");
				request.setAttribute("loc", "/");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}else{
				response.sendRedirect(request.getContextPath());				
			}
		}else {
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
