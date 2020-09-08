<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
<%
	String msg = (String)request.getAttribute("msg");
	String loc = (String)request.getAttribute("loc");

%>

</head>
<body>

<script>


		alert('<%=msg%>');
		location.replace('<%=request.getContextPath()+loc%>');
		
		
</script>


</body>
</html>