package com.nbbang.customer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.customer.model.service.CustomerService;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;

/**
 * Servlet implementation class CustomerQnAServlet
 */
@WebServlet("/customer/customerQnA")
public class CustomerQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerQnAServlet() {
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

		String nick = ((Member) request.getSession().getAttribute("loginnedMember")).getNickname();

		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		int numPerPage = 7;

		List<CustomerCenter> list = new CustomerService().qnAList(cPage, numPerPage, nick);
		/*
		 * for (CustomerCenter c : list) { System.out.println("c : " + c); }
		 */
		int totalData = new CustomerService().qnACount(nick);
		int totalPage = (int) (Math.ceil((double) totalData / numPerPage));
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";
		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>이전</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/customer/customerQnA?cPage=" + (pageNo - 1) + " '>이전</a></li>";
		}

		while (pageNo <= pageEnd && pageNo <= totalPage) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>"
						+ pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
						+ "/customer/customerQnA?cPage=" + pageNo + "')>" + pageNo + "</a></li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/customer/customerQnA?cPage=" + pageNo + "'>다음</a></li>";
		}
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/customer/customerQnA.jsp").forward(request, response);
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
