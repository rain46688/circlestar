package com.servlet.model.sevice;

import java.sql.Connection;
import java.sql.SQLException;

import com.servlet.common.JDBCTemplate;
import com.servlet.model.dao.ServletDao;
import com.servlet.model.vo.Member;

public class ServletService {
	private ServletDao dao=new ServletDao();
	public Member login(String userId, String password) {
		Connection conn=JDBCTemplate.getConnetion();
		Member m=dao.login(conn,userId,password);
		try {
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}
	public Member signIn(String memberId, String memberPwd, String memberName, String gender, int age, String email, String phone, String address, String hobby) {
		Connection conn=JDBCTemplate.getConnetion();
		Member m=dao.signIn(conn, memberId, memberPwd, memberName, gender, age, email, phone, address, hobby);
		System.out.println(memberId+memberPwd+memberName+gender+age+email+phone+address+hobby);
		try {
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}

}
