package com.nbbang.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Card;

/**
 * Servlet implementation class BoardPageServlet
 */
@WebServlet("/board/boardPage")
public class BoardPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String boardId = request.getParameter("boardId");
		
		Cookie[] cookies = request.getCookies();
		String boardHistory = "";
		boolean hasRead = false;
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				if("boardHistory".equals(name)) {
					boardHistory = value;
					if(value.contains("|"+boardId+"|")) {
						//읽은 게시글
						hasRead = true;
						break;
					}
				}
			}
		}
		
		//읽지 않은 게시물
		if(!hasRead) {
			Cookie c = new Cookie("boardHistory", boardHistory+"|"+boardId+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		Card c = new BoardService().boardPage(boardId, hasRead);
		if(c==null) {
			request.setAttribute("msg", "문서를 불러오는데 실패했습니다");
			request.setAttribute("loc", "/views/board/bolist.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("curCard", c);
			request.getRequestDispatcher("/views/board/boPage.jsp").forward(request, response);
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
