<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<style>
    div#memberInfoContainer{
        position: relative;
	    background: #FFFFFF;
	    text-align: center;
        margin: 5% 30%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 40%;
    }
    div .item *{
        width:100%;
        text-align: left;
        font-size: 16px;
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
    div.constrain{
        margin-top: -10px;
        margin-bottom: -15px;
        margin-left: 5px;
        font-size: 12px;
        color: red;
        display: none;
        text-align: left;
	}
    div.fieldCapsule{
        display: flex;
        position: relative;
    }
    div.capsuleLeft{
        width: 20%;
        min-height: 70px;
        float: left;
        /* border-right: black 1px solid; */
        border-bottom: black 1px solid;
        padding: 10px;
    }
    div.capsuleRight{
        width: 70%;
        min-height: 70px;
        float: right;
        border-bottom: black 1px solid;
        padding: 10px;
    }
</style>
<section>
    <div id="memberInfoContainer">
        <div class="item textField" id="containerTitle">
            <div id="updatePwTitle" style="margin-bottom: 20px; font-size: 24px; padding: 5px;" >나의 정보</div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft" style="border-top: black 1px solid;">아이디</div>
                <div class="capsuleRight" style="border-top: black 1px solid;"><%=m.getMemberId()%></div>
            </div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft">이름</div>
                <div class="capsuleRight"><%=m.getMemberName()%></div>
            </div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft">성별</div>
                <div class="capsuleRight"><%=m.getGender()%></div>
            </div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft">생년월일</div>
                <div class="capsuleRight"><%=m.getBirthday()%></div>
            </div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft">휴대폰 번호</div>
                <div class="capsuleRight">
                    <div>
                        <%=m.getPhone()%>
                    </div>
                    <div>
                        <button type="button" class="button" id="phoneBtn">수정</button>
                    </div>
                    <div id="updatePhone"></div>
                </div>
            </div>
        </div>

        <div class="item textField">
            <div class="fieldCapsule">
                <div class="capsuleLeft">주소</div>
                <div class="capsuleRight">
                    <div>
                        <%=m.getAddress()%>
                    </div>
                    <div>
                        <button type="button" class="button">수정</button>
                    </div>
                    <div></div>
                </div>
            </div>
        </div>
    </div>

    <script>
	    $("#phoneBtn").click(e=>{
	    	$.ajax({
                url:"<%=request.getContextPath()%>/ajax/updatePhone",
                type:"get",
                dataType:"html",
                success: data =>{
                    $("div#updatePhone").html(data);
                }
            })
            $("#phoneBtn").css({"display":"none"});
            $("#updatePhone").css({"display":"block"});
	    })
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>