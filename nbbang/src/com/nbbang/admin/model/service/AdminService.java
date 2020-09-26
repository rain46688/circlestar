package com.nbbang.admin.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbbang.admin.model.AdminMem;
import com.nbbang.admin.model.dao.AdminDao;
import com.nbbang.customer.model.vo.CustomerCenter;

public class AdminService {
	private AdminDao aa = new AdminDao();

	public List<CustomerCenter> customerList(int cPage, int numPerPage, String a) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<CustomerCenter> list = aa.customerList(conn, cPage, numPerPage,a);
		close(conn);
		return list;
	}

	public int customerListCount(String a) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = aa.customerListCount(conn,a);
		close(conn);
		return cnt;
	}

	public List<CustomerCenter> customerList(int cPage, int numPerPage, String a, String select, String search) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<CustomerCenter> list = null;
		if(select.equals("ALL")) {
			 list = aa.customerList(conn, cPage, numPerPage,a,search);
		}else {
			 list = aa.customerList(conn, cPage, numPerPage,a,select,search);
		}
		close(conn);
		return list;
	}

	public int customerListCount(String a, String select, String search) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = 0;
		if(select.equals("ALL")) {
			System.out.println("서비스 ALL분기");
			cnt = aa.customerListCount(conn,a,search);
		}else {
			System.out.println("서비스 ALL 아님");
			cnt = aa.customerListCount(conn,a,select,search);
		}
		close(conn);
		return cnt;
	}

	public List<AdminMem> memberInfoList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<AdminMem> list = aa.memberInfoList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}


}
