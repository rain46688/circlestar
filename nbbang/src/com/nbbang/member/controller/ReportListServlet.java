package com.nbbang.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbbang.board.model.vo.Card;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;
import com.nbbang.member.model.vo.Report;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/member/reportList")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int usid=Integer.parseInt(request.getParameter("usid"));
		HttpSession session=request.getSession();
		Member loginnedMember=(Member)session.getAttribute("loginnedMember");
		if(loginnedMember.getUsid()==usid) {
			if(loginnedMember.getUsid()!=9999) {//관리자가 아니면
				//
				int cPage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				int numPerPage=10;//10개씩 보여줄거임
				List<Report> rlist=new MemberService().getReportList(cPage, numPerPage, usid);
				int totalData=new MemberService().reportListCount(usid);
				int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
				int pageBarSize = 5;
				int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd = pageNo+pageBarSize-1;
				String pageBar = "";
				if(pageNo == 1) {
					pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
				}else {
					pageBar += "<li class='page-item'><a class='page-link' href='"+ request.getContextPath() + "/member/reportList?usid="+usid+"&cPage=" + (pageNo-1) + "'>이전</a></li>";
				}
				
				while(pageNo <= pageEnd && pageNo <= totalPage) {
					if(cPage == pageNo) {
						pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>" + pageNo + "</a></li>";
					}else {
						pageBar+="<li class='page-item'><a class='page-link' href='" + request.getContextPath() + 
						"/member/reportList?usid="+usid+"&cPage=" + pageNo +"')>"+pageNo+"</a></li>";
					}
					pageNo++;
				}
				
				if(pageNo > totalPage) {
					pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
				}else {
					pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/member/reportList?usid="+usid+"&cPage=" + pageNo + "'>다음</a></li>";
				}
				
				request.setAttribute("usid", usid);
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("memberReportList", rlist);
				request.getRequestDispatcher("/views/member/reportList.jsp").forward(request, response);
			}else {//관리자면
				int cPage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				int numPerPage=10;//10개씩 보여줄거임
				List<Report> rlist=new MemberService().getReportListAll(cPage, numPerPage);
				int totalData=new MemberService().reportListAllCount();
				int totalPage = (int)(Math.ceil((double)totalData/numPerPage));
				int pageBarSize = 5;
				int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd = pageNo+pageBarSize-1;
				String pageBar = "";
				if(pageNo == 1) {
					pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
				}else {
					pageBar += "<li class='page-item'><a class='page-link' href='"+ request.getContextPath() + "/member/reportList?usid="+usid+"&cPage=" + (pageNo-1) + "'>이전</a></li>";
				}
				
				while(pageNo <= pageEnd && pageNo <= totalPage) {
					if(cPage == pageNo) {
						pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>" + pageNo + "</a></li>";
					}else {
						pageBar+="<li class='page-item'><a class='page-link' href='" + request.getContextPath() + 
						"/member/reportList?usid="+usid+"&cPage=" + pageNo +"')>"+pageNo+"</a></li>";
					}
					pageNo++;
				}
				
				if(pageNo > totalPage) {
					pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
				}else {
					pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/member/reportList?usid="+usid+"&cPage=" + pageNo + "'>다음</a></li>";
				}
				
				request.setAttribute("usid", usid);
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("memberReportList", rlist);
				request.getRequestDispatcher("/views/member/reportList.jsp").forward(request, response);
			}
		}else {
			request.setAttribute("msg", "접근불가능한 페이지입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
