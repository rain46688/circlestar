package onebyn.service;

import static onebyn.common.JDBCtem.*;
import java.sql.Connection;
import javax.servlet.ServletContext;
import onebyn.model.dao.LoginDao;
import onebyn.model.vo.Member;

public class LoginService {
	

	public Member loginUser(ServletContext servletContext, String id, String pw) {
		// TODO Auto-generated method stub
		Connection conn = getConnection(servletContext);
		LoginDao ld = new LoginDao(servletContext);
		Member m = ld.loginUser(conn,id,pw);
		close(conn);
		return m;
	}

}
