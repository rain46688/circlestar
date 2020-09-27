package com.nbbang.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nbbang.admin.model.service.AdminService;
import com.nbbang.member.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberByeServlet
 */
@WebServlet("/admin/adminMemBye")
public class AdminMemberByeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberByeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mem = request.getParameter("memId");
		String flag = request.getParameter("flag");
		System.out.println(mem);
		System.out.println(flag);

		// 2는 복구 1은 탈퇴
		int result = 999;
		if (flag.equals("1")) {
			result = new AdminService().byebye(Integer.parseInt(mem));
		} else {
			result = new AdminService().iamSoSorry(Integer.parseInt(mem));
		}
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(result, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
