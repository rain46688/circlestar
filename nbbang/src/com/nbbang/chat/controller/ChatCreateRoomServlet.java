package com.nbbang.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nbbang.chat.model.service.ChatService;

/**
 * Servlet implementation class ChatCreateRoomServlet
 */
@WebServlet("/chat/createRoom")
public class ChatCreateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatCreateRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" === ChatCreateRoomServlet 실행 === ");
		String boardId = request.getParameter("boardId");
		System.out.println("boardId : "+boardId);
		//boardId로 현재 방의 맥스 인원을 알아오고
		int maxMems = new ChatService().getMaxMems(boardId);
		
		//boardId로 검색되는 현재 방의 인원을 알아와야됨
		String curMemsList=new ChatService().selectCurMemsList(boardId);
		int curNum = 0;
		if(!curMemsList.equals(""))
			for(String user : curMemsList.split(",")) {curNum++;}
		
		System.out.println("maxMems : "+maxMems+", curNum : "+curNum);
		
		String flag = "1";
		if(curNum != maxMems ) {
			flag="0";
		}else {
			int result  = new ChatService().creatRoom(boardId);
			if(result > 0) {
				System.out.println(" === 방 TRADE_STAGE 변경됨 === ");
			}else {
				System.out.println(" === 방 TRADE_STAGE 변경안됨!! === ");
			}
		}
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(flag, response.getWriter());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
