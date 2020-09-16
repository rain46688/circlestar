<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<% 
	Board b = (Board)request.getAttribute("curBoard");
%>
<style>
  #wrapper {
    margin-top: 3em;
    text-align: center;
    align-items: center;
    margin-bottom: 3em;
    border: solid red;
  }
  #imageWrapper {
    margin-bottom: 2em;
  }
  #imageWrapper>img {
    border-radius: 1em;
  }
  #content {
    margin: 0 auto;
  	/* border: solid green; */
  	width:32em;
  	text-align:left;
  	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    font-size: large;
  }
	/* #carouselJackson {
		width:50em;
	}
	
	.carousel-inner img {
		margin:0 auto;
	} */
</style>
<section>
<!-- <div id="carouselJackson" class="carousel slide" data-ride="carousel" data-interval="false">
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
</div> -->



  <div id="wrapper">
    <div id="imageWrapper">
      <img src="<%= request.getContextPath() %>/resources/cute.png" alt="" width="500em" height="300em">
    </div>
    <div id="content">
    	<hr><a href="">
    	<img src="<%= request.getContextPath() %>/resources/bread.png" alt="" width="40px" height="40px"></a>
    	<%= b.getWriterId() %>
    </div>
  </div>
</section>





<%@ include file="/views/common/footer.jsp" %>
