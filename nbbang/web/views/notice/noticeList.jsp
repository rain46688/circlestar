<%@page import="com.nbbang.notice.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Notice> list=(List)request.getAttribute("list");
%>

<%@ include file="/views/common/header.jsp" %>
	<section id="notice-container">
		<h2>공지사항</h2>
		<table class="table table-striper">
			<thead>
				<tr>
					<th>번호</th>
             		<th>제목</th>
             		<th>작성자</th>
             		<th>첨부파일</th>
             		<th>작성일</th>
				</tr>
			         <%for(Notice n : list) {%>
         
         	<tr>
         		<td><%=n.getNoticeNo() %></td>
         		<td>
         		<a href ="<%=request.getContextPath()%>/notice/noticeView?no=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle() %>
         		</td>
         		<td><%=n.getNoticeWriter() %></td>
         		<td><%if(n.getFilePath()!=null){ %>
         			<img src="<%=request.getContextPath() %>/images/file.png"width="20" height="20">
         		<%} %>
         		</td>
         		<td><%=n.getNoticeDate() %></td>
         	</tr>
		<%} %>
     </table>
     <div id="pageBar">
     	<%=request.getAttribute("pageBar") %>
     </div>
			</thead>
		</table>
		<hr/>
		<button onclick="location.assign('<%=request.getContextPath()%>/notice/noticeWrite')">글쓰기</button>
		
		
		
	</section>
	
	
<%@ include file="/views/common/footer.jsp" %>