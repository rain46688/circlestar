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
        margin: 5% 35%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 30%;
        
    }
    div .item *{
        width:100%;
        text-align: center;
    }
    form#memberInfoForm button{
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
    div#memberInfoContainer .textField{
        padding: 1%;
    }
    div#memberInfoContainer .input{
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
</style>
<section>
    <form id="memberInfoForm" action="<%=request.getContextPath()%>/memberInfoCpl" method="post"">
        <div id="memberInfoContainer" style="padding-top: 50px;">
            <div class="item textField" id="containerTitle">
                <h2 id="updatePwTitle" style="margin-bottom: 40px;" >나의 정보</h2>
            </div>

            <div class="item textField">
                <div>
                    <div>아이디</div>
                    <div><%=m.getMemberId()%></div>
                </div>
            </div>

            <div class="item textField">
                <div>
                    <div>이름</div>
                    <div><%=m.getMemberName()%></div>
                </div>
            </div>

            <div class="item textField">
                <div>
                    <div>성별</div>
                    <div><%=m.getGender()%></div>
                </div>
            </div>

            <div class="item textField">
                <div>
                    <div>생년월일</div>
                    <div><%=m.getBirthday()%></div>
                </div>
            </div>

            <div class="item textField">
                <div>휴대폰 번호</div>
                <div><%=m.getPhone()%></div>
            </div>

            <div class="item textField">
                <div>주소</div>
                <div><%=m.getAddress()%></div>
            </div>

            <div id="btnsField" class="item button">
                <button type="button" onclick="fn_modifyInfo();">수정하기</button>
                <button type="button" onclick="history.back();">뒤로가기</button>
            </div>
            <input type="hidden" name="usid" value="<%=m.getUsid()%>">
            <input type="hidden" name="realPw" value="<%=m.getMemberPwd()%>">
        </div>
    </form>
    <script>
		
    </script>
</section>
<%@ include file="/views/common/footer.jsp" %>