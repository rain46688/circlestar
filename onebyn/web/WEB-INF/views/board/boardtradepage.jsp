<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/tradeboard.css" rel="stylesheet">

<div class="container" id="writecontainer">

<!-- 
작성자 아이디
작성 날짜
조회수

- 주 기능 -
카테고리
제품 이름
배송 예정 날짜
거래 지역
게시판 단계 상태 
-->

	<h2 class="display-4">제목</h2>
	<p class="lead">작성자 : admin </p>
	<hr class="my-4">
	<div id="writecontainer">
		<div class="status-upload">
		<h3>댓글</h3>
			<form>
				<textarea placeholder="내용을 입력하세요." class="pb-cmnt-textarea"></textarea>
				<div class="checkbox">
					<input type="checkbox" name="secret" id="secret"> 비밀댓글
				</div>
				<button type="submit" class="btn btn-success green">
					<i class="fa fa-share"></i> 댓글작성
				</button>
			</form>
		</div>
	</div>

</div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>