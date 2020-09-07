package onebyn.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onebyn.model.service.BoardService;
import onebyn.model.vo.Board;

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
		
		Board b = new BoardService().tradePageBoard(id);
		
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
