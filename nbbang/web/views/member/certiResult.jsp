<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String certiKey=(String)request.getSession().getAttribute("certiKey");%>
<input type="hidden" id="certiKey" value="<%=certiKey%>">