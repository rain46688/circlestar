package com.nbbang.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Comment;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/board/commentInsert")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Comment c = new Comment();
		if(request.getParameter("comLayer").equals("1")) {
			c.setCboardId(Integer.parseInt(request.getParameter("cBoardId")));
			c.setContent(request.getParameter("content"));
			c.setSecret(request.getParameter("secret").equals("secretComment")?true:false);
			c.setCwriterNickname(request.getParameter("cWriterNickname"));
			c.setComLayer(Integer.parseInt(request.getParameter("comLayer")));
			c.setComProfile(request.getParameter("comProfile"));
		}else {
			c.setCboardId(Integer.parseInt(request.getParameter("cBoardId")));
			c.setContent(request.getParameter("content"));
			c.setCwriterNickname(request.getParameter("cWriterNickname"));
			c.setComLayer(Integer.parseInt(request.getParameter("comLayer")));
			c.setComProfile(request.getParameter("comProfile"));
			c.setComRef(Integer.parseInt(request.getParameter("com_ref")));
		}
		
		int result = new BoardService().commentInsert(c);
		
		PrintWriter pw = response.getWriter();
		if(result==0) {
			pw.print("fail");
		}
		pw.print("success");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
