package onebyn.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCtem {
	
	// getconnection
	
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties();
		try {
			String fileName =JDBCtem.class.getResource("/onebyn/driver/driver.properties").getPath();
			prop.load(new FileReader(fileName));
			String driver = prop.getProperty("driver");
			Class.forName(driver);
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			conn = DriverManager.getConnection(url,user,password);
			conn.setAutoCommit(false);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// connection close
	
	public static void close(Connection conn) {
			try {
			if(conn != null && !conn.isClosed())	
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	// statement close

	public static void close(Statement pst) {
		try {
		if(pst != null && !pst.isClosed())
			pst.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// resultset close
	
	public static void close(ResultSet rs) {
		
		try {
		if(rs != null && !rs.isClosed())
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// commit
	
	public static void commit(Connection conn) {
		try {
		if(conn != null && !conn.isClosed())
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// rollback

	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
