package com.nbbang.admin.controller;

import java.io.IOException;
import java.util.List;
import com.nbbang.member.model.vo.Member;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nbbang.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminMemberSearchServlet
 */
@WebServlet("/admin/memberSearch")
public class AdminMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("memberSearch");
		
		String type = request.getParameter("searchType");
		String keyword = request.getParameter("searchkeyword");
	
		System.out.println("type : "+type+", keyword : "+keyword);
		int cPage; 
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(Exception e) {
			cPage=1;
		}
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=5;
		}
		
		List<Member> list = new AdminService().selectMemberSearch(type,keyword,cPage,numPerPage);

		int pageBarSize=5;
		int totalData = new AdminService().selectMemberSearchCount(type,keyword);
		int totalPage=(int)(Math.ceil((double)totalData/numPerPage));
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()
					+ "/admin/memberSearch?cPage="+(pageNo-1)
					+"&searchType="+type+"&searchkeyword="+keyword
					+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/admin/memberSearch?cPage="+pageNo
				+"&searchType="+type+"&searchkeyword="+keyword
				+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/admin/memberSearch?cPage="+pageNo
			+"&searchType="+type+"&searchkeyword="+keyword
			+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("members", list);
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
