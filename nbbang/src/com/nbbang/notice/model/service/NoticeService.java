package com.nbbang.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.nbbang.notice.model.dao.NoticeDAO;
import com.nbbang.notice.model.vo.Notice;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.rollback;
public class NoticeService {

	private NoticeDAO dao=new NoticeDAO();
	
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Notice> list=dao.selectNoticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int count=dao.selectNoticeCount(conn);
		close(conn);
		return count;
	}

	public Notice picNotice(int no) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		Notice n=dao.picNotice(conn,no);
		close(conn);
		return n;
	}

}
