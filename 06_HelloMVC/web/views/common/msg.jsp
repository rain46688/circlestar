<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
%>
</head>
<body>
	<script>
		//alert(msg);//이렇게 하면 msg에 내용을 변수로 인식해서 에러를 발생시킴
		//javascript에서 java문자열을 출력할때는 '', ""을 반드시 해줘야함.
		//알람메세지띄우기
		alert("<%=msg%>");
		//페이지이동
		location.replace('<%=request.getContextPath()%><%=loc%>');
	</script>
</body>
</html>







