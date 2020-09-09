<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member"%>

<%
	 Member m=(Member)request.getAttribute("findMember");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="findIdContainer">
		<%if(m==null) {%>
		<table>
			<form action="<%=request.getContextPath()%>/findId" method="post">
			<tr>
				<td>
					<h3>아이디 찾기^ㅇ^</h3>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="memberName" id="memberName" placeholder="이름을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="아이디 찾기" onclick="return fn_validate()">
				</td>
			</tr>
		</table>
		<%} else{%>
		<div>당신의 아이디는 <%=m.getMemberId() %>입니다.</div>
		<%} %>
		</form>
	</div>
	<script>
		function fn_validate() {
			let name=document.getElementById("memberName").value;
			let email=document.getElementById("email").value;
			if(name.trim().length<1){
				alert("이름을 입력해주세요");
				document.getElementById("memberName").focus();
				return false;
			}
			if(email.trim().length<1){
				alert("이메일을 입력해주세요");
				document.getElementById("email").focus();
				return false;
			}
		}
	</script>
</body>
</html>