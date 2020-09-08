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
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/memberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("memberList");
		int cPage;
		List<Member> list = null;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(Exception e) {
			cPage=1;
		}
		
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=5;
		}
		
		list = new AdminService().selectMemberList(cPage, numPerPage);
		int totalData;
		totalData = new AdminService().selectMemberCount();
		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		for(Member m : list) {
		System.out.println(m);
	}

		String pageBar = "";
		
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()
			+"/admin/memberList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";		
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+
						"/admin/memberList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
			
		}else {
			pageBar+="<a href='"+request.getContextPath()+
					"/admin/memberList?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		
		System.out.println("========================");
		System.out.println("cPage : " + cPage);
		System.out.println("numPerPage : " + numPerPage);
		System.out.println("totalData : " + totalData);
		System.out.println("totalPage : " + totalPage);
		System.out.println("pageNo : " + pageNo);
		System.out.println("pageEnd : " + pageEnd);
		System.out.println("pageBar : " + pageBar);
		System.out.println("========================");
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
