package com.nbbang.admin.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbbang.admin.model.dao.AdminDao;
import com.nbbang.admin.model.vo.AdminBoard;
import com.nbbang.admin.model.vo.AdminMem;
import com.nbbang.customer.model.vo.CustomerCenter;

public class AdminService {
	private AdminDao aa = new AdminDao();

	public List<CustomerCenter> customerList(int cPage, int numPerPage, String a) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<CustomerCenter> list = aa.customerList(conn, cPage, numPerPage, a);
		close(conn);
		return list;
	}

	public int customerListCount(String a) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = aa.customerListCount(conn, a);
		close(conn);
		return cnt;
	}

	public List<CustomerCenter> customerList(int cPage, int numPerPage, String a, String select, String search) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<CustomerCenter> list = null;
		if (select.equals("ALL")) {
			list = aa.customerList(conn, cPage, numPerPage, a, search);
		} else {
			list = aa.customerList(conn, cPage, numPerPage, a, select, search);
		}
		close(conn);
		return list;
	}

	public int customerListCount(String a, String select, String search) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = 0;
		if (select.equals("ALL")) {
			System.out.println("서비스 ALL분기");
			cnt = aa.customerListCount(conn, a, search);
		} else {
			System.out.println("서비스 ALL 아님");
			cnt = aa.customerListCount(conn, a, select, search);
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

	public int memberInfoListCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = aa.memberInfoListCount(conn);
		close(conn);
		return cnt;
	}

	public List<AdminMem> memberInfoSearchList(int cPage, int numPerPage, String ra, String select, String search,
			String c) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<AdminMem> list = null;

		if (!select.equals("ALL")) {
			list = aa.memberInfoSearchList(conn, cPage, numPerPage, ra, select, search, c);
		} else {
			list = aa.memberInfoAllSearchList(conn, cPage, numPerPage, ra, select, search, c);
		}
		close(conn);
		return list;
	}

	public int memberInfoSearchListCount(String ra, String select, String search, String c) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = 0;
		if (!select.equals("ALL")) {
			cnt = aa.memberInfoSearchListCount(conn, ra, select, search, c);
		} else {
			cnt = aa.memberInfoAllSearchListCount(conn, ra, select, search, c);
		}
		close(conn);
		return cnt;
	}

	public List<AdminBoard> boardInfoList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<AdminBoard> list = aa.boardInfoList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int boardInfoListCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = aa.boardInfoListCount(conn);
		close(conn);
		return cnt;
	}

	public List<AdminBoard> boardInfoSearchList(int cPage, int numPerPage, String ra, String select, String search, String select2, String select3, String p) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<AdminBoard> list = null;
		if (!select.equals("ALL")) {
			list = aa.boardInfoSearchList(conn, cPage, numPerPage, ra, select, search, select2, select3, p);
		} else {
			//list = aa.boardInfoAllSearchList(conn, cPage, numPerPage, ra, select, search, select2, select3, p);
		}
		close(conn);
		return list;
	}

	public int boardInfoSearchListCount(String ra, String select, String search, String select2, String select3,
			String p) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = 0;
		if (!select.equals("ALL")) {
			cnt = aa.boardInfoSearchListCount(conn,ra, select, search, select2, select3, p);
		} else {
			//cnt = aa.boardInfoAllSearchListCount(conn,ra, select, search, select2, select3, p);
		}
		close(conn);
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
