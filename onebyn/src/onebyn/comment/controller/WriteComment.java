package onebyn.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onebyn.comment.model.service.CommentService;
import onebyn.comment.model.vo.Comment;

/**
 * Servlet implementation class WriteComment
 */
@WebServlet("/board/writeComment.do")
public class WriteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("request.getParameter(\"no\") : "+request.getParameter("no"));
		Comment c = new Comment();
		c.setCboardId(request.getParameter("no"));
		c.setCwriterId(request.getParameter("id"));
		c.setComment(request.getParameter("con"));
		c.setSecret(Boolean.parseBoolean(request.getParameter("se")));
		System.out.println("se : "+request.getParameter("se"));
		System.out.println(c);
		CommentService cs = new CommentService();
		cs.addComment(c);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
