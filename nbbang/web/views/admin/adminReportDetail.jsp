<%@page import="com.nbbang.board.model.vo.Board, com.nbbang.member.model.vo.Report"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
    Report rd=(Report)request.getAttribute("reportDetail");
    Board boardData=(Board)request.getAttribute("boardData");
%>
<style>
    div#modifyProfile{
        font-family: 'Do Hyeon', sans-serif;
    }
    div#iCreateContainer{
        position: relative;
        background: #FFFFFF;
        text-align: center;
        margin: 3% 20% 5% 20%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 60%;
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
    }
</style>
<section>
    <div id="myPageWrapper">
        <div id="iCreateContainer">
            <div class="item textField" id="containerTitle">
                <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0;margin-bottom: 20px; text-align: left;" >신고 접수 내역</div>
            </div>
            <div class="item textField" style="margin:0 1%;">
                <div class="fieldCapsule">
                    <div style="font-size: 18px;">
                        신고당한 게시글 정보
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
                        신고당한 게시물 제목
                    </div>
                    <div class="capsuleRight">
                        <%=boardData.getBoardTitle()%>
                    </div>
                </div>
                <div class="fieldCapsule">
                    <div class="capsuleLeft">
                        신고당한 회원
                    </div>
                    <div class="capsuleRight">
                        <%=boardData.getWriterNickname()%>
                        <form id="warnFrm" action="<%=request.getContextPath()%>/warning">
                            <button type="button" class="button" id="warnBtn" onclick="fn_warning();" style="margin-left: 1%;">경고주기</button>
                            <input type="hidden" id="reboardId" name="reboardId" value="<%=rd.getReportId()%>">
                        </form>
                    </div>
                </div>
            </div> 
            <div class="item textField" style="margin:0 1%;">
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
                    <%if(rd.getReportFile()!=null){%>
                        <div class="capsuleRight" style="width: 80%; cursor: pointer;"
                        onclick="location.href='<%=request.getContextPath()%>/member/reportFileDownload?fname=<%=rd.getReportFile()%>'">
                            <%=rd.getReportFile() %>
                        </div>
                    <%}else{%>
                        <div class="capsuleRight" style="width: 80%;">
                            첨부한 파일이 없습니다.
                        </div>
                    <%}%>
                </div>
                <%if(rd.getReportFile()!=null){%>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            첨부파일 미리보기
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <img src="<%=memberPic+rd.getReportFile()%>">
                        </div>
                    </div>
                <%}%>
            </div>
            <div class="item textField"  style="margin:0 1%;">
                <div style="height: 20px;"> </div>
                <div class="fieldCapsule">
                    <div style="font-size: 18px;">
                        관리자 답변
                    </div>
                </div>
                <%if(rd.getReportAnswer()==null){%>
                <form id="reportAnswerForm" action="<%=request.getContextPath()%>/member/reportAnswer" method="post">
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 100%; text-align: center;">
                            <textarea id="ranswer" name="ranswer" cols="30" rows="6" maxlength="500" placeholder="답변을 적어주세요."></textarea>
                            <button type="button" class="button" onclick="fn_reportAnswer();">답변전송</button>
                            <input type="hidden" id="rboardId" name="rboardId" value="<%=rd.getReportId()%>">
                        </div>
                    </div>
                </form>
                <%}else {%>
                    <div class="capsuleLeft" style="width: 100%;">
                        <%=rd.getReportAnswer()%>	
                    </div>
                <%}%>
            </div>
            <div style="text-align: center; margin-top: 2%;">
                <button type="button" class="button" style="margin-top: 1%;"
                onclick="location.href='<%=request.getContextPath()%>/admin/adminReportList?a=0'">목록으로</button>
            </div>
        </div>
    </div>
    <script>
        function fn_reportAnswer(){
            if($("#ranswer").val().trim()===''){
                alert("답변을 입력해주세요.");
            }else{
                $("#reportAnswerForm").submit();
            }
        }
        function fn_warning(){
            $("#warnFrm").submit();
        }
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>