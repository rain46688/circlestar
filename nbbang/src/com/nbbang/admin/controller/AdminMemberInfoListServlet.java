package com.nbbang.admin.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.admin.model.service.AdminService;
import com.nbbang.admin.model.vo.AdminMem;
import com.nbbang.common.temp.AESCrypto;

/**
 * Servlet implementation class AdminMemberInfoServlet
 */
@WebServlet("/admin/memberInfoList")
public class AdminMemberInfoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberInfoListServlet() {
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
		int cPage;
		List<AdminMem> list = null;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		System.out.println("cPage : "+cPage);
		int numPerPage = 30;

		list = new AdminService().memberInfoList(cPage, numPerPage);
		

		for (AdminMem a : list) {
			String memberId;
			try {
				//System.out.println("?? : "+a.getMem().getMemberId());
				memberId = AESCrypto.decrypt(a.getMem().getMemberId());
				//System.out.println("gg : "+memberId);
			} catch (Exception e) {
				memberId = a.getMem().getMemberId();
			}
			a.getMem().setMemberId(memberId);
		}
	

		int totalData = new AdminService().memberInfoListCount();
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
					+ "/admin/memberInfoList?cPage=" + (pageNo - 1) + " '>이전</a></li>";
		}

		while (pageNo <= pageEnd && pageNo <= totalPage) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>"
						+ pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
						+ "/admin/memberInfoList?cPage=" + pageNo + "')>" + pageNo + "</a></li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'><a class='page-link' href='#' tabindex='-1' aria-disabled='true'>다음</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath()
					+ "/admin/memberInfoList?cPage=" + pageNo + "'>다음</a></li>";
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
