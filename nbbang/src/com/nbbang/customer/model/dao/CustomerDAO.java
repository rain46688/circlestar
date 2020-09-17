package com.nbbang.customer.model.dao;

import java.io.FileReader;
import java.util.Properties;

import com.nbbang.board.model.dao.BoardDao;

public class CustomerDAO {

	private Properties prop = new Properties();
	
	public CustomerDAO() {
		// TODO Auto-generated constructor stub
		String filePath = BoardDao.class.getResource("/sql/customer/customer.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
