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
	String script=(String)request.getAttribute("script");
%>
</head>
<body>
	<script>
// 		alert(msg); 이렇게 하면 msg를 변수로 인식해서 에러 발생
//js에서 java문자열을 출력할 때는 ''이나 ""를 반드시 해줘야 함
		alert("<%=msg%>");
		//스크립트가 있으면 실행
		if(<%=script!=null%>){
			<%=script%>
		}
		
		//페이지 이동
		location.replace('<%=request.getContextPath()%><%=loc%>');
	</script>
</body>
</html>