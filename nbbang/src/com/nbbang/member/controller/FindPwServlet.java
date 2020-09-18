package com.nbbang.member.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.common.temp.AESCrypto;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class FindPwServlet
 */
@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberName=request.getParameter("memberName");
		String phoneStr=request.getParameter("phone");
		String memberIdStr=request.getParameter("memberId");
		String phone;
		String memberId;
		try {
			phone = AESCrypto.encrypt(phoneStr);
			memberId=AESCrypto.encrypt(memberIdStr);
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e1) {
			// TODO Auto-generated catch block
			phone=phoneStr;
			memberId=memberIdStr;
		}
		Member m=new MemberService().findPw(memberName, phone, memberId);
	
		if(m==null) {
			String msg="존재하지 않는 회원입니다. 입력정보를 확인해주세요.";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("/views/member/msgFindMember.jsp").forward(request, response);
		}else {
			String pwStr;
			try {
				pwStr=AESCrypto.decrypt(m.getMemberPwd());
			} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
					| BadPaddingException e) {
				// TODO Auto-generated catch block
				pwStr=m.getMemberPwd();
			}
			m.setMemberPwd(pwStr);
			request.setAttribute("findMemberPw", m);
			request.getRequestDispatcher("/views/member/findPw.jsp").forward(request, response);
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
