package com.nbbang.board.special.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.special.model.service.BoardSpecialService;
import com.nbbang.chat.model.service.ChatService;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class BoardPayServlet
 */
@WebServlet("/board/boardSpecialPay")
public class BoardSpecialPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardSpecialPayServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userUsid = Integer.parseInt(request.getParameter("buyerUsid"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int writerUsid = Integer.parseInt(request.getParameter("writerUsid"));
		String loginNickname = request.getParameter("ln");
		System.out.println(" =========== ");
	System.out.println(userUsid+" "+loginNickname+" "+boardId);
		
		
		Member m = new MemberService().myPage(userUsid);
		
		//특딜 시간 지났으면
		
		//이미 특가에 추가되어있으면
		
		int r = new BoardSpecialService().isInclude(userUsid,boardId);
		if(r == 1) {
			request.setAttribute("msg", "이미 해당 특가딜에 참가하셨습니다.");
			request.setAttribute("loc", "/boSpecialList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
	
		
		int maxmem = new ChatService().getMaxMems(""+boardId);
		int curmem = new ChatService().getCurMems(""+boardId);
		//특가 인원 충분한지 
		if((curmem + 1) <= maxmem) {
		
		if(productPrice>m.getPoint()) {
			request.setAttribute("msg", "포인트가 충분하지 않습니다.");
			request.setAttribute("loc", "/boSpecialList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		int result = new BoardService().boardPay(userUsid, boardId, productPrice, writerUsid);
		
		if(result < 2) {
			request.setAttribute("msg", "결제에 실패했습니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/boSpecialList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}else {
			
			
			int re = new BoardSpecialService().addMem(boardId,userUsid,loginNickname);			
			
			if(re == 1) {
				request.setAttribute("msg", "결제 완료되었습니다.");
				request.setAttribute("loc", "/board/boardSpecialPage?boardId="+boardId+"&writerUsid="+writerUsid+"&reply=success");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
				return;
			}else if(re == 0) {
				request.setAttribute("msg", "특가 인원추가에 실패하였습니다...");
				request.setAttribute("loc", "/boSpecialList");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
				return;
			}
			
		}
		}else {
			//특가 인원 꽉참
			request.setAttribute("msg", "특가 인원이 마감되었습니다..");
			request.setAttribute("loc", "/boSpecialList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		
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
