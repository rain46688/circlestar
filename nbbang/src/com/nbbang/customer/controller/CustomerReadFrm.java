package com.nbbang.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.nbbang.customer.model.service.CustomerService;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.nbbang.customer.model.vo.CustomerFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CustomerRead
 */
@WebServlet("/customer/customerReadFrm")
public class CustomerReadFrm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReadFrm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int num = Integer.parseInt(request.getParameter("num"));
		
		CustomerCenter cc = new CustomerService().viewDetailRead(num); 
		
		/*
		 * System.out.println("실행되나"); for(CustomerFile c : cc.getCf()) {
		 * System.out.println(c); }
		 */
	
		String view ="";
		if(cc == null) {
			request.setAttribute("msg", "조회 실패");
			request.setAttribute("loc", "/customer/customerQnA"); 
			
		view ="/views/common/msg.jsp";
			
		}else {
			request.setAttribute("cc", cc); 
			view="/views/customer/customerRead.jsp"; 
					
		}
		
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
