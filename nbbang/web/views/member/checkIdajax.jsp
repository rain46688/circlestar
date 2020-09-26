<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member checkId=(Member)request.getAttribute("checkId");
%>
<%if(checkId!=null) {%>
이미 사용중이거나 탈퇴한 아이디입니다.
<input type="hidden" id="checkIdhidden" value="existed">
<%}%>
