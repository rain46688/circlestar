package onebyn.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import onebyn.model.vo.Board;
import onebyn.service.BoardService;


@WebServlet("/board/notice")
public class BoardServlet extends HttpServlet{
	private static final long serialVersionUID = 5185085230146159498L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String page_ = req.getParameter("p");
		
		int page = 1;
		if(page_ != null&& !page_.equals("")) {
			page = Integer.parseInt(page_);
		}
		
		BoardService bs = new BoardService();
		List<Board> list = bs.getBoardList(getServletContext(),page);
		int count = bs.getBoardCount(getServletContext());
		System.out.println("count : "+count);
		System.out.println("start : "+(page-(page - 1)%5));
		System.out.println("end : "+count/9.0);
		for(Board b : list) {
			System.out.println(b);
		}
		System.out.println("==================================");
		
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		req.getRequestDispatcher("/WEB-INF/board.jsp").forward(req, resp);
	
	}


}
