<%@page import="com.nbbang.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%
    Member loginnedMember=(Member)session.getAttribute("loginnedMember");
    %>
        <div id="myPageSideBar">
            <div id="sideBarTitleContainer">
                <p id="sideBarTitle">마이 페이지</p>
                <p id="sideBarText">N빵은 고객님의<br>돈과 시간을<br>N빵해드립니다.</p>
            </div>
            <div id="sideBarLinkContainer">
                <div>
                    <a class="nav-link postList" id="1" href="<%=request.getContextPath()%>/member/iCreateList?usid=<%=loginnedMember.getUsid()%>">내가 만든 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" id="2" href="<%=request.getContextPath()%>/member/waitList?usid=<%=loginnedMember.getUsid()%>">신청한 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" id="3" href="<%=request.getContextPath()%>/member/onGoingList?usid=<%=loginnedMember.getUsid()%>">시작된 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" id="4" href="<%=request.getContextPath()%>/member/pastList?usid=<%=loginnedMember.getUsid()%>">과거 거래 내역</a>
                </div>
                <div style="margin-bottom: 1.3em;">
                    <a class="nav-link postList" id="5" href="<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>">좋아요 한 게시글</a>
                </div>
                <div>
                    <a class="nav-link postList" id="6" href="<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>">프로필 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" id="7" href="<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>">비밀번호 수정하기</a>
                </div>
                <div style="margin-bottom: 1.3em;">
                    <a class="nav-link postList" id="8" href="<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>">개인정보 확인하기</a>
                </div>
                <div>
                    <a class="nav-link postList" id="9" href="<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>">내 신고 내역</a>
                </div>
                      <div>
                    <a class="nav-link postList" id="10" href="<%=request.getContextPath()%>/member/customerList?usid=<%=loginnedMember.getUsid()%>">내 문의 내역</a>
                </div>
            </div>
        </div>