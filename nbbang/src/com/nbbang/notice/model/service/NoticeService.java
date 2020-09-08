package com.nbbang.notice.model.service;

import java.sql.Connection;
import java.util.List;
import static com.nbbang.common.temp.JDBCTemplate.getConnection;
import static com.nbbang.common.temp.JDBCTemplate.close;
import static com.nbbang.common.temp.JDBCTemplate.commit;
import static com.nbbang.common.temp.JDBCTemplate.rollback;
import com.nbbang.notice.model.dao.NoticeDao;
import com.nbbang.notice.model.vo.Notice;

public class NoticeService {

	private NoticeDao dao=new NoticeDao();
	
	public List<Notice> selectNoticeList(int cPage,int numPerPage){
		
		Connection conn=getConnection();
		List<Notice> list=dao.selectNoticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectNoticeCount() {
		Connection conn=getConnection();
		int count=dao.selectNoticeCount(conn);
		close(conn);
		return count;
	}

	public Notice selectNoticeOne(int no) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		Notice n=dao.selectNoticeOne(conn,no);
		close(conn);
		return n;
	}



	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int result=dao.insertNotice(conn, n);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
