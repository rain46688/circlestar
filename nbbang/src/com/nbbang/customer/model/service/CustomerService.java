package com.nbbang.customer.model.service;

import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbbang.customer.model.dao.CustomerDAO;
import com.nbbang.customer.model.vo.CustomerCenter;

public class CustomerService {

	private CustomerDAO dao = new CustomerDAO();
	
	public List<CustomerCenter> qnAList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<CustomerCenter> list=dao.qnAList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int qnACount() {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int count=dao.qnACount(conn);
		close(conn);
		return count;
	}
//	public int addCustomerQnA(CustomerCenter cc) {
//		// TODO Auto-generated method stub
//		Connection conn=getConnection();
//		int result=dao.addCustomerQna(conn,cc);
//		if(result>0) commit(conn);
//		else rollback(conn);
//		close(conn);
//		return result;
//	}

	public int insertQna(CustomerCenter c) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int result=dao.insertQna(conn,c);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}




	
}
