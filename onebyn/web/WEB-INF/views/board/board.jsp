<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ include file="/WEB-INF/views/common/header.jsp" %>



	<div class="container">
		<div class="form-group">
			<h1> NOTITLE </h1>
			<ul class="nav justify-content-end">
			  <li class="nav-item">
			  <c:if test="${m.memberId == 'ADMIN'}">
				<a class="btn btn-primary btn-lg" href="<%=application.getContextPath()%>/writenotice.do">게시글 작성!</a>
			  </c:if>
			  </li>
			</ul>
			</div>
		<div class="row">


			<c:forEach var="n" items="${list}" varStatus="st">
				<div class="col-md-4 mb-5">
					<div class="card h-100">

						<img class="card-img-top" src="<%= application.getContextPath() %>/${n.files}" alt="" width="460px" height="460px">
						
						<div class="card-body">
							<h4 class="card-title">${n.boardTitle}</h4>
							<p class="card-text">${n.content}</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-success">나도 N빵하기!</a>
						</div>
						<!--  <p>!${n.files}!<br>!${noimg}!<br>!${empty(n.files)}!<br>!${!empty(n.files)}!</p>-->
					</div>
				</div>
			</c:forEach>
			
			
		</div>
	</div>





	<c:set var="page" value="${(empty param.p)?1:param.p}" />
	<c:set var="start" value="${page - (page - 1)%5}" />
	<fmt:parseNumber var="end" value="${Math.ceil(cnt/9)}" integerOnly="true"/>

	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

		<div class="btn-group mr-1" role="group">
			<c:if test="${start > 1}">
				<a type="button" href="?p=${start-1}" class="btn btn-secondary"><</a>
			</c:if>
			<c:if test="${start <= 1}">
				<a type="button" onclick="alert('페이지가 없다!');" class="btn btn-secondary"><</a>
			</c:if>
		</div>
		<div class="btn-group mr-1" role="group">
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${(start+i) <= end}">
					<a type="button" href="?p=${start+i}" class="btn btn-secondary ${(page==(start+i))?'curpage':''}">${start+i}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="btn-group mr-1" role="group">
			<c:if test="${start < end-4}">
				<a type="button" href="?p=${start+5}" class="btn btn-secondary">></a>
			</c:if>
			<c:if test="${start >= end-4}">
				<a type="button" onclick="alert('페이지가 없다!');" class="btn btn-secondary">></a>
			</c:if>
		</div>


	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
