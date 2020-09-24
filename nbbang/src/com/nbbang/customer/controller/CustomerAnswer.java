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
@WebServlet("/customer/customerAnswerEnd")
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
		c.setCsId(Integer.parseInt(request.getParameter("csId")));
		
		
		System.out.println(request.getParameter("admin-answer"));
		
		int result = new CustomerService().insertAnswer(c);
		
		String msg = "";
		String loc ="/";
		
		if(result>0) {
			
			msg="댓글완";
			loc = ""; 
			
		
			
		}else {
			msg="실패"; 
			loc=""; 
					
		}
		request.setAttribute("msg", msg);
		request.setAttribute("lodc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
