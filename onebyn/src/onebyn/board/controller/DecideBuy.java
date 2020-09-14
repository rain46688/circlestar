package onebyn.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onebyn.board.model.service.BoardService;

/**
 * Servlet implementation class DecideBuy
 */
@WebServlet("/decidebuy.do")
public class DecideBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DecideBuy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("구매 확정 메소드");
		System.out.println("user : "+request.getParameter("user"));
		System.out.println("bid : "+request.getParameter("bid"));
		String user = request.getParameter("user");
		String bid = request.getParameter("bid");
		int result = new BoardService().decideBuyUserAdd(user,bid);

		if(result > 0) {
			System.out.println("현재 방에 유저 추가");
		}else {
			System.out.println("현재 방에 유저 추가 실패!!!");
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
