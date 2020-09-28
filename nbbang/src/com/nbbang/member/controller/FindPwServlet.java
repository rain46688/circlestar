package com.nbbang.member.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.common.filter.EncryptorWrapper;
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
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		    uuid = uuid.substring(0, 8);
		    System.out.println(uuid);
		    m.setMemberPwd(uuid);
		    int pwIsUuid=1;
			request.setAttribute("findMemberPw", m);
			request.getRequestDispatcher("/views/member/findPw.jsp").forward(request, response);
			
			UuidEncryptor ue=new UuidEncryptor();
			String encryptedUuid=ue.getSha512(uuid);
			System.out.println("제대로 된건지 확인"+encryptedUuid);
			int usid=m.getUsid();
			MemberService ms=new MemberService();
			ms.updateFindPwMember(encryptedUuid,pwIsUuid, usid);
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
