<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/tradeboard.css" rel="stylesheet">



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


<div class="container" id="boardtrade">
	<div class="row">
		<div class="col-10">

			<div id="writecontainer">
				<h2 class="display-4">제목</h2>
				<p class="lead">작성자 : admin</p>
				<p class="lead">작성 날짜 : 2020-09-05 <span style="float: right;">조회수 : 1</span></p>
				<hr class="my-4">
				<p class="lead">제품 카테고리 : 특가</p>
				<p class="lead">제품 이름 : 오 그레놀라</p>
				<p class="lead">거래지역 : 강동구 상일동 상일역앞</p>
				<p class="lead">제품 가격 : 50,000원</p>
				<p class="lead">제품 보유 상태 : 구매예정</p>
				<hr class="my-4">

				<div id="content">
						ㅋㅌㅊㅌㅋㅊ
				</div>

				<div id="writecontainer">
					<div class="status-upload">
						<h4>댓글</h4>
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
					<div id="comment">
							<br>
							작성되어있는 댓글 없음.
							<hr>
					</div>
			</div>
		</div>


		<div class="col-2">
			<div class="sidebar">
				<div class="sticky">
					<div id="side"><h2>사이드바</h2></div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>