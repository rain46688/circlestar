<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<style>
#fontBold{font-weight:bold;}
</style>
<section id="customerMain-container">

			    <div id="kdh-container">
      <div id="kdh-header">
      	
      	
        <h1>NBBANG에 오신것을 환영합니다.</h1>
      	
      </div>
      <div id="kdh-sidebar-left">
        <h2>ㅎㅇ</h2>
        <ul>
 					<li class="cstmt-list" style="font-size:20px;" id="fontBold"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>
        </ul>
        <ul>
        	<li class="list-hiper"><a href="" class="hiper-tag">홈</a></li>
        	<li class="list-hiper"><a href="" class="hiper-tag">구경하기</a></li>
        	<li class="list-hiper"><a href="" class="hiper-tag">해외직구</a></li>
        	<li class="list-hiper"><a href="" class="hiper-tag">마이페이지</a></li>
        </ul>
        <ul>
        	<li id="list-image1"><a href=""><image src="<%=request.getContextPath()%>/images/we.png" width="190px" height="55px"></a></li>
        	<li id="list-image2"><a href=""><image src="<%=request.getContextPath()%>/images/pang.png" width="190px" height="55px"></a></li>
        	<li id="list-image3"><a href=""><image src="<%=request.getContextPath()%>/images/llist1.png" width="205px" height="60px"></a></li>
        
        </ul>
      </div>
      <div id="kdh-content1">
        
        <p>Main Content</p>
        

       </div>
    </div>
    	
        <a href="" id="content-image"><img alt="하이퍼링크" src="<%=request.getContextPath() %>/images/1234.jpg" >
    	</a>
    <div id="kdh-content2">
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>