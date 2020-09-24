<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
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
    }
    div#sideBarTitleContainer{
        background-color: rgb(243, 183, 24);
        padding: 6%;
        color: white;
    }
    p#sideBarTitle{
        font-size: 2em;
        font-weight: bold;
        margin-top: 10%;
    }
    p#sideBarText{
        font-size: 1em;
        font-weight: bold;
        margin-bottom: 10%;
    }
    div#sideBarLinkContainer{
        border: darkgrey 1px solid;
        border-top: none;
        padding: 10%;
    }
    .postList{
        font-size: 1em;
        text-align: left;
    }
    .postList:hover{
        color: rgb(243, 183, 24);
    }
    
    div#iCreateContainer{
        position: relative;
        background: #FFFFFF;
        text-align: left;
        margin: 3% 10% 5% 2%;
        /* 세로정렬꽉차게 가운데:center */
        /*align-items: stretch;*/
        /* 가로정렬꽉차게 가운데:center */
        /*justify-items: stretch;*/
        width: 51%;
        float: left;
    }
    div.card{
        padding: 0;
        margin: 0 3% 3% 0;
        width:25%;
    }
    div.card-body{
        padding: 0 2%;
    }

    .card-img-top {
        width: 100%;
        height: 10vw;
        object-fit: cover;
    }
    a.active{
        font-weight: bold;
    }
</style>
<section>
    <div id="myPageWrapper">
        <div id="myPageSideBar">
            <div id="sideBarTitleContainer">
                <p id="sideBarTitle">마이 페이지</p>
                <p class="sideBarText">N빵은 고객님의<br>돈과 시간을<br>N빵해드립니다.</p>
            </div>
            <div id="sideBarLinkContainer">
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/iCreateList?usid=<%=loginnedMember.getUsid()%>">내가 만든 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/waitList?usid=<%=loginnedMember.getUsid()%>">신청한 거래</a>
                </div>
                <div>
                    <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/onGoingList?usid=<%=loginnedMember.getUsid()%>">시작된 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/pastList?usid=<%=loginnedMember.getUsid()%>">과거 거래 내역</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>">좋아요 한 게시글</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>">프로필 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>">비밀번호 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>">개인정보 확인하기</a>
                </div>
            </div>
        </div>
        
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>