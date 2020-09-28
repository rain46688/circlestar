package com.nbbang.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeliveryServlet
 */
@WebServlet("/board/boardDelivery")
public class BoardDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeliveryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int writerUsid = Integer.parseInt(request.getParameter("writerUsid"));
		int buyerUsid = Integer.parseInt(request.getParameter("buyerUsid"));
		
		int result = new BoardService().boardDelivery(boardId, buyerUsid);
		
		if(result < 1) {
			request.setAttribute("msg", "수령확인에 실패했습니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "물품수령이 확인되었습니다.");
			request.setAttribute("loc", "/board/boardPage?boardId="+boardId+"&writerUsid="+writerUsid+"&reply=delivery");
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
