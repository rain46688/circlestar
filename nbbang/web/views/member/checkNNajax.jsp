<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member checkNN=(Member)request.getAttribute("checkNN");
%>
<%if(checkNN!=null) {%>
사용 중인 닉네임입니다.
<input type="hidden" id="checkNNhidden" value="existed">
<%}%>
