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
 * Servlet implementation class ChargePoint
 */
@WebServlet("/member/chargePoint")
public class ChargePointWindow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChargePointWindow() {
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
		String email=m.getMemberId();
		String name=m.getMemberName();
		String phone=m.getPhone();
		String address=m.getAddress();
		
		String emailStr;
		String phoneStr;
		String adStr;
		try {
			emailStr=AESCrypto.decrypt(email);
			phoneStr=AESCrypto.decrypt(phone);
			adStr=AESCrypto.decrypt(address);
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e) {
			emailStr=email;
			phoneStr=phone;
			adStr=address;
		}
		
		request.setAttribute("email", emailStr);
		request.setAttribute("name", name);
		request.setAttribute("phone", phoneStr);
		request.setAttribute("address", adStr);
		request.setAttribute("member", m);
		request.getRequestDispatcher("/views/member/chargePoint.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
