<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<style>
#fontBold{font-weight:bold;}
</style>
<section id="customerMain-container">

			    <div id="kdh-container">
      <div id="kdh-header">
        <h1>NBBANG에 오신것을 환영합니다.^^</h1>
      </div>
      <div id="kdh-sidebar-left">
        <h2>사이드</h2>
        <ul>
 					<li class="cstmt-list" style="font-size:20px;" id="fontBold"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>
					<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>
        </ul>
      </div>
       </div>
      <div id="kdh-content1">
        
        <p>Main Content</p>
        

    </div>
    <div id="kdh-content2">
    	
        <p>Sub Content</p>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>