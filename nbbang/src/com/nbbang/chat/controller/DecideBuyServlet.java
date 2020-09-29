package com.nbbang.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nbbang.chat.model.service.ChatService;

/**
 * Servlet implementation class DecideBuyServlet
 */
@WebServlet("/chat/decidebuy")
public class DecideBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DecideBuyServlet() {
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
		System.out.println(" === DecideBuyServlet 실행됨 === ");
		String usid = request.getParameter("usid");
		String nickname = request.getParameter("nickname");
		String boardId = request.getParameter("boardId");
		String flag = request.getParameter("flag");

		System.out.println("usid : " + usid + ", nickname : " + nickname + ", boardId : " + boardId + ", flag : " + flag);

		// 구매 결정
		int result = new ChatService().decideBuyUser(usid, nickname, boardId, flag);

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
