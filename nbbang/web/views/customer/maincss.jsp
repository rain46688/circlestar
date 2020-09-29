<%@page import="com.nbbang.member.model.vo.Member"%>
<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Member loginnedMember=(Member)session.getAttribute("loginnedMember");

%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&family=Song+Myung&display=swap"
  rel="stylesheet">


<div id="kdh-container">
  <!-- <div id="kdh-sidebar-container"> -->
    
    <div id="kdh-sidebar-left">
      <div class="sidebarTitle side-bar-kdh">
  
        <li id="kdh-side-Title" style="font-family: 'Do Hyeon', sans-serif;">고객센터</li>
        <li id="kdh-side-text" style="font-family: 'Do Hyeon', sans-serif;">N빵은 고객님의<br><span>궁금증을</span><br>N빵해드립니다.</li>
      </div>

      <%if (loginnedMember==null) {%>
      <!-- <ul class="side-bar-kdh"> -->

        <div class="cstmt-list">
          <a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/customer/customerQnA">문의하기</a></div>
        <div class="cstmt-list"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/notice/noticeList">소식보기</a></div>

        <div class="cstmt-list"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/customerFaq">FAQ</a></div>
            <div class="list-hiper"><a href="<%=request.getContextPath()%>/" class="hiper-tag" style="font-family: 'Do Hyeon', sans-serif;">홈</a>
            </div>

            <div class="list-hiper"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;" href="<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>">마이페이지</a></div>
      <!-- </ul> -->
      <%}%>
      <% if(!loginnedMember.getNickname().equals("ADMIN")) {%>
      <!-- <ul class="side-bar-kdh"> -->

        <div class="cstmt-list">
          <a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/customer/customerQnA?nick=<%=loginnedMember.getNickname()%>">문의하기</a>
        </div>
        <div class="cstmt-list"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/notice/noticeList">소식보기</a></div>
        <div class="cstmt-list"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/customerFaq">FAQ</a></div>
            <div class="list-hiper"><a href="<%=request.getContextPath()%>/" class="hiper-tag" style="font-family: 'Do Hyeon', sans-serif;">홈</a>
            </div>
           <div class="list-hiper"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;" href="<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>">마이페이지</a></div> 
      <!-- </ul> -->
      <%} else { %>
      <!-- <ul class="side-bar-kdh"> -->

        <div class="cstmt-list">
          <a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/admin/adminCustomerList?a=0">문의보기</a></div>
        <div class="cstmt-list"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/notice/noticeList">소식보기</a></div>

        <div class="cstmt-list"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;"
            href="<%=request.getContextPath() %>/customerFaq">FAQ</a></div>
            <div class="list-hiper"><a href="<%=request.getContextPath()%>/" class="hiper-tag" style="font-family: 'Do Hyeon', sans-serif;">홈</a>
            </div>

             <div class="list-hiper"><a class="main-a" style="font-family: 'Do Hyeon', sans-serif;" href="<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>">마이페이지</a></div>
      <!-- </ul> -->
      <%} %>


     
              

    </div>
   <!-- </div> -->
  </div>
