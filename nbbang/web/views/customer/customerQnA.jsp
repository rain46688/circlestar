<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<% 
Member loginedMember = new Member(); //세션저장용

List<CustomerCenter> list = (List) request.getAttribute("list");
CustomerCenter c=(CustomerCenter)request.getAttribute("cc");
loginedMember = (Member)session.getAttribute("loginnedMember");
System.out.println("loginedMem in jsp: "+ loginedMember);
System.out.println("list in jsp: "+ list);

 int loginedId = loginnedMember.getUsid(); //로그인한 멤버 아이디?usId가 먼지 모르겟음
 System.out.println("loginedId in jsp: "+ loginedId); 
 
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/main.css" type="text/css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cstmcss/qnalist.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap"
	rel="stylesheet">

	
	
	
	
	<section class="qnaSection">

		<jsp:include page="maincss.jsp"></jsp:include>

	<div class="qna-caution">
		<ul class="ul-caution">
			<li class="caution-li caution-first ">1:1문의</li>
			<li class="caution-li caution-c">- 전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용될 위험이 있습니다.</li>
				<li class="caution-li caution-c">- 문의 시 입력하지 않도록 주의해 주시기
					바랍니다.</li>
			</ul>
		</div>
	<div class="coustomer-news">
		<table class="table table-striped">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>문의날짜</th>
					
				</tr>
				
				
				<%
					for(CustomerCenter cc : list) { %>
 
						<tr>
					<td> <%=cc.getCsId()%> </td>
					<td>
					
					<%=cc.getCsType()%></td>
				
					<td>
						
						<a href="<%=request.getContextPath()%>/customer/customerReadFrm?num=<%=cc.getCsId() %>">
							<%=cc.getCsTitle()%> 
						</a>
							
						</td>
						
						<td><%=cc.getCsNickname()%></td>
			
						<td><%=cc.getCsDate()%></td> 
						
					</tr>
					<%
				}
					
			%>
			
		</thead>
	</table>
			<div id="btn-news1">
				
				<a type="button" href="<%=request.getContextPath() %>/customer/customerQnAFrm?nick=<%=loginnedMember.getNickname() %>"
					 class="btn-default">문의하기</a>
			
			</div>
	<!-- <div id="pagebar">
		<a><%=request.getAttribute("pageBar")%></a>
	</div> -->



	<script>
		function openWindowPop(url, name) {
			var options = 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no';
			window.open(url, name, options);
		}

	</script>


</section>

<%@ include file="/views/common/footer.jsp"%>