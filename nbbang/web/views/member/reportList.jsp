<%@page import="com.nbbang.member.model.vo.Report"%>
<%@page import="com.nbbang.board.model.vo.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
    Member m=(Member)request.getAttribute("member");
    List<Report> rlist=(List<Report>)request.getAttribute("memberReportList");
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

    div#modifyProfile{
        font-family: 'Do Hyeon', sans-serif;
    }
    div#iCreateContainer{
        position: relative;
        background: #FFFFFF;
        text-align: center;
        margin: 3% 8% 5% 0%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 55%;
        float: right;
    }
    div .item *{
        width:100%;
        text-align: center;
        font-size: 16px;
    }
    a.active{
        font-weight: bold;
    }
    nav.listPageBar{
        text-align: center;
        margin-top: 3%;
    }
    ul.pagination{
        text-align: center;
    }
    div.fieldCapsule{
        display: flex;
        position: relative;
    }
    div.capsuleLeft{
        float: left;
        border-bottom: black 1px solid;
        padding: 1%;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
    button.button{
        outline: none;
        background: #735020;
        width: 10%;
        min-width: 40px;
        border: none;
        padding: 5px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        margin: 5px 0;
    }
</style>
<section>
    <div id="myPageWrapper">
        <div id="myPageSideBar">
            <div id="sideBarTitleContainer">
                <p id="sideBarTitle">마이 페이지</p>
                <p id="sideBarText">N빵은 고객님의<br>돈과 시간을<br>N빵해드립니다.</p>
            </div>
            <div id="sideBarLinkContainer">
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/iCreateList?usid=<%=loginnedMember.getUsid()%>">내가 만든 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/waitList?usid=<%=loginnedMember.getUsid()%>">신청한 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/onGoingList?usid=<%=loginnedMember.getUsid()%>">시작된 거래</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/pastList?usid=<%=loginnedMember.getUsid()%>">과거 거래 내역</a>
                </div>
                <div style="margin-bottom: 1.3em;">
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>">좋아요 한 게시글</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>">프로필 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>">비밀번호 수정하기</a>
                </div>
                <div style="margin-bottom: 1.3em;">
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>">개인정보 확인하기</a>
                </div>
                <%if(loginnedMember.getUsid()==9999){%>
                    <div>
                        <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>">신고 접수 내역</a>
                    </div>
                <%}else{%>
                <div>
                    <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>">내 신고 내역</a>
                </div>
                <%}%>
            </div>
        </div>
        <%if(loginnedMember.getUsid()==9999){%>
            <div id="iCreateContainer">
                <div class="item textField" id="containerTitle">
                    <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0; text-align: left;" >신고 접수 내역</div>
                    <div style="font-size: 16px; padding-left: 10px; text-align: left;" >접수된 신고 목록입니다.</div>
                </div>
                <div class="item textField" style="margin-left: 1%; margin-top: 3%;">
                        <div class="fieldCapsule">
                            <div class="capsuleLeft" style="width: 10%; border-top: black 1px solid;" >
                                글번호
                            </div>
                            <div class="capsuleLeft" style="width: 13%; border-top: black 1px solid;">
                                신고유형
                            </div>
                            <div class="capsuleLeft" style="width: 47%; border-top: black 1px solid;">
                                글제목
                            </div>
                            <div class="capsuleLeft" style="width: 13%; border-top: black 1px solid;">
                                신고일
                            </div>
                            <div class="capsuleLeft" style="width: 15%; border-top: black 1px solid;">
                                관리자 답변 여부
                            </div>
                        </div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <%for(Report r:rlist){ %>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 10%;">
                            <%=r.getReportId() %>
                        </div>
                        <div class="capsuleLeft" style="width: 13%;">
                            <%=r.getReportType() %>
                        </div>
                        <div class="capsuleLeft" style="width: 47%;">
                            <%=r.getReportTitle() %>
                        </div>
                        <div class="capsuleLeft" style="width: 13%;">
                            <%=r.getReportDate() %>
                        </div>
                        <%if(r.getReportAnswer()==null){ %> 
                            <div class="capsuleLeft" style="width: 15%;">
                                N
                            </div>
                        <%}else{%>
                            <div class="capsuleLeft" style="width: 15%;">
                                Y
                            </div>
                        <%} %>
                    </div>
                    <%}%>
                </div> 
                <nav aria-lable="Page navigation" class="listPageBar">
                    <ul class="pagination justify-content-center">
                        <%=request.getAttribute("pageBar")%>
                    </ul>
                </nav>
            </div>
        <%}else{%> 
            <div id="iCreateContainer">
                <div class="item textField" id="containerTitle">
                    <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0; text-align: left;" >내 신고 내역</div>
                    <div style="font-size: 16px; padding-left: 10px; text-align: left;" >나의 신고 내용과 관리자의 답변을 확인할 수 있습니다.</div>
                </div>
                <div class="item textField" style="margin-left: 1%; margin-top: 3%;">
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 10%; border-top: black 1px solid;">
                            글번호
                        </div>
                        <div class="capsuleLeft" style="width: 13%; border-top: black 1px solid;">
                            신고유형
                        </div>
                        <div class="capsuleLeft" style="width: 47%; border-top: black 1px solid;">
                            글제목
                        </div>
                        <div class="capsuleLeft" style="width: 13%; border-top: black 1px solid;">
                            신고일
                        </div>
                        <div class="capsuleLeft" style="width: 15%; border-top: black 1px solid;">
                            관리자 답변 여부
                        </div>
                    </div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <%for(Report r:rlist){ %>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 10%;">
                            <%=r.getReportId() %>
                        </div>
                        <div class="capsuleLeft" style="width: 13%;">
                            <%=r.getReportType() %>
                        </div>
                        <div class="capsuleLeft" style="width: 47%;">
                            <%=r.getReportTitle() %>
                        </div>
                        <div class="capsuleLeft" style="width: 13%;">
                            <%=r.getReportDate() %>
                        </div>
                        <%if(r.getReportAnswer()==null){ %> 
                            <div class="capsuleLeft" style="width: 15%;">
                                N
                            </div>
                        <%}else{%>
                            <div class="capsuleLeft" style="width: 15%;">
                                Y
                            </div>
                        <%} %>
                    </div>
                    <%}%>
                </div> 
                <nav aria-lable="Page navigation" class="listPageBar">
                    <ul class="pagination justify-content-center">
                        <%=request.getAttribute("pageBar")%>
                    </ul>
                </nav>
            </div>
        <%}%>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>