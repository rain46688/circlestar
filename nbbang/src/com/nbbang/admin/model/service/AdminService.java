package com.nbbang.admin.model.service;

import java.sql.Connection;
import java.util.List;
import static com.nbbang.common.temp.JDBCTemplate.*;
import com.nbbang.admin.model.dao.AdminDao;
import com.nbbang.member.model.vo.Member;

public class AdminService {
	private AdminDao dao = new AdminDao();

	public List<Member> selectMemberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public List<Member> selectMemberSearch(String type, String keyword, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberSearch(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectMemberCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt =  dao.selectMemberCount(conn);
		close(conn);
		return cnt;
	}

	public int selectMemberSearchCount(String type, String keyword) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int cnt =  dao.selectMemberSearchCount(conn,type,keyword);
		close(conn);
		return cnt;
	}
	
	public Member memstatuspage(String userid) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Member m = dao.memstatuspage(conn,userid);
		close(conn);
		return m;
	}
	
}
