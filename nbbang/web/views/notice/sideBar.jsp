<%@page import="com.nbbang.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

div#myPageSideBar{
        position: relative;
        background: white;
        text-align: center;
        margin: 3% 3% 3% 20%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 14%;
        float: left;
        font-family: 'Do Hyeon', sans-serif;
    }
    div#sideBarTitleContainer{
        background-color: rgb(243, 183, 24);
        padding: 6%;
        color: white;
        border: 2px black solid;
    }
    p#sideBarTitle{
        font-size: 2.5em;
        margin-top: 10%;
    }
    p#sideBarText{
        font-size: 1.3em;
        margin-bottom: 10%;
    }
    div#sideBarLinkContainer{
        border: darkgrey 1px solid;
        border-top: none;
        padding: 10%;
        border: 2px black solid;
        border-top: none;
    }
    .postList{
        font-size: 1.3em;
        text-align: left;
    }
    .postList:hover{
        color: rgb(243, 183, 24);
    }


</style>
    
    
    
    <%
    Member loginnedMember=(Member)session.getAttribute("loginnedMember");
    %>
    
<div id="myPageSideBar">
            <div id="sideBarTitleContainer">
                <p id="sideBarTitle">고객센터</p>
                <p class="sideBarText">N빵은 고객님의<br><span>고민을</span><br>N빵해드립니다.</p>
            </div>
            <div id="sideBarLinkContainer">
                             <% if(!loginnedMember.getNickname().equals("ADMIN")) {%>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/customer/customerQnA">문의하기</a>
                </div>
                       <%} %>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/notice/noticeList">소식보기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/customerFaq">FAQ</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>#">홈</a>
                </div>
                         <% if(!loginnedMember.getNickname().equals("ADMIN")) {%>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>">마이페이지</a>
                </div>
                <%} %>
            </div>