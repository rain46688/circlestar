package com.nbbang.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.admin.model.service.AdminService;
import com.nbbang.admin.model.vo.AdminMem;
import com.nbbang.customer.model.vo.CustomerCenter;

/**
 * Servlet implementation class AdminMemberInfoSearchList
 */
@WebServlet("/admin/memberInfoSearchList")
public class AdminMemberInfoSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberInfoSearchList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" === AdminMemberInfoSearchList 실행됨 === ");
		String select = request.getParameter("s");
		String Search = request.getParameter("Sc");// 아무것도 안적으면 빈값
		String ra = request.getParameter("ra");
		String c = request.getParameter("c");// 선택안하면 null이 넘어옴

		
		if(c == null) {
			System.out.println("c는 널이다");
		}else {
			System.out.println("c는 널이 아니다");
		}
		
		System.out.println(select + " [" + Search + "] " + ra + " " + c);

		int cPage;
		List<AdminMem> list = null;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		
		System.out.println("cPage : "+cPage);
		
		int numPerPage = 30;

		list = new AdminService().memberInfoSearchList(cPage, numPerPage, ra, select, Search, c);

		int totalData = new AdminService().memberInfoSearchListCount(ra, select, Search, c);
		System.out.println("totalData : "+totalData);

		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/admin/memberInfoSearchList?cPage=" + (pageNo - 1) + "&ra=" + ra + "&s=" + select + "&Sc="
					+ Search + "&c=" + c + " '>이전</a></li>";
		}

		while (pageNo <= pageEnd && pageNo <= totalPage) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>"
						+ pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
						+ "/admin/memberInfoSearchList?cPage=" + pageNo + "&ra=" + ra + "&s=" + select + "&Sc=" + Search
						+ "&c=" + c + "')>" + pageNo + "</a></li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/admin/memberInfoSearchList?cPage=" + pageNo + "&ra=" + ra + "&s=" + select + "&Sc=" + Search
					+ "&c=" + c + "'>다음</a></li>";
		}
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/admin/memberInfoList.jsp").forward(request, response);

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
