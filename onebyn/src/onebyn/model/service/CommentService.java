package onebyn.model.service;

import static onebyn.common.JDBCtem.*;

import java.sql.Connection;
import java.util.List;

import onebyn.model.dao.CommentDao;
import onebyn.model.vo.Comment;

public class CommentService {

	public void addComment(Comment c) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		CommentDao cd = new CommentDao();
		cd.addComment(conn, c);
		close(conn);
	}

	public List<Comment> getComment(String parameter) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		CommentDao cd = new CommentDao();
		List<Comment> list = cd.getComment(conn, parameter);
		close(conn);
		return list;
	}

}
