package onebyn.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onebyn.board.model.service.BoardService;
import onebyn.board.model.vo.Board;

/**
 * Servlet implementation class DetailPageServlet
 */
@WebServlet("/boartrade.do")
public class BoardTradePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardTradePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("t");
		System.out.println("게시글 아이디 : "+id);
		
		Cookie[] cookies = request.getCookies();
		String boardHistory="";
		boolean hasRead = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value=c.getValue();
				if(name.equals("BH")) {
					boardHistory=value;
					if(value.contains("#"+id+"#")) {
						hasRead=true;
						break;
					}
				}
			}
		}
		if(!hasRead) {
			Cookie c = new Cookie("BH", boardHistory+"#"+id+"#");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		
		Board b = new BoardService().tradePageBoard(id,hasRead);
		
		
		System.out.println("가져온 게시글 상세 페이지 요소 : "+b);
		
		request.setAttribute("b", b);
		request.getRequestDispatcher("/WEB-INF/views/board/boardtradepage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
