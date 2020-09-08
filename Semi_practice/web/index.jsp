<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>

<!-- carousel -->
<div id="carouselField" name="carouselField">
	<div id="carouselInhee" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselInhee" data-slide-to="0" class="active"></li>
			<li data-target="#carouselInhee" data-slide-to="1"></li>
			<li data-target="#carouselInhee" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner"  role="listbox">
			<div class="carousel-item active">
				<img src="<%=request.getContextPath() %>/resources/logoTitle.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath() %>/resources/logoTitle.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath() %>/resources/logoTitle.png" class="d-block w-100" alt="...">
			</div>
		</div>
		
		<a class="carousel-control-prev" href="#carouselInhee" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		
		<a class="carousel-control-next" href="#carouselInhee" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>

<!-- card -->
<div id="hotContents" name="hotContents">
	<h1 id="hotContentsH1" name="hotContentsH1">인기게시물</h1>
	<div class="card" style="width: 18rem;">
	  <img src="<%=request.getContextPath() %>/resources/logo.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </div>
	</div>
</div>
<script>
	$(function(){
		$('#carouselInhee').carousel({
			interval: 1000,
			pause: "hover",
			wrap: true,
			keyboard : true
		});
	});
</script>
</section>
<%@ include file="/views/common/footer.jsp" %>