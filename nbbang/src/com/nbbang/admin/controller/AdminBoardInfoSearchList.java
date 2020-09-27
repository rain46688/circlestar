package com.nbbang.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.admin.model.service.AdminService;
import com.nbbang.admin.model.vo.AdminBoard;
import com.nbbang.admin.model.vo.AdminMem;
import com.nbbang.customer.model.vo.CustomerCenter;

/**
 * Servlet implementation class AdminMemberInfoSearchList
 */
@WebServlet("/admin/boardInfoSearchList")
public class AdminBoardInfoSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminBoardInfoSearchList() {
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
		System.out.println(" === AdminBoardInfoSearchList 실행됨 === ");
		String select = request.getParameter("s"); // 아무것도 안넣으면  ALL , 전체,제목,닉네임,거래지역
		String select2 = request.getParameter("s2"); // 아무것도 안넣으면 D , 날짜,글ID,조회수,거래단계,제품가격,좋아요
		String select3 = request.getParameter("s3"); // 아무것도 안넣으면 특가,  특가,식품,패션잡화,취미문구,티켓,애완용품
		String Search = request.getParameter("Sc");// 아무것도 안적으면 빈값 "", 검색값
		String ra = request.getParameter("ra");// 선택안하면 null이 넘어옴, 오름차순ASC, 내림차순DESC
		String p = request.getParameter("p");// 선택안하면 null이 넘어옴, 인기게시물 여부

		System.out.println(select + " " +select2 + " " +select3 + " [" + Search + "] " + ra + " " + p);

		int cPage;
		List<AdminBoard> list = null;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 30;

		list = new AdminService().boardInfoSearchList(cPage, numPerPage, ra, select, Search, select2,select3,p);

		int totalData = new AdminService().boardInfoSearchListCount(ra, select, Search, select2,select3,p);

		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/admin/adminCustomerSearch?cPage=" + (pageNo - 1) + "&ra=" + ra + "&s=" + select + "&Sc="
					+ Search + "&p=" + p + "&select2=" + select2 + "&select3=" + select3 + " '>이전</a></li>";
		}

		while (pageNo <= pageEnd && pageNo <= totalPage) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>"
						+ pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
						+ "/admin/adminCustomerSearch?cPage=" + pageNo + "&ra=" + ra + "&s=" + select + "&Sc=" + Search
						+"&p=" + p + "&select2=" + select2 + "&select3=" + select3 + "')>" + pageNo + "</a></li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/admin/adminCustomerSearch?cPage=" + pageNo + "&ra=" + ra + "&s=" + select + "&Sc=" + Search
					+ "&p=" + p + "&select2=" + select2 + "&select3=" + select3 + "'>다음</a></li>";
		}
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/admin/boardInfoList.jsp").forward(request, response);

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
