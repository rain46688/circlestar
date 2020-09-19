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
<title>휴대폰 번호 중복검사</title>
<style>
	div#checkPn-container{text-align:center;padding-top:50px;}
</style>
</head>
<body>
	<div id="checkPn-container">
		<%if(m==null) {%>
			[<span><%=request.getParameter("phone") %></span>]은(는)<br>사용 가능한 전화번호입니다.	
			<br><br>
			<button type="button" onclick="setPhone();">사용하기</button>
		<%} else{%>
			사용중인 전화번호입니다.
			<br><br>
			<form action="<%=request.getContextPath() %>/checkPNDuplicate" method="post">
				<input type="text" name="phone" id="phone">
				<input type="submit" value="중복검사" onclick="return fn_validate();">
			</form>
		<%} %>
	</div>
	<script>
		function fn_validate(){
			let pn=document.getElementById("phone").value;
			if(pn.length==0 || pn.length>11){
				alert("-를 제외하고 11자 이하로 입력해주세요.");
				document.getElementById("phone").focus();
				return false;
			}
		}
		function setPhone(){
			const pn='<%=request.getParameter("phone")%>';
			opener.memberEnrollFrm.phone.value=pn;
			opener.memberEnrollFrm.checked_pn.value='y';
			close();
		}
	</script>
</body>
</html>










