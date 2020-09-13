<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<% 
	Board b = (Board)request.getAttribute("curBoard");
%>
<style>

	section {
	 	text-align:center;
		display:inline-block;
	}
	
	#carouselJackson {
		width:50em;
	}
	
	.carousel-inner img {
		margin:0 auto;
	}
</style>
<section>
<div id="carouselJackson" class="carousel slide" data-ride="carousel" data-interval="false">
  <ol class="carousel-indicators center-block">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%= request.getContextPath() %>/resources/cute.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</section>
<script>
	$(function(){
		$('#carouselJackson').carousel({
			interval : 100;
		});
	});
</script>
<%@ include file="/views/common/footer.jsp" %>
