package com.nbbang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.member.model.service.MemberService;

/**
 * Servlet implementation class UpdatePwServlet
 */
@WebServlet(name = "updatePassword", urlPatterns = "/updatePwCpl")
public class UpdatePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int usid=Integer.parseInt(request.getParameter("usid"));
		int pwIsUuid=0;
		String realPw=request.getParameter("realPw");
		System.out.println(realPw);
		
		String crtPw=request.getParameter("crtPw");
		UuidEncryptor ue=new UuidEncryptor();
		String encCrtPw=ue.getSha512(crtPw);
		System.out.println(encCrtPw);
		
		String newPw=request.getParameter("newPw");
		System.out.println(newPw);
		
		if(encCrtPw.equals(realPw)) {
			int result=new MemberService().updateFindPwMember(newPw, pwIsUuid, usid);
			if(result>0) {
				request.setAttribute("msg", "비밀번호 변경에 성공했습니다.");
				request.setAttribute("loc", "/updatePw?usid="+usid);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
				request.setAttribute("loc", "/updatePw?usid="+usid);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}			
		}else {
			request.setAttribute("msg", "현재 비밀번호가 틀렸습니다.");
			request.setAttribute("loc", "/updatePw?usid="+usid);
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
