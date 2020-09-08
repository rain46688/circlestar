
<%@page import="com.nbbang.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
Notice n=(Notice)request.getAttribute("notice");
%>
<section>
<div id="notice-container">

        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><%=n.getNoticeTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=n.getNoticeWriter() %></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           	<%if(n.getFilePath()!=null) {%>
           		<img src="<%=request.getContextPath()%>/images/file.png" width="20" height="20">
           	<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=n.getNoticeContent() %></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="button" value="수정" onclick="">
                <input type="button" value="삭제" onclick="">
            </th>
        </tr>
    </table>
    </div>
</section>
<%@ include file="/views/common/footer.jsp"%>