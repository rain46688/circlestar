package onebyn.board.model.service;

import static onebyn.common.JDBCtem.close;
import static onebyn.common.JDBCtem.getConnection;

import java.sql.Connection;
import java.util.List;

import onebyn.board.model.dao.CommentDao;
import onebyn.board.model.vo.Comment;

public class CommentService {
	
	private CommentDao cd = new CommentDao();

	public void addComment(Comment c) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		cd.addComment(conn, c);
		close(conn);
	}

	public List<Comment> getComment(String parameter) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		List<Comment> list = cd.getComment(conn, parameter);
		close(conn);	
		return list;
	}

	public int delComment(String parameter) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = cd.delComment(conn,parameter);
		close(conn);
		return result;
	}

}
