package com.nbbang.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.customer.model.service.CustomerService;
import com.nbbang.customer.model.vo.CustomerCenter;

/**
 * Servlet implementation class CustomerAnswer
 */
@WebServlet(description = "/customer/CustmerAnswer", urlPatterns = { "/CustomerAnswer" })
public class CustomerAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomerCenter c = new CustomerCenter();
		c.setCsAnswer(request.getParameter("admin-answer"));
		
		int result = new CustomerService().insertAnswer(c);
		if(result>0) {
//			request.setAttribute("msg","문의답변 등록");
			request.setAttribute("loc", "/customer/customerQnA.jsp");
		} else {
			request.setAttribute("msg", "문의답면 실패 ㅡㅡ");
			request.setAttribute("loc", "/customer/customer");
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
