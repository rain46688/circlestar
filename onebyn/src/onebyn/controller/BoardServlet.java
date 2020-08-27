package onebyn.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onebyn.common.listener.Ml;
import onebyn.model.vo.Board;
import onebyn.service.BoardService;


//@WebServlet("/board/notice")
@WebServlet("/board.do")
public class BoardServlet extends HttpServlet{
	private static final long serialVersionUID = 5185085230146159498L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String p = req.getParameter("p");
		
		int page = 1;
		if(p != null&& !p.equals("")) {
			page = Integer.parseInt(p);
		}
		
		BoardService bs = new BoardService();
		List<Board> list = bs.getBoardList(getServletContext(),page);
		int count = bs.getBoardCount(getServletContext());
//		System.out.println("count : "+count);
//		System.out.println("start : "+(page-(page - 1)%5));
//		System.out.println("end : "+count/9.0);
		
//		String dd = req.getServletContext().getRealPath("/images/bs.jpg");
//		File f = new File(dd);
//		if(!f.exists()) {
//			System.out.println("존재 안함 ");
//		}else {
//			System.out.println("존재함!");
//		}
//		System.out.println(dd);

		for (Board b : list) {
			String dd = req.getServletContext().getRealPath(b.getFiles());
//			System.out.println(dd);
			File f = new File(dd);
			String check = dd.substring(dd.length() - 1, dd.length());
//			System.out.println("check : "+check);
			if (!f.exists() || check.equals("\\")) {
//				System.out.println("if문 들어옴?");
//				System.out.println(b);
				b.setFiles("images/noimage.png");
//				System.out.println(b.getFiles() + " 그림 파일 없어서 대체됨!");
			} else {
//				System.out.println(b);
			}
		}
		
		Ml ml = new Ml();
		System.out.println("접속 유저 수 : "+ml.getUserCount());
		ml.printLoginUsers();
		
		System.out.println();
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
	
	}


}
