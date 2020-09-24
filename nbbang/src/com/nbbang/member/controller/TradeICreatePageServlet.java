package com.nbbang.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Card;
import com.nbbang.member.model.service.MemberService;

/**
 * Servlet implementation class ICreatedPageServlet
 */
@WebServlet("/member/iCreateList")
public class TradeICreatePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradeICreatePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int usid=Integer.parseInt(request.getParameter("usid"));
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=12;//12개씩 보여줄거임
		
		List<Card> blist=new MemberService().boardList(cPage, numPerPage, usid);
		
		for(Card c : blist) {
			String temp = c.getCardBoard().getTradeArea();
			if(temp!=null) {
				if(temp.length()>8) {
				String newTemp = temp.substring(0, temp.indexOf(" ", temp.indexOf(" ") + 1));
				c.getCardBoard().setTradeArea(newTemp);
				}
			}
		}
		
		int totalData=new MemberService().boardListCount(usid);
		int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		String pageBar = "";
		if(pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
		}else {
			pageBar += "<li class='page-item'><a class='page-link' href='"+ request.getContextPath() + "/member/iCreateList?usid="+usid+"&cPage=" + (pageNo-1) + "'>이전</a></li>";
		}
		
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(cPage == pageNo) {
				pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>" + pageNo + "</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='" + request.getContextPath() + 
				"/member/iCreateList?usid="+usid+"&cPage=" + pageNo +"')>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
		}else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/member/iCreateList?usid="+usid+"&cPage=" + pageNo + "'>다음</a></li>";
		}
		
		request.setAttribute("usid", usid);
		request.setAttribute("boardList", blist);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/member/iCreate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
