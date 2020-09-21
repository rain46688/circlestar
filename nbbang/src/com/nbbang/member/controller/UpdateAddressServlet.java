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

/**
 * Servlet implementation class UpdateAddressServlet
 */
@WebServlet("/member/updateAddressCpl")
public class UpdateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String addressStr=request.getParameter("address1")+" "+request.getParameter("address2");
		int usid=Integer.parseInt(request.getParameter("usid"));
		String address;
		try {
			address=AESCrypto.encrypt(addressStr);
		}catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException | IllegalBlockSizeException
				| BadPaddingException e) {
			address=addressStr;
		}
		int result=new MemberService().updateAddress(usid,address);
		if(result>0) {
			request.setAttribute("msg", "주소 변경에 성공했습니다.");
			request.setAttribute("loc", "/member/memberInfo?usid="+usid);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "주소 변경에 실패했습니다.");
			request.setAttribute("loc", "/member/memberInfo?usid="+usid);
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
