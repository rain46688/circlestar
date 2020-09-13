package onebyn.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatRoomServlet
 */
@WebServlet("/chatroom.do")
public class ChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static List<String> list = new ArrayList<>();
       
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
	
		String id = request.getParameter("id");
		list.add(id);
		
		for(String s : list) {
			System.out.print(s+", ");
		}
		
		System.out.println("채팅방 서블릿 실행");
		request.getRequestDispatcher("/WEB-INF/views/board/chatroom.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
