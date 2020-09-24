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
	
	public List<Notice> noticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Notice> list=dao.noticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int noticeListCount() {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int count=dao.noticeListCount(conn);
		close(conn);
		return count;
	}


}
