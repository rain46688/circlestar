package com.nbbang.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.nbbang.chat.model.service.ChatService;
import com.nbbang.chat.model.vo.Message;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class ChatListGetServlet
 */
@WebServlet("/chat/getChatList")
public class ChatListGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChatListGetServlet() {
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
		System.out.println(" === ChatListGetServlet 실행 === ");

		List<Message> list = new ChatService().getChatList(request.getParameter("boardId"));
		String curMemsList = new ChatService().selectCurMemsList(request.getParameter("boardId"));
		System.out.println();
		for (Message m : list) {
			// System.out.println(m.getSendNickName()+" : "+m.getMsg());
			m.setCurMemsList(curMemsList);
		}
		//list = null;//나중에 지워야됨! 임시로 해놓음
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginnedMember");
		if (!curMemsList.equals("") && m != null)
			if (curMemsList.contains(m.getNickname())) {
					System.out.println("m.getNickname() : "+m.getNickname());
					response.setContentType("application/json;charset=utf-8");
					new Gson().toJson(list, response.getWriter());
					return;
				} else {
					list = null;
					System.out.println("널부분 진입 m.getNickname() : "+m.getNickname());
					response.setContentType("application/json;charset=utf-8");
					new Gson().toJson(list, response.getWriter());
				}
			

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
