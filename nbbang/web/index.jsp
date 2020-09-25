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
		margin-left:-2.5em;
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
		width: 8em;
		height: 8em;
		font-size: 26px;
		font-family: 'Do Hyeon', sans-serif;
		padding: 0 auto;
	}
	#popularBoards {
		background-color: white;
	}

	#cards-nav .contentBlock {
		padding-top: 2.35em;
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
		text-align: center;
		padding-left: 5em;
		padding-right: 5em;
		padding-top: 3em;
		text-align: left;
	}

	.card {
	border: 1px white solid;
	}

	.card-title {
	width: 9.5em;
	height: 1em;
	}

	.card-title>p {
	font-size: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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
				<li><div id="popularBoards" style="cursor: pointer;" onclick="fn_main('popular');">
					<div class="contentBlock" >
					<img src="<%=request.getContextPath() %>/images/popular.png" alt="" width="60px" height="60px">
					<p>인기게시물</p>
					</div>
				</div></li>
				<li><div id="recentBoards" style="cursor: pointer;" onclick="fn_main('recent');">
					<div class="contentBlock" >
						<img src="<%=request.getContextPath() %>/images/recent.png" alt="" width="60px" height="60px">
						<p>최신게시물</p>
						</div>
				</div></li>
				<li><div id="specialBoards" style="cursor: pointer;" onclick="fn_main('special');">
					<div class="contentBlock" >
						<img src="<%=request.getContextPath() %>/images/special.png" alt="" width="60px" height="60px">
						<p>특가</p>
						</div>
				</div></li>
			</ul>
		</div>
		<div id="contentWrapper">
			<div id="contentPosition">
				<div class='card' 
					onclick="location.href='<%=request.getContextPath()%>/board/boardPage'"
					style="width: 15rem; cursor: pointer; padding: 0px;">
					<div class="image-wrapper">
					<img src="..." class="card-img-top" alt="...">
					</div>
					<div class="card-body">
						<input type="hidden" value="boardid">
						<h4 class="card-title"><p>타이틀</p></h4>
						<p>주소</p>
						<p id="interest">0 관심 0 조회</p>
						<!-- <h4 class="card-price"><fmt:formatNumber type="number" maxFractionDigits="3" value=""></fmt:formatNumber>원</h4> -->
					</div>
				  </div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		fn_main('popular');
	})
    function fn_main(key) {
        $.ajax({
            url: "<%=request.getContextPath()%>/mainView",
            type: "post",
            dataType: "json",
            data: {
                'function': key
            },
            success: function (data) {
                let html = "";
				$.each(data, function(index, item){
					html += "<div class='card' ";
					html += "onclick=\"location.href='<%=request.getContextPath()%>/board/boardPage?boardId=&writerUsid= %>'\"";
					html += "style=\"width: 15rem; cursor: pointer; padding: 0px;\">";
					html += "<div class=\"image-wrapper\">";
					html += "<img src=\"<%= request.getContextPath() %>/upload/images/" + item.cardFile.fileName[0] +"\" class=\"card-img-top\" alt=\"...\" width=\"120em\" height=\"200em\">";
					html += "</div>";
					html += "<div class=\"card-body\">";
					html += "<input type=\"hidden\" value=\"boardid\">";
					html += "<h4 class=\"card-title\"><p>" + item.cardBoard.boardTitle + "</p></h4>";
					html += "<p>" + item.cardBoard.tradeArea + "<p>";
					html += "<p id='interest'> 관심" + item.cardBoard.likeCount + "조회" + item.cardBoard.hit +"</p>";
					html += "<h4 class='card-price'>" + item.cardBoard.productPrice + "원<h4>";
					html += "</div></div>";
				})
				$("#contentPosition").html(html);
				if(key!="popular") {
				var location = document.querySelector("#popularBoards").offsetTop;
				window.scrollTo({top:location, behavior:'smooth'});
				}
            }
        })
    }

    $(function () {
        $('.carouselInhee').carousel(
            {interval: 5000, pause: "hover", wrap: true, keyboard: true}
        );
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