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
        font-family: 'Do Hyeon', sans-serif;
    }
    div#sideBarTitleContainer{
        background-color: rgb(243, 183, 24);
        padding: 6%;
        color: white;
        border: 1px black solid;
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
        border: 1px black solid;
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
    div#updatePwContainer{
        position: relative;
	    background: #FFFFFF;
	    text-align: center;
        margin: 3% 31% 5% 1%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 30%;
        float: right;
    }
    div .item *{
        width:100%;
        text-align: center;
    }
    form#updatePwForm button{
        outline: none;
        background: #735020;
        width: 38%;
        border: none;
        margin: 0 1% 20%;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
    }
    div#updatePwContainer .textField{
        padding: 1%;
    }
    div#updatePwContainer .input{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 80%;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
        text-align: left;
    }
    div.constrain{
        margin-top: -15px;
        margin-bottom: 15px;
        margin-left: 70px;
        font-size: 12px;
        color: red;
        display: none;
        text-align: left;
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
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>">좋아요 한 게시글</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>">프로필 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList active" href="<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>">비밀번호 수정하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>">개인정보 확인하기</a>
                </div>
            </div>
        </div>
        <div id="updatePwContainer">
            <form id="updatePwForm" action="<%=request.getContextPath() %>/member/updatePwCpl" method="post"">
                <div class="item textField" id="containerTitle">
                    <h2 id="modifyProfile" style="margin-bottom: 40px;" >비밀번호 변경하기</h2>
                </div>

                <div class="item textField">
                    <input type="password" class="input" id="crtPw" name="crtPw" placeholder="현재 비밀번호">
                </div>
                <div class="constrain" id="crtPwConstrain"></div>

                <div class="item textField">
                    <input type="password" class="input" id="newPw" name="newPw" placeholder="새로운 비밀번호">
                </div>
                <div class="constrain" id="newPwConstrain"></div>

                <div class="item textField">
                    <input type="password" class="input" id="newPw2" name="newPw2" placeholder="새로운 비밀번호 확인">
                </div>
                <div class="constrain" id="newPwConstrain2"></div>

                <div id="btnsField" class="item button">
                    <button type="button" onclick="fn_updatePw();">변경하기</button>
                    <button type="button" onclick="location.href='<%=request.getContextPath()%>/member/myPage?usid=<%=m.getUsid()%>'">취소</button>
                </div>
                <input type="hidden" name="usid" value="<%=m.getUsid()%>">
                <input type="hidden" name="realPw" value="<%=m.getMemberPwd()%>">
            </form>
        </div>
    </div>
    <script>
		var pwPattern = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{4,16}$/;
		$(function(){
            $("#crtPw").blur(e=>{
				const crtPw=$("#crtPw").val().trim();
				if(crtPw===""){
					$("#crtPwConstrain").html("필수 입력 항목입니다.");
					$("#crtPwConstrain").css({"display":"block"});
				}else{
                    $("#crtPwConstrain").css({"display":"none"});
                }
			});
            $("#crtPw").keyup(function(e){
				const crtPw=$("#crtPw").val().trim();
				if(crtPw===""){
					$("#crtPwConstrain").html("필수 입력 항목입니다.");
					$("#crtPwConstrain").css({"display":"block"});
				}else{
                    $("#crtPwConstrain").css({"display":"none"});
                }
			});
            $("#newPw").blur(e=>{
				const newPw=$("#newPw").val().trim();
				if(newPw===""){
					$("#newPwConstrain").html("필수 입력 항목입니다.");
					$("#newPwConstrain").css({"display":"block"});
				}
			})
			$("#newPw").keyup(function(e){
				const newPw=$("#newPw").val().trim();
				const newPw2=$("#newPw2").val().trim();
				if(!pwPattern.test(newPw)){
					$("#newPwConstrain").html("4~16자 영문, 숫자를 혼합하여 입력해주세요");
					$("#newPwConstrain").css({"display":"block"});
				}else{
					$("#newPwConstrain").css({"display":"none"});
				}				
				if(newPw!=newPw2){
					$("#newPwConstrain2").html("비밀번호 확인을 해주세요.");
					$("#newPwConstrain2").css({"display":"block"});
				}
			});
			$("#newPw2").blur(e=>{
				const newPw=$("#newPw").val().trim();
				const newPw2=$("#newPw2").val().trim();
				if(newPw2===""){
					$("#newPwConstrain2").html("비밀번호 확인을 해주세요.");
					$("#newPwConstrain2").css({"display":"block"});
				}else if(newPw!=newPw2){
					$("#newPwConstrain2").html("비밀번호가 일치하지 않습니다.");
					$("#newPwConstrain2").css({"display":"block"});
				}
			})
			$("#newPw2").keyup(function(e){
				const newPw=$("#newPw").val().trim();
				const newPw2=$("#newPw2").val().trim();
				if(newPw!=newPw2){
					$("#newPwConstrain2").html("비밀번호가 일치하지 않습니다.");
					$("#newPwConstrain2").css({"display":"block"});
				}else{
					$("#newPwConstrain2").css({"display":"none"});
				}
			});
		});
        function fn_updatePw(){
            const crtPw=$("#crtPw").val().trim();
            const newPw=$("#newPw").val().trim();
			const newPw2=$("#newPw2").val().trim();
            if(crtPw!=="" && (newPw!==""&&pwPattern.test(newPw)) && (newPw2!==""&&newPw===newPw2)){
                $("#updatePwForm").submit();
            }else{
				alert("필수 입력 항목을 확인해주세요.");
			}
        };
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>