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
 * Servlet implementation class MemberInfoPageServlet
 */
@WebServlet("/memberInfo")
public class MemberInfoPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usid=Integer.parseInt(request.getParameter("usid"));
		Member m=new MemberService().myPage(usid);
		String memberIdStr;
		String phoneStr;
		String addressStr;
		try {
			memberIdStr=AESCrypto.decrypt(m.getMemberId());
			String phoneDec=AESCrypto.decrypt(m.getPhone());
			addressStr=AESCrypto.decrypt(m.getAddress());
			phoneStr=phoneDec.substring(0,3)+"-"+phoneDec.substring(3,7)+"-"+phoneDec.substring(7);
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e) {
			memberIdStr=m.getMemberId();
			phoneStr=m.getPhone();
			addressStr=m.getAddress();
		}
		m.setMemberId(memberIdStr);
		m.setPhone(phoneStr);
		m.setAddress(addressStr);
		
		request.setAttribute("member", m);
		request.getRequestDispatcher("/views/member/memberInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
