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
</style>
</head>
<body>
	<div id="checkId-container">
		<%if(m==null) {%>
			[<span><%=request.getParameter("userId") %></span>]은(는)<br>사용 가능한 이메일입니다.	
			<br><br>
			<button type="button" onclick="setMemberId();">사용하기</button>
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
			var idPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(id.length==0){
				alert("이메일을 입력해주세요.");
				document.getElementById("userId").focus();
				return false;
			}
			if(id.length!=0&&!idPattern.test(id)){
				alert("이메일 형식을 지켜주세요.");
				document.getElementById("userId").focus();
				return false;
			}
		}
		function setMemberId(){
			const id='<%=request.getParameter("userId")%>';
			opener.memberEnrollFrm.userId.value=id;
			opener.memberEnrollFrm.pw.focus();
			opener.memberEnrollFrm.checked_id.value='y';
			close();
		}
	</script>
</body>
</html>










