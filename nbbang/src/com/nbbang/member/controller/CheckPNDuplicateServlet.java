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
 * Servlet implementation class checkPNDuplicate
 */
@WebServlet("/checkPNDuplicate")
public class CheckPNDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPNDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String phoneStr=request.getParameter("phone");
		String phone;
		try {
			phone = AESCrypto.encrypt(phoneStr);
		} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e) {
			// TODO Auto-generated catch block
			phone=phoneStr;
		}
		Member m=null;
		m=new MemberService().phoneDuplicate(phone);
		request.setAttribute("checkPN", m);
		request.getRequestDispatcher("/views/member/checkPNajax.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
