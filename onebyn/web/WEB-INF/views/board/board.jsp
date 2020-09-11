<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ include file="/WEB-INF/views/common/header.jsp" %>



	<div class="container">
		<div class="form-group">
			<h1> NOTITLE </h1>
			<ul class="nav justify-content-end">
			  <li class="nav-item">
			  <c:if test="${m.memberId == 'ADMIN'}">
				<a class="btn btn-primary btn-lg" href="<%=request.getContextPath()%>/writenotice.do">게시글 작성!</a>
			  </c:if>
			  </li>
			</ul>
			</div>
		<div class="row">


			<c:forEach var="n" items="${list}" varStatus="st">
				<div class="col-md-4 mb-5">
					<div class="card h-100">

						<img class="card-img-top" src="<%= request.getContextPath() %>/images/${n.files}" alt="" width="460px" height="460px">
						
						<div class="card-body">
							<h4 class="card-title">${n.boardTitle}</h4>
							<p class="card-text">${n.content}</p>
						</div>
						<div class="card-footer">
							<a href="boartrade.do?t=${n.boardId}" class="btn btn-success">나도 N빵하기!</a>
						</div>
						<!--  <p>!${n.files}!<br>!${noimg}!<br>!${empty(n.files)}!<br>!${!empty(n.files)}!</p>-->
					</div>
				</div>
			</c:forEach>
			
			
		</div>
	</div>





	<c:set var="cPage" value="${(empty param.cPage)?1:param.cPage}" />
 	<c:set var="pageNo" value="${cPage - (cPage - 1)%5}"/>
	<fmt:parseNumber var="pageEnd" value="${Math.ceil(totalData/numPerPage)}" integerOnly="true"/>

	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

		<div class="btn-group mr-1" role="group">
			<c:if test="${pageNo > 1}">
				<a type="button" href="?cPage=${pageNo-1}" class="btn btn-secondary"><</a>
			</c:if>
			<c:if test="${pageNo <= 1}">
				<a type="button" onclick="alert('페이지가 없다!');" class="btn btn-secondary"><</a>
			</c:if>
		</div>
		<div class="btn-group mr-1" role="group">
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${(pageNo+i) <= pageEnd}">
					<a type="button" href="?cPage=${pageNo+i}" class="btn btn-secondary ${(cPage==(pageNo+i))?'curpage':''}">${pageNo+i}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="btn-group mr-1" role="group">
			<c:if test="${pageNo < pageEnd-4}">
				<a type="button" href="?cPage=${pageNo+5}" class="btn btn-secondary">></a>
			</c:if>
			<c:if test="${pageNo >= pageEnd-4}">
				<a type="button" onclick="alert('페이지가 없다!');" class="btn btn-secondary">></a>
			</c:if>
		</div>


	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
