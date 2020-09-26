<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member checkPN=(Member)request.getAttribute("checkPN");
%>
<%if(checkPN!=null) {%>
사용 중인 전화번호입니다.
<input type="hidden" id="checkPNhidden" value="existed">
<%}%>
