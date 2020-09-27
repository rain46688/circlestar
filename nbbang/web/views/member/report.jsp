<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Board boardData=(Board)request.getAttribute("boardData");
	Member user=(Member)request.getAttribute("user");
	Member target=(Member)request.getAttribute("target");
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
        margin: 3% 12% 5% 0%;
        /* 세로정렬꽉차게 가운데:center */
        /*align-items: stretch;*/
        /* 가로정렬꽉차게 가운데:center */
        /*justify-items: stretch;*/
        width: 51%;
        float: left;
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
    
    div#fieldCapsule{
        display: flex;
        position: relative;
        padding: 3%;
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
                <div>
                    <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>">내 신고 내역</a>
                </div>
            </div>
        </div>
        <div id="iCreateContainer">
            <div class="item textField" id="containerTitle">
                <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0;margin-bottom: 20px; text-align: left;" >신고하기</div>
            </div>
            <form action="<%=request.getContextPath() %>/member/reportSend" id="reportForm" name="reportForm" method="post">
                <div id="fieldCapsule">
                    <div>
                        신고유형
                        <select name="rtype">
                            <option>선택</option>
                            <option value="홍보성">홍보성</option>
                            <option value="권리침해">권리침해</option>
                            <option value="선정성">선정성</option>
                            <option value="인신공격">인신공격</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>
                    <div>
                        신고할 게시물 번호<input type="text" name="rboardId" value="<%=boardData.getBoardId()%>" readonly>
                    </div>
                    <div>
                        제목<input type="text" name="reportTitle">
                    </div>
                    <div>
                        신고할 게시물 제목<input type="text" name="rtitle" value="<%=boardData.getBoardTitle()%>" readonly>
                    </div>
                    <div>
                        신고할 회원<input type="text" value="<%=boardData.getWriterNickname()%>" readonly>
                    </div>
                    <div>
                        <div>
                            <textarea name="rcontent" id="" cols="30" rows="10">신고 내용을 상세하게 적어주세요</textarea>
                            <input type="file" name="rfile">
                        </div>
                        <div>
                            <button type="button" onclick="fn_reportSend();">신고하기</button>
                            <button type="reset" onclick="history.back();">취소</button>
                        </div>
                    </div>
                    <input type="hidden" name="rusid" value="<%=user.getUsid()%>">
                    <input type="hidden" name="rnickname" value="<%=user.getNickname()%>">
                    <input type="hidden" name="rtargetUsid" value="<%=target.getUsid()%>">
                    <input type="hidden" name="rtargetNickname" value="<%=target.getNickname()%>">
                </div>
                    <nav aria-lable="Page navigation" class="listPageBar">
                        <ul class="pagination justify-content-center">
                            <%=request.getAttribute("pageBar")%>
                        </ul>
                    </nav>
                </div>
            </form>
        </div>
    </div>
    <script>
        function fn_reportSend(){
            $("#reportForm").submit();
        }
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>