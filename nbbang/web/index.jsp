<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<style>
	#cards-wrapper {
		background-color: #ecaf59;
	}
	#cards-nav {
		border: 1px red solid;
		margin: 0 auto;
		text-align: center;
	}
	#cards-nav>ul {
		list-style: none;
		border: 1px red solid;
		margin: 0 auto;
	}
	#card-nav>ul>li {

		float: left;
	}
</style>

<section>

	<div id="carouselField" name="carouselField">
		<div id="carouselNB" class="carousel slide carouselInhee" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselInhee" data-slide-to="0" class="active"></li>
				<li data-target="#carouselInhee" data-slide-to="1"></li>
				<li data-target="#carouselInhee" data-slide-to="2"></li>
				<li data-target="#carouselInhee" data-slide-to="3"></li>
				<li data-target="#carouselInhee" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img src="<%=request.getContextPath()%>/images/main1.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/main2.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/main3.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/main4.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/main5.jpg"
						class="d-block w-100" alt="...">
				</div>
			</div>

			<a class="carousel-control-prev" href="#carouselNB" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> 
			<a class="carousel-control-next" href="#carouselNB" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<div id="cards-wrapper">
		<div id="cards-nav">
			<ul>
				<li><div id="popularBoards">
					인기 게시물
				</div></li>
				<li><div id="recentBoards">
					최신 게시물
				</div></li>
				<li><div id="specialBoards">
					특가
				</div></li>
			</ul>
		</div>
	</div>
	<script>
		$(function() {
			$('.carouselInhee').carousel({
				interval : 5000,
				pause : "hover",
				wrap : true,
				keyboard : true
			});
		});
	</script>
</section>
<%@ include file="/views/common/footer.jsp"%>

<!--

Member

매핑값							jsp파일

/member/memLogin		login.jsp
/member/memEnroll		enroll.jsp
/member/memLogout.lo	logout.jsp
/member/memModify.lo	modify.jsp
/member/memDelete.lo	delete.jsp
/member/memMyPage.lo	mypage.jsp


Board

매핑값							jsp파일

/board/boList		bolist.jsp
/board/boPage.lo		bopage.jsp
/board/boEnroll.lo		enroll.jsp
/board/boDelete.lo		delete.jsp
/board/boModify.lo		modify.jsp
/board/comAdd.lo		add.jsp
/board/comDelete.lo	codelete.jsp
/board/comModify.lo	comodify.jsp

-->