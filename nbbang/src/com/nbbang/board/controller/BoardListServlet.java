package com.nbbang.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Board;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 8;
		
		List<Board> blist = new BoardService().boardList(cPage, numPerPage);
		
		int totalData = new BoardService().boardListCount();
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		String pageBar = "";
		if(pageNo == 1) {
			pageBar += "<button type='button' class='btn btn-secondary'>이전</button>";
		}else {
			pageBar += "<button type='button' class='btn btn-secondary' onclick='location.assign('"+ request.getContextPath() + "/board/boardList?cPage=" + (pageNo-1) + "')>이전</button>";
		}
		
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(cPage == pageNo) {
				pageBar += "<button type='button' class='btn btn-secondary'>" + pageNo + "</button>";
			}else {
				pageBar+="<button type='button' class='btn btn-secondary' onclick='location.assign('" + request.getContextPath() + 
				"/board/boardList?cPage="+(pageNo-1)+"')>"+pageNo+"</button>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			pageBar += "<button type='button' class='btn btn-secondary'>다음</button>";
		}else {
			pageBar += "<button type='button' class='btn btn-secondary' onclick='location.assign('" + request.getContextPath() + "/board/boardList?cPage=" + pageNo + "')>다음</button>";
		}
		request.setAttribute("boardList", blist);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/board/bolist.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
