package com.nbbang.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Card;

/**
 * Servlet implementation class MainViewServlet
 */
@WebServlet("/mainView")
public class MainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key = request.getParameter("function");
		List<Card> list = new BoardService().mainViewList(key);
		for(Card c : list) {
			String temp = c.getCardBoard().getTradeArea();
			if(temp!=null) {
				if(temp.length()>8) {
				String newTemp = temp.substring(0, temp.indexOf(" ", temp.indexOf(" ") + 1));
				c.getCardBoard().setTradeArea(newTemp);
				}
			}
		}
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
