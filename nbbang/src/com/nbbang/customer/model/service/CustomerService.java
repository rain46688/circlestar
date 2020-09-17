package com.nbbang.customer.model.service;

import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.close;

import java.sql.Connection;

import com.nbbang.customer.model.dao.CustomerDAO;

public class CustomerService {

	private CustomerDAO dao = new CustomerDAO();
	
}
