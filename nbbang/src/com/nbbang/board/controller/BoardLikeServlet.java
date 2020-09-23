package com.nbbang.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.member.model.vo.LikeList;

/**
 * Servlet implementation class BoardLikeServlet
 */
@WebServlet("/board/boardLike")
public class BoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userUsid = Integer.parseInt(request.getParameter("userUsid"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		//DB에 Insert
		LikeList list = new LikeList();
		ArrayList<Integer> arr = new ArrayList<Integer>();
		arr.add(boardId);
		list.setLikeBoardId(arr);
		list.setLikeUsid(userUsid);
		
		int result = new BoardService().boardLikeInsert(list);
		
		if(result == 0) {
			PrintWriter pw = response.getWriter();
			pw.append("failed to insert");
		}
		
		//Session에 추가
		HttpSession session = request.getSession();
		if(session.getAttribute("likeList") == null) {
			
		}else {
			
		}
		LikeList listToGet = (LikeList)session.getAttribute("likeList");
		listToGet.getLikeBoardId().add(boardId);
		session.setAttribute("listList", listToGet.getLikeBoardId());
		
		PrintWriter pw = response.getWriter();
		pw.append("success");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
