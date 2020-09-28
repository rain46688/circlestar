package com.nbbang.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;

/**
 * Servlet implementation class BoardShippingServlet
 */
@WebServlet("/board/boardShip")
public class BoardShippingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardShippingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("머여??");
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int writerUsid = Integer.parseInt(request.getParameter("writerUsid"));
		
		int result = new BoardService().boardShipping(boardId);
		
		if(result>0) {
			request.setAttribute("msg", "배송을 시작합니다.");
			request.setAttribute("loc", "/board/boardPage?boardId="+boardId+"&writerUsid="+writerUsid);
		}else {
			request.setAttribute("msg", "배송 시작에 실패했습니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/board/boardPage?boardId="+boardId+"&writerUsid="+writerUsid);
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
