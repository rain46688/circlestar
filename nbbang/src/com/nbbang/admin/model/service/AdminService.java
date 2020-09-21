package com.nbbang.admin.model.service;

import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbbang.admin.model.dao.AdminDao;
import com.nbbang.customer.model.vo.CustomerCenter;

public class AdminService {
	private AdminDao aa = new AdminDao();

	public List<CustomerCenter> customerList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<CustomerCenter> list = aa.customerList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int customerListCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt = aa.customerListCount(conn);
		close(conn);
		return cnt;
	}

//	public List<Member> selectMemberSearch(String type, String keyword, int cPage, int numPerPage) {
//		// TODO Auto-generated method stub
//		Connection conn = getConnection();
//		List<Member> list = dao.selectMemberSearch(conn, type, keyword, cPage, numPerPage);
//		close(conn);
//		return list;
//	}
//
//
//
//	public int selectMemberSearchCount(String type, String keyword) {
//		// TODO Auto-generated method stub
//		Connection conn = getConnection();
//		int cnt = dao.selectMemberSearchCount(conn, type, keyword);
//		close(conn);
//		return cnt;
//	}
//
//	public Member memstatuspage(String userid) {
//		// TODO Auto-generated method stub
//		Connection conn = getConnection();
//		Member m = dao.memstatuspage(conn, userid);
//		close(conn);
//		return m;
//	}

}
