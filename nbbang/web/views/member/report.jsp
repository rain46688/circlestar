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
    input.reportInfo{
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
                <div>
                    <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>">내 신고 내역</a>
                </div>
            </div>
        </div>
        <div id="iCreateContainer">
            <div class="item textField" id="containerTitle">
                <div id="modifyProfile" style="font-size: 24px; padding: 5px; padding-bottom: 0;margin-bottom: 20px; text-align: left;" >신고하기</div>
            </div>
            <div class="item textField" style="margin-left: 1%;">
                <form action="<%=request.getContextPath() %>/member/reportSend" id="reportForm" name="reportForm" method="post" enctype="multipart/form-data"> 
                    <div class="fieldCapsule">
                        <div style="font-size: 18px;">
                            신고할 게시글 정보
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            <input type="text" class="reportInfo" value="글번호" readonly>
                        </div>
                        <div class="capsuleRight">
                            <input type="text" class="reportInfo" name="rboardId" value="<%=boardData.getBoardId()%>" readonly>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            <input type="text" class="reportInfo" value="신고할 게시물 제목" readonly>
                        </div>
                        <div class="capsuleRight">
                            <input type="text" class="reportInfo" id="rtitle" name="rtitle" value="<%=boardData.getBoardTitle()%>" readonly>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft">
                            <input type="text" class="reportInfo" value="신고할 회원" readonly>
                        </div>
                        <div class="capsuleRight">
                            <input type="text" class="reportInfo" value="<%=boardData.getWriterNickname()%>" readonly>
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
                            <input type="text" class="reportInfo" value="신고유형" readonly>
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <select name="rtype" id="rtype">
                                <option>선택</option>
                                <option value="홍보성">홍보성</option>
                                <option value="권리침해">권리침해</option>
                                <option value="선정성">선정성</option>
                                <option value="인신공격">인신공격</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            <input type="text" class="reportInfo" value="제목" readonly>
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <input type="text" id="reportTitle" name="reportTitle" placeholder="제목을 입력해주세요">
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            <input type="text" class="reportInfo" value="내용" readonly>
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <textarea id="rcontent" name="rcontent" cols="30" rows="10" placeholder="신고 내용을 상세하게 적어주세요."></textarea>
                        </div>
                    </div>
                    <div class="fieldCapsule">
                        <div class="capsuleLeft" style="width: 20%;">
                            <input type="text" class="reportInfo" value="파일첨부" readonly>
                        </div>
                        <div class="capsuleRight" style="width: 80%;">
                            <input type="file" name="rfile">
                        </div>
                    </div>
                   
                    <div style="text-align: center; margin-top: 1%;">
                        <button type="button" class="button" onclick="fn_reportSend();">신고하기</button>
                        <button type="button" class="button" onclick="history.back();">취소</button>
                    </div>
                    <input type="hidden" name="rusid" value="<%=user.getUsid()%>">
                    <input type="hidden" name="rnickname" value="<%=user.getNickname()%>">
                    <input type="hidden" name="rtargetUsid" value="<%=target.getUsid()%>">
                    <input type="hidden" name="rtargetNickname" value="<%=target.getNickname()%>">
                </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function fn_reportSend(){
            if($("#rtype").val()=='선택' || $("#rtype").val()==null){
                alert("신고유형을 선택해주세요.");
            }else if($("#reportTitle").val().trim()===''){
                alert("제목을 입력해주세요.");
            }else if($("#rcontent").val().trim()===''){
                alert("내용을 입력해주세요.");
            }else{
            $("#reportForm").submit();
            }
        }
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>