<%@page import="com.nbbang.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<Member> list = (List<Member>) request.getAttribute("members");
String type = request.getParameter("searchType");
String keyword = request.getParameter("searchkeyword");
String line = request.getParameter("line");
String cPage = request.getParameter("cPage");
%>

<%@ include file="/views/common/header.jsp"%>
<section id="memberList-container">
	<h2>회원관리</h2>
	<div id="search-container">
		검색타입 :
		<select id="searchType">
			<option value="userId" <%=type != null && type.equals("userId") ? "selected" : ""%>>아이디</option>
			<option value="userName" <%=type != null && type.equals("userName") ? "selected" : ""%>>이름</option>
			<option value="gender" <%=type != null && type.equals("gender") ? "selected" : ""%>>성별</option>
		</select>

		<div id="search-userId">
			<form action="<%=request.getContextPath()%>/admin/memberSearch">
				<input type="hidden" name="searchType" value="userId"> <input type="text" name="searchkeyword" size="25" placeholder="검색할 아이디를 입력하세요" value="<%=type != null && type.equals("userId") ? keyword : ""%>">
				<button type="submit">검색</button>
			</form>
		</div>

		<div id="search-userName">
			<form action="<%=request.getContextPath()%>/admin/memberSearch">
				<input type="hidden" name="searchType" value="userName"> <input type="text" name="searchkeyword" size="25" placeholder="검색할 이름을 입력하세요" value="<%=type != null && type.equals("userName") ? keyword : ""%>">
				<button type="submit">검색</button>
			</form>
		</div>

		<div id="search-gender">
			<form action="<%=request.getContextPath()%>/admin/memberSearch">
				<input type="hidden" name="searchType" value="gender"> <label><input type="radio" name="searchkeyword" value="M" <%=type != null && type.equals("gender") && keyword.equals("M") ? "checked" : ""%>>남</label> <label><input type="radio" name="searchkeyword" value="F" <%=type != null && type.equals("gender") && keyword.equals("F") ? "checked" : ""%>>여</label>
				<button type="submit">검색</button>
			</form>
		</div>
	</div>


	<div id="numPerpage-container">
		<form id="numperPageFrm" name="numperPageFrm">
			페이지당 회원 수 : <input type="hidden" name="cPage" value='<%=request.getParameter("cPage")%>'>
			<select id="lineselect">
				<option value="5" <%=line != null && line.equals("5") ? "selected" : ""%>>5개</option>
				<option value="3" <%=line != null && line.equals("3") ? "selected" : ""%>>3개</option>
				<option value="10" <%=line != null && line.equals("10") ? "selected" : ""%>>10개</option>
			</select>
		</form>

	</div>


	<table id="tbl-member">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
		</thead>
		<%
			for (Member m : list) {
		%>
		<tr>
			<td>
				<a href="<%=request.getContextPath()%>/admin/memStatusPage?uid=<%=m.getMemberId()%>"><%=m.getMemberId()%></a>
			</td>
			<td><%=m.getMemberName()%></td>
			<td><%=m.getNickname()%></td>
			<td><%=m.getEmail()%></td>
			<td><%=m.getPhone()%></td>
			<td><%=m.getAddress()%></td>
			<td><%=m.getEnrollDate()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
</section>

<script>
		$(function(){
			/* select가 변경될때 */
			$("#searchType").change( e => {
				
				/* alert("select변경"); */
				let userId=$("#search-userId");
				let userName=$("#search-userName");
				let gender=$("#search-gender");
				userId.css("display","none");
				userName.css("display","none");
				gender.css("display","none");
				/* 첨부터 전부 none으로 바꿔버림 */
				
				let value = $(e.target).val();//userId,userName,gender
				$("#search-"+value).css("display","inline-block");
			});
			$("#searchType").change();
			
			
	$("#lineselect").change(e=>{
				let type='<%=type%>';
				let key='<%=keyword%>';
				//console.log(type);
				//console.log(key);
				
				if(key == 'null' && type == 'null'){
					//console.log('둘다 null');
					//console.log('눌린 숫자 : '+$(e.target).val());
					location.replace('<%=request.getContextPath()%>/admin/memberList?cPage=<%=cPage%>&line='+$(e.target).val());
				}else{
					//console.log('둘다 null 아님');
					//console.log('눌린 숫자 : '+$(e.target).val());
					location.replace('<%=request.getContextPath()%>/admin/memberSearch?cPage=<%=cPage%>&searchType=<%=type%>&searchkeyword=<%=keyword%>&line='+$(e.target).val());
				}
			});
		
		
			
		})
</script>

<%@ include file="/views/common/footer.jsp"%>