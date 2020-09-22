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
import com.nbbang.member.model.vo.Grade;
import com.nbbang.member.model.vo.Member;
import com.nbbang.member.model.vo.Report;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/member/myPage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int usid=Integer.parseInt(request.getParameter("usid"));
		Member m=new MemberService().myPage(usid);
		String memberId;
		String phone;
		String address;
		try {
			phone=AESCrypto.decrypt(m.getPhone());
			address=AESCrypto.decrypt(m.getAddress());
			memberId=AESCrypto.decrypt(m.getMemberId());
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e) {
			// TODO Auto-generated catch block
			phone=m.getPhone();
			address=m.getAddress();
			memberId=m.getMemberId();
		}
		m.setPhone(phone);
		m.setAddress(address);
		m.setMemberId(memberId);
		
		Grade g=new MemberService().methodForGrade(usid);
		int grade=g.getGradeLevel();
		int maxRoomCount=g.getMaxRoomCount();
		int reportCount=new MemberService().myPageReport(usid);
		request.setAttribute("member", m);
		request.setAttribute("grade", grade);
		request.setAttribute("maxRoomCount", maxRoomCount);
		request.setAttribute("reportCount", reportCount);
		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
