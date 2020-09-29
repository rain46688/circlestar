package com.nbbang.customer.model.service;

import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbbang.customer.model.dao.CustomerDAO;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.nbbang.customer.model.vo.CustomerFile;

public class CustomerService {

	private CustomerDAO dao = new CustomerDAO();

	public List<CustomerCenter> qnAList(int cPage, int numPerPage,String nick) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<CustomerCenter> list = dao.qnAList(conn, cPage, numPerPage,nick);
		close(conn);
		return list;
	}

	public int qnACount(String nick) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int count = dao.qnACount(conn,nick);
		close(conn);
		return count;
	}

	public int insertQnA(CustomerCenter c, List<CustomerFile> fileList) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = dao.insertQna(conn, c);
		// 등록기주은 result가 1이면 등록 아니면 등록실패
		if (result == 1) {
			for (CustomerFile cf : fileList) {
				int result1 = dao.insertQna(conn, cf);
				if(result1==0) {
					rollback(conn);
					return result1;
				}
			}
		}
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int viewDetailRead(CustomerCenter c) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = dao.viewDetailRead(conn, c);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int insertAnswer(CustomerCenter c) {
		System.out.println("c in update: " + c);
		Connection conn = getConnection();
		int result = dao.insertAnswer(conn, c);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public CustomerCenter viewDetailRead(int num) {
		Connection conn = getConnection();
		System.out.println("num in service: " + num);
		CustomerCenter cc= dao.viewDetailRead(conn, num);
		
		close(conn);
		return cc;
	}

}
