<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member"%>

<%
	 Member m=(Member)request.getAttribute("findMemberPw");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	/* 아이디 비번 찾기 */
	div#findPwContainer{
 		width: 550px;
 		height:547px;
		background-image: url("<%=request.getContextPath()%>/images/rememberBread.png");
		background-size: 101%;
		position: absolute;
	    background-repeat: no-repeat;
	    top:0;
	    left:0;
	    bottom:0;
	    right:0;
	}
	
	#findPwField{
		position: relative;
		width: 50%;
		text-align: center;
		margin: 150px 40px 100px 150px;
	}
	
	#findPwField p{
		font-size: 30px;
		font-family: 'Do Hyeon', sans-serif;
		margin:15px;
	}
	
	#findPwField input{
		font-size: 20px;
		font-family: 'Do Hyeon', sans-serif;
		width:90%;
	}
	
	#findPwField #findPwbtn{
		border: none;
		border-radius: 10px;
		background-color: gold;
	}
	#resultField{
		position: relative;
		width:50%;
		text-align: center;
		margin: 240px 50px 100px 150px;
	}
	#resultField p{
		font-size: 30px;
		font-family: 'Do Hyeon', sans-serif;
	}
</style>
</head>
<body>
	<div id="findPwContainer">
		<%if(m==null) {%>
		<table id="findPwField">
			<form action="<%=request.getContextPath()%>/findPw" method="post">
			<tr>
				<td>
					<p>비밀번호 찾기^ㅇ^</p>
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
					<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="비밀번호 찾기" onclick="return fn_validate()" id="findPwbtn">
				</td>
			</tr>
		</table>
		<%} else{%>
		<div id="resultField">
					<p>회원님의 비밀번호는<br>[<%=m.getMemberPwd() %>]입니다.</p>
				</div>
		<%} %>
		</form>
	</div>
	<script>
		function fn_validate() {
			let name=document.getElementById("memberName").value;
			let email=document.getElementById("email").value;
			let memberId=document.getElementById("memberId").value;
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
			if(memberId.trim().length<1){
				alert("아이디를 입력해주세요");
				document.getElementById("memberId").focus();
				return false;
			}
		}
	</script>
</body>
</html>