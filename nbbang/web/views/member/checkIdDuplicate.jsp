<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("result");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<style>
	div#checkId-container{text-align:center;padding-top:50px;}
	span#duplicated{color:red;font-weight:bolder;}
</style>
</head>
<body>
	<div id="checkId-container">
		<%if(m==null) {%>
			[<span><%=request.getParameter("id") %></span>]는 사용 가능한 이메일입니다.	
			<br><br>
			<button type="button" onclick="setMemberId();">닫기</button>
		<%} else{%>
			사용중인 이메일입니다.
			<br><br>
			<form action="<%=request.getContextPath() %>/checkIdDuplicate" method="post">
				<input type="text" name="userId" id="userId">
				<input type="submit" value="중복검사" onclick="return fn_validate();">
			</form>
		<%} %>
	</div>
	<script>
		function fn_validate(){
			let id=document.getElementById("userId").value;
			if(id.trim().length<4){
				alert("아이디는 4글자 이상 입력하세요!");
				document.getElementById("userId").focus();
				return false;
			}
		}
		function setUserId(){
			const id='<%=request.getParameter("userId")%>';
			opener.memberEnrollFrm.userId.value=id;
			opener.memberEnrollFrm.password.focus();
			close();
		}
	</script>
</body>
</html>










