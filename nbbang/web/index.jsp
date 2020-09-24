<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<style>
	#cards-wrapper {
		width: 100%;
		background-color: #ecaf59;
		text-align: center;
	}
	#cards-nav {
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
	#cards-nav>ul {
		list-style: none;
		margin: 0 auto;

	}
	#cards-nav>ul>li {
		display: inline-block;
		padding: 0 auto;
		margin-right: -3px;
		margin-left: -3px;
		margin-bottom: -2px;
		border: 1.5px black solid;
		border-bottom: 2px white solid;
	}
	#cards-nav div {
		width: 10em;
		height: 10em;
		font-size: 26px;
		font-family: 'Do Hyeon', sans-serif;
		padding: 0 auto;
	}
	#popularBoards {
		background-color: white;

	}

	#cards-nav .contentBlock {
		padding-top: 3.5em;
		width: 100%;
		height: 30px;
	}

	#recentBoards {
		background-color: bisque;
	}

	#specialBoards {
		background-color: burlywood;
	}
	#contentWrapper {
		width: 100%;
		border-top: 1.5px black solid;
		background-color: white;
	}
	#contentPosition {
		width: 80em;
		margin: 0 auto;

		text-align: left;
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
					<div class="contentBlock">
					<img src="images/popular.png" alt="" width="60px" height="60px">
					<p>인기게시물</p>
					</div>
				</div></li>
				<li><div id="recentBoards">
					<div class="contentBlock">
						<img src="images/recent.png" alt="" width="60px" height="60px">
						<p>최신게시물</p>
						</div>
				</div></li>
				<li><div id="specialBoards">
					<div class="contentBlock">
						<img src="images/special.png" alt="" width="60px" height="60px">
						<p>특가</p>
						</div>
				</div></li>
			</ul>
		</div>
		<div id="contentWrapper">
			<div id="contentPosition">
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
				  <div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
					  <h5 class="card-title">Card title</h5>
					  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				  </div>
			</div>
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