package onebyn.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onebyn.board.model.service.BoardService;

/**
 * Servlet implementation class ChatRoomServlet
 */
@WebServlet("/chatroom.do")
public class ChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static List<String> list = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChatRoomServlet() {
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
		System.out.println("채팅방 서블릿 실행@@@@@@@@@@");

//		Set<String> set = new HashSet<String>();
		String bid = request.getParameter("bid");
		System.out.println("bid : " + bid);
		list = new ArrayList<>();
		String blist = new BoardService().curMemberList(bid);

//		System.out.println("blist : " + blist);

//		String[] arr = blist.split(",");
//
//		for (String s : arr) {
//			System.out.print(s + " ");
//			list.add(s);
//		}
		
		request.setAttribute("blist", blist);
		request.getRequestDispatcher("/WEB-INF/views/board/chatroom.jsp").forward(request, response);
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
