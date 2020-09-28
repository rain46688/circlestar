package com.nbbang.board.special.contoller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Card;
import com.nbbang.board.special.model.service.BoardSpecialService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boSpecialList")
public class BoardSpecialListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardSpecialListServlet() {
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
		System.out.println("BoardSpecialListServlet");
		String boardTitle = "특가";
		int cPage;
		SimpleDateFormat f = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 6;
		List<Card> blist = new BoardSpecialService().boardList(cPage, numPerPage, boardTitle);
		for (Card c : blist) {
			String temp = c.getCardBoard().getTradeArea();
			if (temp != null) {
				if (temp.length() > 8) {
					String newTemp = temp.substring(0, temp.indexOf(" ", temp.indexOf(" ") + 1));
					c.getCardBoard().setTradeArea(newTemp);
				}
			}
			String dd = f.format(c.getCardBoard().getLimitTime());
			System.out.println("list : "+c.getCardBoard().getLimitTime());
			System.out.println("list : "+dd);
			if(dd.contains("오전")) {
					//System.out.println("t");
					dd=	dd.replace("오전", "AM");
			}else {
				//System.out.println("f");
				dd=dd.replace("오후", "PM");
			}
			c.getCardBoard().setTime(dd);
			//System.out.println(dd);
		}
		
		
//		for(int i=0; i<blist.size();i++) {
//			blist.get(i).getCardBoard().getBoardTitle();
//			
//		}
//		
		
		
		int totalData = new BoardService().boardListCount(boardTitle);
		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/boSpecialList?cPage=" + (pageNo - 1) + "&boardTitle=" + boardTitle + "'>이전</a></li>";
		}

		while (pageNo <= pageEnd && pageNo <= totalPage) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>"
						+ pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
						+ "/boSpecialList?cPage=" + pageNo + "&boardTitle=" + boardTitle + "')>" + pageNo + "</a></li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/boSpecialList?cPage=" + pageNo + "&boardTitle=" + boardTitle + "'>다음</a></li>";
		}
		request.setAttribute("category", boardTitle);
		request.setAttribute("boardList", blist);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/board/boSpecialList.jsp").forward(request, response);
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
