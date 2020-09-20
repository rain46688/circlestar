package com.nbbang.customer.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.nbbang.board.model.dao.BoardDao;
import com.nbbang.customer.model.vo.CustomerCenter;

public class CustomerDAO {

	private Properties prop = new Properties();

	public CustomerDAO() {
		// TODO Auto-generated constructor stub
		String filePath = CustomerDAO.class.getResource("/sql/customer/customer.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<CustomerCenter> qnAList(Connection conn, int cPage, int numPerPage) {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CustomerCenter> list = new ArrayList();

		try {
			pstmt = conn.prepareStatement(prop.getProperty("qnAList"));
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CustomerCenter cc = new CustomerCenter();
				cc.setCsNo(rs.getInt("cs_id"));
				cc.setCsWriter(rs.getString("cs_writer_usid"));
				cc.setCsType(rs.getString("cs_tpye"));
				cc.setCsTitle(rs.getString("cs_title"));
				cc.setCsContent(rs.getString("cs_content"));
				cc.setCsDate(rs.getDate("cs_date"));
				cc.setCsFile(rs.getString("cs_file"));
				list.add(cc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	public int qnACount(Connection conn) {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("qnaCount"));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int insertQna(Connection conn, CustomerCenter c) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertQnA"));
			pstmt.setInt(1, Integer.parseInt(c.getCsWriter()));
			pstmt.setString(2, c.getCsType());
			pstmt.setString(3, c.getCsTitle());
			pstmt.setString(4, c.getCsContent());
			pstmt.setString(5, c.getCsFile());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



}
