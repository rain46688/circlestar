package onebyn.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import onebyn.common.listener.MemberListener;
import onebyn.model.service.BoardService;
import onebyn.model.vo.Board;

//@WebServlet("/board/notice")
@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 5185085230146159498L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		req.setCharacterEncoding("UTF-8");
		String p = req.getParameter("p");

		BoardService bs = new BoardService();
		List<Board> list = bs.getBoardList((p != null && !p.equals(""))?Integer.parseInt(p):1);
		int cnt = bs.getBoardCount();

//		String dd = req.getServletContext().getRealPath("/images/bs.jpg");
//		File f = new File(dd);
//		if(!f.exists()) {
//			System.out.println("존재 안함 ");
//		}else {
//			System.out.println("존재함!");
//		}
//		System.out.println(dd);

//		System.out.println("cnt : "+cnt);
//		System.out.println("start : "+(Integer.parseInt(p)-(Integer.parseInt(p) - 1)%5));
//		System.out.println("end : "+cnt/9.0);
		
		for (Board b : list) {
			String dd = req.getServletContext().getRealPath(b.getFiles());
			System.out.println(dd);
			File f = new File(dd);
			String check = dd.substring(dd.length() - 1, dd.length());
//			System.out.println("check : "+check);
			if (!f.exists() || check.equals("\\")) {
//				System.out.println("if문 들어옴?");
				System.out.println(b);
				b.setFiles("images/noimage.png");
				System.out.println(b.getFiles() + " 그림 파일 없어서 대체됨!");
			} else {
				System.out.println(b);
			}
		}

//		Ml ml = new Ml();
		System.out.println();
		MemberListener ml = new MemberListener();
		System.out.println("접속 유저 수 : " + ml.getUserCount());
		ml.printUsers();

		System.out.println();
		req.setAttribute("list", list);
		req.setAttribute("cnt", cnt);
		req.getRequestDispatcher("/WEB-INF/views/board/board.jsp").forward(req, resp);
	}
}
