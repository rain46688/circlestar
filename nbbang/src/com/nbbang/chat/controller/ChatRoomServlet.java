package com.nbbang.chat.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbbang.chat.model.service.ChatService;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class ChatRoomServlet
 */
@WebServlet("/chat/chatRoom")
public class ChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" === ChatRoomServlet 서블릿 실행 === ");
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginnedMember");
		
		//게시판 상세 페이지에서 채팅방이 열리게되면 입장 버튼을 누르게되면
		//새로운 창이 생성되면서 이쪽으로 파라미터가 POST방식으로 넘어옴
		//받아서 채팅방 JSP로 값을 넘겨준다.
		String maxMems = request.getParameter("maxMems");
		String tradeStage = request.getParameter("tradeStage");
		String writerUsid = request.getParameter("writerUsid");
		String boardId = request.getParameter("boardId");
		String curMemsList = request.getParameter("curMemsList");
		String memberPicture = request.getParameter("memberPicture");
		curMemsList=new ChatService().selectCurMemsList(boardId);
		String boardTitle = request.getParameter("boardTitle");
		
		//현재 시간을 객체로 만들어서 넘겨줌
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd a HH:mm");
		Date time_ = new Date();
		String time = format.format(time_);
		System.out.println("time : "+time);
		
		
		System.out.println("maxMems : "+maxMems+", writerUsid : "+writerUsid+"\n"
				+"boardId : "+boardId+", curMemsList : "+curMemsList);
		
		
//		//구매확정한 유저수 curNum
		int curNum = 0;
		
		
		if(m != null && boardId != null) 
			m.setCurRoomBid(boardId);
		//현재 방의 boardId를 넣어줌!! 이부분 중요!
		
		//채팅 쓸때 넘기는걸로 해봄!!
		
		if(!curMemsList.equals(""))
			for(String user : curMemsList.split(",")) {curNum++;}
		
		// 게시자가 정해놓은 N빵 최대 인원
		request.setAttribute("maxMems", maxMems);
		request.setAttribute("tradeStage", tradeStage);
		request.setAttribute("writerUsid", writerUsid);
		request.setAttribute("boardId", boardId);
		request.setAttribute("curNum", curNum);
		request.setAttribute("curMemsList", curMemsList);
		request.setAttribute("x", 600);
		request.setAttribute("y", 800);
		request.setAttribute("m", m);
		request.setAttribute("memberPicture", memberPicture);
		request.setAttribute("time", time);
		request.setAttribute("boardTitle", boardTitle);
		request.getRequestDispatcher("/views/chat/chatRoom.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
