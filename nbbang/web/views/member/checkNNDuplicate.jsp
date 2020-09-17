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
<title>닉네임 중복검사</title>
<style>
	div#checknn-container{text-align:center;padding-top:50px;}
</style>
</head>
<body>
	<div id="checknn-container">
		<%if(m==null) {%>
			[<span><%=request.getParameter("nick") %></span>]은(는)<br>사용 가능한 닉네임입니다.	
			<br><br>
			<button type="button" onclick="setNickname();">닫기</button>
		<%} else{%>
			사용중인 닉네임입니다.
			<br><br>
			<form action="<%=request.getContextPath() %>/checkNNDuplicate" method="post">
				<input type="text" name="nick" id="nick"  maxlength="10">
				<input type="submit" value="중복검사" onclick="return fn_validate();">
			</form>
		<%} %>
	</div>
	<script>
		function fn_validate(){
			let nn=document.getElementById("nick").value;
			if(nn.length>10){
				alert("10자 이하의 한글, 영문, 숫자입력이 가능합니다.");
				document.getElementById("nick").focus();
				return false;
			}
		}
		function setNickname(){
			const nn='<%=request.getParameter("nick")%>';
			opener.memberEnrollFrm.nick.value=nn;
			close();
		}
	</script>
</body>
</html>