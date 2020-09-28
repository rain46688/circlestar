<%@page import="com.nbbang.board.model.vo.Board, com.nbbang.member.model.vo.Report"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
    Report rd=(Report)request.getAttribute("reportDetail");
    Board boardData=(Board)request.getAttribute("boardData");
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
        margin: 3% 23% 5% 0%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 40%;
        float: right;
    }
    div .item *{
        width:100%;
        text-align: left;
        font-size: 16px;
    }
    a.active{
        font-weight: bold;
    }
    nav.listPageBar{
        text-align: center;
        margin: 0;
    }
    ul.pagination{
        text-align: center;
    }
    div.reportInfo{
        border: none;
        width: 100%;
    }
    div.fieldCapsule{
        display: flex;
        position: relative;
    }
    div.capsuleLeft{
        width: 30%;
        float: left;
        border-bottom: black 1px solid;
        padding: 1%;
    }
    div.capsuleRight{
        width: 70%;
        float: left;
        border-bottom: black 1px solid;
        padding: 1%;
    }
    input#rtitle{
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
        <%if(loginnedMember.getUsid()!=9999){%>
            <div id="iCreateContainer">
                <div class="item textField" id="containerTitle">
                    <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0;margin-bottom: 20px; text-align: left;" >신고내역</div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            신고한 게시글 정보
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            글번호
                        </div>
                        <div class="capsuleRight">
                            <%=boardData.getBoardId()%>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            신고한 게시물 제목
                        </div>
                        <div class="capsuleRight">
                            <%=boardData.getBoardTitle()%>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            신고한 회원
                        </div>
                        <div class="capsuleRight">
                            <%=boardData.getWriterNickname()%>
                        </div>
                    </div>
                </div> 
                <div class="item textField" style="margin-left: 1%;">
                    <div style="height: 20px;"> </div>
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            상세내용
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            신고유형
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportType()%>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            제목
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportTitle() %>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            내용
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportContent() %>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            첨부한 파일
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportFile() %>
                        </div>
                    </div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <div style="height: 20px;"> </div>
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            관리자 답변
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <%if(rd.getReportAnswer()==null){%>
                        <div class="capsuleLeft" style="width: 100%;">
                            아직 관리자로부터 받은 답변이 없습니다.
                        </div>
                        <%}else {%>
                        <div class="capsuleLeft" style="width: 100%;">
                            <%=rd.getReportAnswer()%>	
                        </div>
                        <%}%>
                    </div>
                </div>
                <div style="text-align: center; margin-top: 2%;">
                    <button type="button" class="button" 
                    onclick="location.href='<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>'">목록으로</button>
                </div>
            </div>
        <%}else{%>
            <div id="iCreateContainer">
                <div class="item textField" id="containerTitle">
                    <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0;margin-bottom: 20px; text-align: left;" >신고 접수 내역</div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            신고한 게시글 정보
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            글번호
                        </div>
                        <div class="capsuleRight">
                            <%=boardData.getBoardId()%>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            신고한 게시물 제목
                        </div>
                        <div class="capsuleRight">
                            <%=boardData.getBoardTitle()%>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            신고한 회원
                        </div>
                        <div class="capsuleRight">
                            <%=boardData.getWriterNickname()%>
                        </div>
                    </div>
                </div> 
                <div class="item textField" style="margin-left: 1%;">
                    <div style="height: 20px;"> </div>
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            상세내용
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            신고유형
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportType()%>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            제목
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportTitle() %>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            내용
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <%=rd.getReportContent() %>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            첨부한 파일
                        </div>
                        <%if(rd.getReportFile()==null){%>
                            <div class="capsuleRight" style="width: 80%;">
                                첨부된 파일이 없습니다.
                            </div>
                        <%}else{%>
                            <div class="capsuleRight" style="width: 80%;">
                                <%=rd.getReportFile() %>
                            </div>
                        <%}%>
                    </div>
                </div>
                <div class="item textField" style="margin-left: 1%;">
                    <div style="height: 20px;"> </div>
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            관리자 답변
                        </div>
                    </div>
                    <form id="reportAnswerForm" action="<%=request.getContextPath()%>/member/reportAnswer" method="post">
                        <div class="fieldCapsule">
                            <div class="capsuleLeft" style="width: 100%; text-align: center;">
                                <textarea id="ranswer" name="ranswer" cols="30" rows="6" maxlength="500" placeholder="답변을 적어주세요."></textarea>
                                <button type="button" class="button" style="margin-left: -5px;" onclick="fn_reportAnswer();">답변전송</button>
                                <input type="hidden" name="rboardId" value="<%=rd.getReportId()%>">
                            </div>
                        </div>
                    </form>
                </div>
                <div style="text-align: center; margin-top: 2%;">
                    <button type="button" class="button" 
                    onclick="location.href='<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>'">목록으로</button>
                </div>
            </div>
        <%}%>
    </div>
    <script>
        function fn_reportAnswer(){
            if($("#ranswer").val().trim()===''){
                alert("답변을 입력해주세요.");
            }else{
                $("#reportAnswerForm").submit();
            }
        }
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>